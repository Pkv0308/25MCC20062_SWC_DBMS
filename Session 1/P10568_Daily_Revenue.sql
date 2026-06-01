set search_path to 'P10568';

-- CREATE TABLE product_sales (
--     transaction_id TEXT,
--     product_id TEXT,
--     country TEXT,
--     transaction_date DATE,
--     amount DOUBLE PRECISION,
--     status TEXT,
--     type TEXT,
--     original_transaction_id TEXT
-- );

-- INSERT INTO product_sales (transaction_id, product_id, country, transaction_date, amount, status, type, original_transaction_id) VALUES
-- ('TXN-10001', 'PROD-2891', 'US', '2025-04-15', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10002', 'PROD-2891', 'US', '2025-04-15', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10003', 'PROD-2891', 'CA', '2025-04-15', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10004', 'PROD-2891', 'US', '2025-04-17', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10005', 'PROD-2891', 'US', '2025-04-17', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10006', 'PROD-2891', 'US', '2025-04-17', 299.99, 'completed', 'purchase', NULL),
-- ('TXN-10007', 'PROD-3421', 'US', '2025-04-17', 299.99, 'completed', 'purchase', NULL),
-- ('TXN-10008', 'PROD-2891', 'US', '2025-04-18', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10010', 'PROD-2891', 'US', '2025-04-20', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10011', 'PROD-2891', 'US', '2025-04-20', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10012', 'PROD-2891', 'GB', '2025-04-20', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10013', 'PROD-2891', 'US', '2025-04-22', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10014', 'PROD-2891', 'US', '2025-04-23', 449.99, 'pending', 'purchase', NULL),
-- ('TXN-10015', 'PROD-2891', 'US', '2025-04-23', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10016', 'PROD-2891', 'US', '2025-04-24', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10017', 'PROD-2891', 'US', '2025-04-24', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10019', 'PROD-2891', 'US', '2025-04-25', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10020', 'PROD-2891', 'US', '2025-04-26', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10021', 'PROD-2891', 'US', '2025-04-26', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10022', 'PROD-2891', 'US', '2025-04-26', 224.99, 'completed', 'purchase', NULL),
-- ('TXN-10023', 'PROD-2891', 'US', '2025-04-27', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10024', 'PROD-2891', 'US', '2025-04-27', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10025', 'PROD-2891', 'US', '2025-04-28', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10026', 'PROD-2891', 'US', '2025-04-28', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10027', 'PROD-2891', 'US', '2025-04-28', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10028', 'PROD-2891', 'MX', '2025-04-28', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10009', 'PROD-2891', 'US', '2025-04-18', -449.99, 'completed', 'refund', 'TXN-10001'),
-- ('TXN-10018', 'PROD-2891', 'US', '2025-04-24', -299.99, 'completed', 'refund', 'TXN-10006'),
-- ('TXN-10029', 'PROD-2891', 'US', '2025-04-29', 449.99, 'failed', 'purchase', NULL),
-- ('TXN-10030', 'PROD-2891', 'US', '2025-04-29', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10031', 'PROD-2891', 'US', '2025-04-30', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10032', 'PROD-2891', 'US', '2025-05-01', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10033', 'PROD-2891', 'US', '2025-05-03', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10034', 'PROD-2891', 'US', '2025-05-05', -449.99, 'completed', 'refund', 'TXN-10002'),
-- ('TXN-10035', 'PROD-2891', 'US', '2025-05-08', -449.99, 'completed', 'refund', 'TXN-10010'),
-- ('TXN-10036', 'PROD-2891', 'US', '2025-05-12', -449.99, 'completed', 'refund', 'TXN-10013'),
-- ('TXN-10037', 'PROD-2891', 'US', '2025-05-15', -224.99, 'completed', 'refund', 'TXN-10022'),
-- ('TXN-10038', 'PROD-2891', 'US', '2025-05-18', -449.99, 'completed', 'refund', 'TXN-10023'),
-- ('TXN-10039', 'PROD-2891', 'US', '2025-05-20', -449.99, 'completed', 'refund', 'TXN-10025'),
-- ('TXN-10040', 'PROD-2891', 'US', '2025-05-22', -449.99, 'completed', 'refund', 'TXN-10031'),
-- ('TXN-10041', 'PROD-2891', 'CA', '2025-05-10', -449.99, 'completed', 'refund', 'TXN-10005'),
-- ('TXN-10042', 'PROD-2891', 'US', '2025-05-14', -449.99, 'pending', 'refund', 'TXN-10015'),
-- ('TXN-10043', 'PROD-3421', 'US', '2025-05-16', -299.99, 'completed', 'refund', 'TXN-10007'),
-- ('TXN-10044', 'PROD-2891', 'US', '2025-05-11', 449.99, 'completed', 'purchase', NULL),
-- ('TXN-10045', 'PROD-2891', 'US', '2025-05-11', -449.99, 'completed', 'refund', 'TXN-10044');


select * from 


-- without missing dates
select
transaction_date, coalesce(sum(case when
	refund_status is null
	 then amount end),0) as daily_net_revenue
from (

	select p1.transaction_id,p1.transaction_date,p1.country,p1.amount,p1.type,p1.status as purchase_status,
		p2.status as refund_status ,p2.transaction_id  from product_sales p1 
		left join product_sales p2
		on p2.original_transaction_id=p1.transaction_id
		and p2.status='completed'
	where p1.product_id='PROD-2891'
	and p1.country='US' and  p1.type='purchase' and p1.status='completed'
	order by p1.transaction_date,p1.transaction_id
	
) group by transaction_date
having transaction_date between '2025-04-15' and '2025-04-28'


select * from product_sales order by transaction_date,transaction_id


-- filling missing dates (gemini)
select t1.transaction_date,coalesce(t2.daily_net_revenue,0) as daily_net_revenue from (
select 
generate_series('2025-04-15'::date,
				'2025-04-28'::date, '1 day'::interval)::date as transaction_date 
) t1
left join (select transaction_date, 
	COALESCE(SUM(amount + COALESCE(refund_amount, 0)), 0) as daily_net_revenue
from (

	select 
		p1.transaction_id,
		p1.transaction_date,
		p1.country,
		p1.amount,
		p1.type,
		p1.status,
		p2.status as refund_status,
		p2.amount as refund_amount,
		p2.transaction_id as refund_id  from product_sales p1 
		left join product_sales p2
		on p2.original_transaction_id=p1.transaction_id
		and p2.status='completed'
	where p1.product_id='PROD-2891'
	and p1.country='US' and  p1.type='purchase' and p1.status='completed'
	and  p1.transaction_date between '2025-04-15' and '2025-04-28'
	order by p1.transaction_date,p1.transaction_id
	
) group by transaction_date
) t2 on t2.transaction_date=t1.transaction_date















