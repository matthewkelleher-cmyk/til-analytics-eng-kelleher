# Write your MySQL query statement below
select 
p.project_id,
cast(avg(experience_years) as decimal(10,2)) as average_years 
from 
project as p 
left join employee as e 
on p.employee_id = e.employee_id 
group by 
p.project_id 
order by 
p.project_id 


-- Got this on the first try :)