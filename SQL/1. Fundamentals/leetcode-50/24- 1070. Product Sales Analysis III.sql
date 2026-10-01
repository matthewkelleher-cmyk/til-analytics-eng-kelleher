# Write your MySQL query statement below

with cte_1 
as
( 
select 
sale_id 
, product_id 
, min(year) as first_year
from 
sales 
group by 
product_id 
)

select  
  s.product_id 
, c.first_year 
, s.quantity 
,s.price

from 
cte_1 as c 
inner join sales as s 
on c.product_id = s.product_id 
-- c.sale_id = s.sale_id 
and c.first_year = s.year  
-- group by 
-- product_id