# Write your MySQL query statement below
select 
query_name 
, cast(avg(rating / position)  as decimal(10,2))  as quality
, cast((sum(if(rating < 3, 1, 0)) / count(rating)) * 100 as decimal(10,2))  as poor_query_percentage 
from 
queries 
group by 
query_name 