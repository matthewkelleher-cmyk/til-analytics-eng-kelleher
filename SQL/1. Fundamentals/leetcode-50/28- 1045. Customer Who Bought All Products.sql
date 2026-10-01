# Write your MySQL query statement below

select 
customer_id 
-- , count(*) as count
-- , (select count(*) from product) as p_count
from 
customer 
group by 
customer_id 
having 
count(distinct(product_key)) = (select count(*) from product) 



-- Using having filters after the aggregation that takes place on group by 
-- While where filters at the row level before any aggregation
