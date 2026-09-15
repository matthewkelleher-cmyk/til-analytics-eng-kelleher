# Write your MySQL query statement below
select 
w2.id
from weather as w1
inner join weather as w2
on w1.recordDate = date_add(w2.recordDate, interval -1 day)
where w1.temperature < w2.temperature




#tried using a window function. passed first test, but not final test. I am no considering solving this with a self join. 
-- with offset as (
--     select 
--     Id,
--     temperature,
--     lag(temperature, 1) over(order by recordDate) as last_day_temp
-- from weather 
-- )
-- select 
--     Id
-- from offset 
-- where temperature > last_day_temp