# Write your MySQL query statement below
select 
contest_id
,   round(count(r.user_id) * 100.0 / (select count(*) from Users), 2) as percentage
from register as r 
left join users as u 
on r.user_id = u.user_id 
group by 
contest_id 
order by 
percentage desc 
, contest_id asc