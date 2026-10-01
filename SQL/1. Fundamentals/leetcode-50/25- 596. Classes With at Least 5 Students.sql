# Write your MySQL query statement below

with 
cte_1 
as 
(
select 
class
, count(student) as student_count 
from 
courses 
group by 
class

)

select 
class 
from 
cte_1
where 
student_count >= 5  