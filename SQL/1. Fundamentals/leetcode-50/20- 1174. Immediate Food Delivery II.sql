# Write your MySQL query statement below

## TRY 3 
with 
cte_min_order
as 
(
    select 
    min(order_date) as min_order_date
    , customer_id 
    from 
    delivery 
    group by customer_id 
) 

, cte_immediate_orders
as
(
select 
*
, if(order_date = customer_pref_delivery_date , 1, 0 ) as immediate_orders
from 
delivery
)
select 
round(sum(immediate_orders) / count(immediate_orders) *100,2) as immediate_percentage 
from 
cte_min_order as cte_1
left join 
cte_immediate_orders as cte_2
on 
cte_1.customer_id = cte_2.customer_id 
and 
cte_1.min_order_date = cte_2.order_date



-- ##TRY 2 
-- with 
-- immediate_order 
-- as 
-- (select
-- min(order_date) as max_order_date 
-- , customer_pref_delivery_date
-- , delivery_id
-- from 
-- delivery
-- group by 
-- customer_id )

-- select 
-- count(if(max_order_date = customer_pref_delivery_date, delivery_id, null))
-- /
-- count(delivery_id) *100 as immediate_percentage
-- from 
-- immediate_order




##TRY 1 
-- with 
-- immediate_order 
-- as 
-- (
-- select 
-- customer_pref_delivery_date
-- ,delivery_id
-- , max(order_date) as max_order_date
-- from delivery 
-- group by 
-- customer_id
-- ) 

-- select 
-- cast(
-- count(if(max_order_date = customer_pref_delivery_date, delivery_id, null)) 
-- /
-- count(if(max_order_date, delivery_id, null))
-- as decimal(10,2)) *100
--  as immediate_percentage
-- from immediate_order 