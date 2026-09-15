# Write your MySQL query statement below
select 
s.user_id 
, cast(sum(if(c.action = 'confirmed', 1, 0)) / count(*) as decimal(10,2)) as confirmation_rate 
from 
signups as s 
left join 
confirmations as c 
on s.user_id = c.user_id
group by 
s.user_id
order by 
confirmation_rate



-- Learned that you can use left join to capture a value that doesn't exist in the right table of a join. Just have to handle the NULLS 
-- The query was on the right side of the bell curve for on the execution time, I think there is better ways to flag and count the confirmation_rate than to use IF(__,1,0)
