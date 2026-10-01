# Write your MySQL query statement below
with 
cte_1 
as 
(
    select 
    reports_to
    , count(reports_to) as reports_count 
    , round(avg(age), 0) as average_age 
    from 
    employees 
    group by 
    reports_to  
    having reports_count > 0 
    
)

select 
e.employee_id 
, e.name 
, c.reports_count 
, average_age
from 
cte_1 as c
left join employees as e 
on c.reports_to = e.employee_id  
order by 
employee_id  









-- When working on this I was reminded that you must always use "group by" when you call a aggregation such as count()
-- If you do not, mySQL will still run but you only get one row. I believe that one row is filtered by max() so I was getting the answer I wanted but completely the wrong way. 




-- select 
-- *
-- -- c.employee_id 
-- -- , c.name 
-- -- , c.reports_count 
-- -- , c.average_age 
-- from cte_1 as c
-- -- left join employees as e 
-- -- on 
-- -- c.employee_id = e.employee_id 