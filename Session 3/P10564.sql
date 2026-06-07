-- set search_path to 'P10564';

-- solution
with MOM_changes as (
SELECT 
    product_id, product_name, month_start, monthly_active_users,
    CASE 
        WHEN LAG(monthly_active_users) OVER (PARTITION BY product_id ORDER BY month_start) < monthly_active_users THEN 'increase'
        WHEN LAG(monthly_active_users) OVER (PARTITION BY product_id ORDER BY month_start) > monthly_active_users THEN 'decrease'
        ELSE NULL -- This handles the first month (NULL) and any months with zero change
    END as momentum
FROM product_engagement
),
trough_data as (
select *,
	lag(momentum,2) over( partition by product_id order by month_start) as "2_month_prior",
	lag(momentum,1) over( partition by product_id order by month_start) as "1_month_prior",
	lead(momentum,1) over( partition by product_id order by month_start) as "1_month_ahead",
	lead(momentum,2) over( partition by product_id order by month_start) as "2_month_ahead",
	lead(momentum,3) over( partition by product_id order by month_start) as "3_month_ahead",
	lag(month_start, 3) over(partition by product_id order by month_start) as decline_started_month,
    lead(month_start, 1) over(partition by product_id order by month_start) as growth_resumed_month
from mom_changes
),
valid_data as(
select * from trough_data where 
	"2_month_prior"='decrease' and "1_month_prior"='decrease' and
	"1_month_ahead"='increase' and "2_month_ahead"='increase' and 
	"3_month_ahead"='increase' and momentum='decrease'
),
peak_data as (
select t1.product_id, t1.product_name, t1.decline_started_month,
	t1.growth_resumed_month, t1.monthly_active_users as lowest_users,
	max(t2.monthly_active_users) as peak_users
	from valid_data t1 join product_engagement t2 
on t1.product_id=t2.product_id 
	and t2.month_start>=t1.growth_resumed_month
group by t1.product_id, t1.product_name, t1.decline_started_month,
	t1.growth_resumed_month, t1.monthly_active_users
)


select product_name, decline_started_month, growth_resumed_month,
	round((peak_users-lowest_users)::NUMERIC/lowest_users,2) as growth_ratio
	from peak_data


-- Create the table
-- CREATE TABLE product_engagement (
--     product_id BIGINT,
--     product_name TEXT,
--     month_start DATE,
--     monthly_active_users BIGINT
-- );

-- -- Insert the sample data
-- INSERT INTO product_engagement (product_id, product_name, month_start, monthly_active_users) VALUES
-- (1, 'TikTok Lite', '2024-01-01', 50000),
-- (1, 'TikTok Lite', '2024-02-01', 45000),
-- (1, 'TikTok Lite', '2024-03-01', 38000),
-- (1, 'TikTok Lite', '2024-04-01', 35000),
-- (1, 'TikTok Lite', '2024-05-01', 37000),
-- (1, 'TikTok Lite', '2024-06-01', 42000),
-- (1, 'TikTok Lite', '2024-07-01', 48000),
-- (1, 'TikTok Lite', '2024-08-01', 55000),
-- (1, 'TikTok Lite', '2024-09-01', 65000),
-- (2, 'Instagram Reels', '2024-01-01', 80000),
-- (2, 'Instagram Reels', '2024-02-01', 75000),
-- (2, 'Instagram Reels', '2024-03-01', 68000),
-- (2, 'Instagram Reels', '2024-04-01', 60000),
-- (2, 'Instagram Reels', '2024-05-01', 62000),
-- (2, 'Instagram Reels', '2024-06-01', 70000),
-- (2, 'Instagram Reels', '2024-07-01', 78000),
-- (2, 'Instagram Reels', '2024-08-01', 85000),
-- (2, 'Instagram Reels', '2024-09-01', 100000),
-- (3, 'Facebook Dating', '2024-01-01', 30000),
-- (3, 'Facebook Dating', '2024-02-01', 28000),
-- (3, 'Facebook Dating', '2024-03-01', 25000),
-- (3, 'Facebook Dating', '2024-05-01', 24000),
-- (3, 'Facebook Dating', '2024-06-01', 23000),
-- (3, 'Facebook Dating', '2024-07-01', 25000),
-- (3, 'Facebook Dating', '2024-08-01', 27000),
-- (3, 'Facebook Dating', '2024-09-01', 29000),
-- (4, 'Twitter Spaces', '2024-01-01', 45000),
-- (4, 'Twitter Spaces', '2024-02-01', 42000),
-- (4, 'Twitter Spaces', '2024-03-01', 38000),
-- (4, 'Twitter Spaces', '2024-04-01', 32000),
-- (4, 'Twitter Spaces', '2024-05-01', 28000),
-- (4, 'Twitter Spaces', '2024-06-01', 25000),
-- (4, 'Twitter Spaces', '2024-07-01', 22000),
-- (4, 'Twitter Spaces', '2024-08-01', 20000),
-- (4, 'Twitter Spaces', '2024-09-01', 18000),
-- (5, 'YouTube Shorts', '2024-01-01', 90000),
-- (5, 'YouTube Shorts', '2024-02-01', 92000),
-- (5, 'YouTube Shorts', '2024-03-01', 95000),
-- (5, 'YouTube Shorts', '2024-04-01', 98000),
-- (5, 'YouTube Shorts', '2024-05-01', 105000),
-- (5, 'YouTube Shorts', '2024-06-01', 112000),
-- (5, 'YouTube Shorts', '2024-07-01', 120000),
-- (5, 'YouTube Shorts', '2024-08-01', 128000),
-- (5, 'YouTube Shorts', '2024-09-01', 135000),
-- (6, 'Snapchat Plus', '2024-01-01', 40000),
-- (6, 'Snapchat Plus', '2024-02-01', 38000),
-- (6, 'Snapchat Plus', '2024-03-01', 38000),
-- (6, 'Snapchat Plus', '2024-04-01', 38000),
-- (6, 'Snapchat Plus', '2024-05-01', 37000),
-- (6, 'Snapchat Plus', '2024-06-01', 40000),
-- (6, 'Snapchat Plus', '2024-07-01', 38000),
-- (6, 'Snapchat Plus', '2024-08-01', 41000),
-- (6, 'Snapchat Plus', '2024-09-01', 43000),
-- (7, 'LinkedIn Events', '2024-01-01', 35000),
-- (7, 'LinkedIn Events', '2024-02-01', 32000),
-- (7, 'LinkedIn Events', '2024-03-01', 28000),
-- (7, 'LinkedIn Events', '2024-04-01', 25000),
-- (7, 'LinkedIn Events', '2024-06-01', 30000),
-- (7, 'LinkedIn Events', '2024-07-01', 34000),
-- (7, 'LinkedIn Events', '2024-08-01', 38000),
-- (7, 'LinkedIn Events', '2024-09-01', 42000),
-- (8, 'Pinterest TV', '2024-01-01', 20000),
-- (8, 'Pinterest TV', '2024-02-01', 18000),
-- (8, 'Pinterest TV', '2024-04-01', 12000),
-- (8, 'Pinterest TV', '2024-05-01', 10000),
-- (8, 'Pinterest TV', '2024-06-01', 11000),
-- (8, 'Pinterest TV', '2024-07-01', 15000),
-- (8, 'Pinterest TV', '2024-08-01', 20000),
-- (8, 'Pinterest TV', '2024-09-01', 25000);




