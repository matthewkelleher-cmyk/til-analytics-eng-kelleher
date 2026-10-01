# Write your MySQL query statement below

select max(num) as num 
from 
(
    select num 
    from mynumbers 
    group by num 
    having count(*) = 1

)
as single_numbers

##Tried a CTE, which I think is the right track. But join them was not working. 
-- with 
-- cte_1 
-- as 
-- (
--     select 
--     max(num) as max_num 
--     from 
--     mynumbers
-- )

-- select 
-- *
-- from 
-- mynumbers as m
-- left join 
-- cte_1 as c 
-- on c.max_num = m.num 
-- where 
-- num = max_num
