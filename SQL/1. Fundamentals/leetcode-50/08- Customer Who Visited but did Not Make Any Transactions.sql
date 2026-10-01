# Write your MySQL query statement below
select 
customer_id,
count(customer_id) as count_no_trans
from visits as v  
left join  transactions as t
on 
t.visit_id = v.visit_id
where transaction_id is NULL
group by customer_id