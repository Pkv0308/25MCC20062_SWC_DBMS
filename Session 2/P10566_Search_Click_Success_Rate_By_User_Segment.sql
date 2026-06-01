set search_path to 'P10566';

-- -- Create accounts table
-- CREATE TABLE accounts (
--     user_id BIGINT PRIMARY KEY,
--     registration_date DATE,
--     country TEXT
-- );

-- -- Insert data into accounts table
-- INSERT INTO accounts (user_id, registration_date, country) VALUES
-- (101, '2025-09-25', 'USA'),
-- (102, '2025-09-28', 'Canada'),
-- (103, '2025-10-01', 'USA'),
-- (104, '2025-10-05', 'UK'),
-- (105, '2025-10-10', 'USA'),
-- (106, '2025-10-15', 'Germany'),
-- (107, '2025-10-18', 'France'),
-- (108, '2025-10-20', 'USA'),
-- (109, '2025-08-15', 'Canada'),
-- (110, '2025-07-20', 'USA'),
-- (111, '2025-06-10', 'UK'),
-- (112, '2025-05-05', 'Germany'),
-- (113, '2025-03-12', 'USA'),
-- (114, '2025-01-20', 'France'),
-- (115, '2024-11-15', 'USA');

-- -- Create search_events table
-- CREATE TABLE search_events (
--     event_id BIGINT PRIMARY KEY,
--     user_id BIGINT,
--     query TEXT,
--     event_timestamp TIMESTAMP WITHOUT TIME ZONE,
--     event_type TEXT,
--     session_id TEXT,
--     FOREIGN KEY (user_id) REFERENCES accounts(user_id)
-- );

-- -- Insert data into search_events table
-- INSERT INTO search_events (event_id, user_id, query, event_timestamp, event_type, session_id) VALUES
-- (1001, 101, 'laptop deals', '2025-10-22 10:00:00', 'search', 'S101-1'),
-- (1002, 101, 'laptop deals', '2025-10-22 10:00:15', 'click', 'S101-1'),
-- (1003, 101, 'gaming laptop', '2025-10-22 10:05:00', 'search', 'S101-1'),
-- (1004, 101, 'gaming laptop', '2025-10-22 10:05:20', 'click', 'S101-1'),
-- (1005, 102, 'winter jacket', '2025-10-22 11:00:00', 'search', 'S102-1'),
-- (1006, 102, 'winter jacket', '2025-10-22 11:00:25', 'click', 'S102-1'),
-- (1007, 102, 'boots', '2025-10-22 11:10:00', 'search', 'S102-1'),
-- (1008, 102, 'boots', '2025-10-22 11:10:45', 'click', 'S102-1'),
-- (1009, 103, 'python course', '2025-10-22 12:00:00', 'search', 'S103-1'),
-- (1010, 103, 'python course', '2025-10-22 12:00:10', 'click', 'S103-1'),
-- (1011, 103, 'sql tutorial', '2025-10-22 12:15:00', 'search', 'S103-1'),
-- (1012, 104, 'headphones', '2025-10-22 13:00:00', 'search', 'S104-1'),
-- (1013, 104, 'headphones', '2025-10-22 13:00:28', 'click', 'S104-1'),
-- (1014, 105, 'coffee maker', '2025-10-22 14:00:00', 'search', 'S105-1'),
-- (1015, 105, 'coffee maker', '2025-10-22 14:01:00', 'click', 'S105-1'),
-- (1016, 106, 'yoga mat', '2025-10-22 15:00:00', 'search', 'S106-1'),
-- (1017, 106, 'yoga mat', '2025-10-22 15:00:18', 'click', 'S106-1'),
-- (1018, 106, 'fitness tracker', '2025-10-22 15:30:00', 'search', 'S106-1'),
-- (1019, 107, 'french books', '2025-10-22 16:00:00', 'search', 'S107-1'),
-- (1020, 107, 'french books', '2025-10-22 16:00:12', 'click', 'S107-1'),
-- (1021, 107, 'dictionary', '2025-10-22 16:15:00', 'search', 'S107-1'),
-- (1022, 107, 'dictionary', '2025-10-22 16:15:22', 'click', 'S107-1'),
-- (1023, 108, 'smartphone', '2025-10-22 17:00:00', 'search', 'S108-1'),
-- (1024, 109, 'vintage records', '2025-10-22 09:00:00', 'search', 'S109-1'),
-- (1025, 109, 'vintage records', '2025-10-22 09:00:08', 'click', 'S109-1'),
-- (1026, 109, 'turntable', '2025-10-22 09:30:00', 'search', 'S109-1'),
-- (1027, 109, 'turntable', '2025-10-22 09:30:35', 'click', 'S109-1'),
-- (1028, 110, 'garden tools', '2025-10-22 08:00:00', 'search', 'S110-1'),
-- (1029, 110, 'garden tools', '2025-10-22 08:00:20', 'click', 'S110-1'),
-- (1030, 110, 'plant seeds', '2025-10-22 08:15:00', 'search', 'S110-1'),
-- (1031, 111, 'travel luggage', '2025-10-22 10:30:00', 'search', 'S111-1'),
-- (1032, 111, 'travel luggage', '2025-10-22 10:30:15', 'click', 'S111-1'),
-- (1033, 111, 'passport holder', '2025-10-22 10:45:00', 'search', 'S111-1'),
-- (1034, 111, 'passport holder', '2025-10-22 10:45:50', 'click', 'S111-1'),
-- (1035, 112, 'kitchen knives', '2025-10-22 11:30:00', 'search', 'S112-1'),
-- (1036, 112, 'kitchen knives', '2025-10-22 11:30:25', 'click', 'S112-1'),
-- (1037, 113, 'running shoes', '2025-10-22 12:30:00', 'search', 'S113-1'),
-- (1038, 113, 'running shoes', '2025-10-22 12:30:18', 'click', 'S113-1'),
-- (1039, 113, 'sports socks', '2025-10-22 12:45:00', 'search', 'S113-1'),
-- (1040, 114, 'wine glasses', '2025-10-22 13:30:00', 'search', 'S114-1'),
-- (1041, 115, 'desk chair', '2025-10-22 14:30:00', 'search', 'S115-1'),
-- (1042, 115, 'desk chair', '2025-10-22 14:30:29', 'click', 'S115-1'),
-- (1043, 115, 'monitor stand', '2025-10-22 14:45:00', 'search', 'S115-1'),
-- (1044, 115, 'monitor stand', '2025-10-22 14:45:20', 'click', 'S115-1'),
-- (1045, 101, 'tablet case', '2025-10-22 18:00:00', 'search', 'S101-2'),
-- (1046, 101, 'tablet case', '2025-10-22 18:00:10', 'click', 'S101-2'),
-- (1047, 101, 'tablet case', '2025-10-22 18:00:20', 'click', 'S101-2'),
-- (1048, 101, 'tablet case', '2025-10-22 18:00:25', 'click', 'S101-2'),
-- (1049, 103, 'data science book', '2025-10-22 18:30:00', 'search', 'S103-2'),
-- (1050, 103, 'data science book', '2025-10-22 18:30:25', 'click', 'S103-2'),
-- (1051, 106, 'yoga blocks', '2025-10-22 19:00:00', 'search', 'S106-2'),
-- (1052, 106, 'yoga blocks', '2025-10-22 19:00:05', 'click', 'S106-2'),
-- (1053, 106, 'yoga blocks', '2025-10-22 19:00:15', 'click', 'S106-2'),
-- (1054, 108, 'smartphone', '2025-10-19 14:00:00', 'search', 'S108-0'),
-- (1055, 108, 'smartphone', '2025-10-19 14:00:20', 'click', 'S108-0');


