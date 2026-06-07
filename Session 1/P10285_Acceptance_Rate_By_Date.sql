-- set search_path to 'P10285';

-- solution
select t3.date, 
	round(count(t3.result)/count(t3.date)::NUMERIC(5,2),2) 
	as percentage_acceptance
from (
select t1.date,t1.action, t2.action as "result" from fb_friend_requests 
	t1 left join fb_friend_requests t2
on t2.user_id_receiver=t1.user_id_receiver
	and t2.user_id_sender=t1.user_id_sender
	and t2.action='accepted'
where t1.action<>'accepted'
order by t1.date
) t3 group by t3.date 



-- create table fb_friend_requests(user_id_sender varchar(30),
-- user_id_receiver varchar(30),
-- "date" date, "action" varchar(30));

-- select * from fb_friend_requests;

-- INSERT INTO fb_friend_requests (user_id_sender, user_id_receiver, date, action) VALUES
-- ('ad4943sdz', '948ksx123d', '2020-01-04', 'sent'),
-- ('ad4943sdz', '948ksx123d', '2020-01-06', 'accepted'),
-- ('dfdfxf9483', '9djjjd9283', '2020-01-04', 'sent'),
-- ('dfdfxf9483', '9djjjd9283', '2020-01-15', 'accepted'),
-- ('ffdfff4234234', 'lpjzjdi4949', '2020-01-06', 'sent'),
-- ('fffkfld9499', '993lsldidif', '2020-01-06', 'sent'),
-- ('fffkfld9499', '993lsldidif', '2020-01-10', 'accepted'),
-- ('fg503kdsdd', 'ofp049dkd', '2020-01-04', 'sent'),
-- ('fg503kdsdd', 'ofp049dkd', '2020-01-10', 'accepted'),
-- ('hh643dfert', '847jfkf203', '2020-01-04', 'sent'),
-- ('r4gfgf2344', '234ddr4545', '2020-01-06', 'sent'),
-- ('r4gfgf2344', '234ddr4545', '2020-01-11', 'accepted');
