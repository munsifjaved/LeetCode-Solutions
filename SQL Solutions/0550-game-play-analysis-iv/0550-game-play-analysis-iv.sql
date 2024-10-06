with cte as
(select player_id, min(event_date) as event_date from activity
group by player_id
)


select 
    round(count(a.player_id )*1.0/(select count(distinct player_id) from activity),2) as fraction
from 
    cte a join activity a1
on 
    datediff(day,a.event_date,a1.event_date)=1
and
    a.player_id = a1.player_id