select user_id, (case when registration_date>=(select (max(registration_date))-30 as threshold from accounts) 
		then 'New' else 'Registered' end ) as user_category from accounts
group by user_id; 


select user_category, sum(case when user_category='New' then 1 end) 
	from search_events se join 



select ss.user_id,ss.query,cat.user_category from 
	(select s1.user_id,s1.query,s1.session_id 
		from search_events s1
		join search_events s2
		on
		s2.user_id=s1.user_id
		and s2.query=s1.query
		and s2.session_id=s1.session_id
	where s2.event_type<>s1.event_type
	and s1.event_type<>'click'
	and (select extract(epoch from 
			(s2.event_timestamp -  s1.event_timestamp)
			)) <=30
	) ss
 join 
	(select user_id, (case when registration_date>=(select (max(registration_date))-30 as threshold from accounts) 
		then 'new' else 'existing' end ) as user_category from accounts
	 group by user_id
	) cat
on cat.user_id=ss.user_id
group by ss.user_id,ss.query,cat.user_category



-- gemini solution below
-- break the tables into CTE
-- apply joins on these tables
with user_segments as (	
	select user_id, case when 
	registration_date>=(select max(registration_date)-30 
	from accounts) 
		then 'new' 
		else 'existing' 
	end as user_category from accounts
	),

  successful_searches as (
	select s1.user_id,s1.query,s1.session_id 
		from search_events s1
		join search_events s2
		on
		s2.user_id=s1.user_id
		and s2.query=s1.query
		and s2.session_id=s1.session_id
	where s2.event_type<>s1.event_type
	and s1.event_type<>'click'
	and (select extract(epoch from 
			(s2.event_timestamp -  s1.event_timestamp)
			)) <=30
	),

 total_searches as (
	select session_id,user_id,query
	from search_events where event_type='search'
)

-- 4. The final output
SELECT 
    us.user_category AS segment,
    COUNT(ts.*) AS total_searches,
    COUNT(ss.*) AS successful_searches,
	round((count(ss.*)::NUMERIC/count(ts.*)::NUMERIC),2) as success_rate
    -- You can add your math for the success rate here!
FROM user_segments us
JOIN total_searches ts 
    ON us.user_id = ts.user_id
LEFT JOIN successful_searches ss 
    ON ts.session_id = ss.session_id 
    AND ts.query = ss.query
GROUP BY us.user_category;















