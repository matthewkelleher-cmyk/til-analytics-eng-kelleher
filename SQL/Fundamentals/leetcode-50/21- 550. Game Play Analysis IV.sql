# Write your MySQL query statement below
with 
-- cte_1 
-- as 
-- (
-- select 
-- player_id
-- , min(event_date) as first_log
-- from 
-- activity 
-- group by 
-- player_id 
-- )

-- , 

cte_2 
as 
(
select 
player_id
, date_add(min(event_date), interval 1 day) as day_after_log 
from 
activity
group by 
player_id 
)

select 
round(count(a.player_id) / count(*),2) as fraction
from 
cte_2 as c
left join 
activity as a
on 
c.player_id = a.player_id 
and 
c.day_after_log = event_date