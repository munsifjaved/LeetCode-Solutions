/* Write your T-SQL query statement below */
with started_time as (
    SELECT * FROM Activity WHERE activity_type = 'start'
),
end_time as (
    SELECT * FROM Activity WHERE activity_type = 'end'
)
SELECT machine_id, ROUND(Avg(duration), 3) as processing_time from (
select s.machine_id, s.process_id, e.timestamp - s.timestamp as duration
from started_time as s
inner join end_time as e ON s.machine_id = e.machine_id and s.process_id = e.process_id) c
GROUP BY machine_id