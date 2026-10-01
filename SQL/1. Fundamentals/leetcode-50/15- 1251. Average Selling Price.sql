# Write your MySQL query statement below
select 
 p.product_id 
, ifnull(cast(sum(p.price * u.units) / sum(u.units) as decimal(10,2)), 0) as average_price
from 
prices as p 
left join UnitsSold as u 
on p.product_id = u.product_id
and p.start_date <= u.purchase_date 
and u.purchase_date <= p.end_date 
group by 
p.product_id
order by 
p.product_id 



-- Initially had the second and third join conditions in a WHERE clause
-- where p.start_date <= u.purchase_date 
-- and u.purchase_date <= p.end_date 
-- This failed when u.product_id was all empty or null and caused the clause to output a null 