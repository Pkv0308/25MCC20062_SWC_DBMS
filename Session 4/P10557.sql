-- set search_path to 'P10577';

-- solution

with distinct_tasks as (
select distinct task_id, start_time,end_time from task_schedule
where start_time is not null and end_time is not null
),

timeline as (
select start_time as event_time, 1 as cpu_change from distinct_tasks
union all
select end_time as event_time, -1 as cpu_change from distinct_tasks
),

running_cpus as (
select event_time, cpu_change, sum(cpu_change) over (order by event_time asc,
	cpu_change asc) as active_cpus from timeline
)

select max(active_cpus) as min_cpu_required from running_cpus


-- CREATE TABLE task_schedule (
--     task_id BIGINT,
--     task_name TEXT,
--     start_time TIMESTAMP WITHOUT TIME ZONE,
--     end_time TIMESTAMP WITHOUT TIME ZONE
-- );

-- INSERT INTO task_schedule (task_id, task_name, start_time, end_time) 
-- VALUES
--     (9, 'Task_9', '2025-10-01 10:21:00', '2025-10-01 12:05:00'),
--     (17, 'Task_17', '2025-10-01 09:35:00', '2025-10-01 09:55:00'),
--     (1, 'Task_1', '2025-10-01 09:12:00', '2025-10-01 11:01:00'),
--     (24, 'Task_24', '2025-10-01 12:56:00', '2025-10-01 13:59:00'),
--     (12, 'Task_12', '2025-10-01 09:49:00', '2025-10-01 10:49:00'),
--     (10, 'Task_10', '2025-10-01 11:22:00', '2025-10-01 11:56:00'),
--     (14, NULL, '2025-10-01 12:55:00', '2025-10-01 14:18:00'),
--     (2, 'Task_2', '2025-10-01 10:54:00', '2025-10-01 11:26:00'),
--     (23, 'Task_23', '2025-10-01 13:33:00', '2025-10-01 15:21:00'),
--     (5, 'Task_5', '2025-10-01 10:59:00', '2025-10-01 12:18:00'),
--     (3, 'Task_3', '2025-10-01 13:39:00', '2025-10-01 14:05:00'),
--     (13, 'Task_13', '2025-10-01 11:15:00', '2025-10-01 13:13:00'),
--     (16, 'Task_16', NULL, '2025-10-01 13:33:00'),
--     (4, 'Task_4', '2025-10-01 09:16:00', '2025-10-01 09:34:00'),
--     (5, NULL, '2025-10-01 10:59:00', '2025-10-01 12:18:00'),
--     (21, 'Task_21', '2025-10-01 10:47:00', '2025-10-01 12:27:00'),
--     (18, 'Task_18', '2025-10-01 11:28:00', '2025-10-01 11:53:00'),
--     (22, 'Task_22', '2025-10-01 09:36:00', '2025-10-01 11:08:00'),
--     (19, 'Task_19', '2025-10-01 09:51:00', '2025-10-01 10:54:00'),
--     (25, 'Task_25', '2025-10-01 13:45:00', '2025-10-01 14:28:00'),
--     (8, 'Task_8', '2025-10-01 11:22:00', '2025-10-01 13:20:00'),
--     (11, 'Task_11', '2025-10-01 11:52:00', '2025-10-01 12:20:00'),
--     (15, 'Task_15', '2025-10-01 12:13:00', '2025-10-01 12:38:00'),
--     (20, 'Task_20', '2025-10-01 12:06:00', '2025-10-01 12:41:00'),
--     (7, 'Task_7', '2025-10-01 13:39:00', '2025-10-01 14:47:00');

