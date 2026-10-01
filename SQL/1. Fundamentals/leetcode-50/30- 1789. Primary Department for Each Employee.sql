# Write your MySQL query statement below


with 
cte_1
as 
(
    select employee_id , department_id ,count(employee_id) as em_cnt from employee group by employee_id having em_cnt = 1

)
,

 
cte_2 
as(
    select 
    employee_id 
    , department_id 
    from 
    employee
    where primary_flag = "Y"
)


select 
employee_id
, department_id 
from cte_1 
UNION ALL 
select 
* 
from cte_2 
order by 
employee_id 
