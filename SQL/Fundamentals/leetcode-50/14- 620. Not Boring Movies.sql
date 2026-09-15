# Write your MySQL query statement below
select 
* 
from 
cinema 
where id % 2 = 1 and description != "boring"
order by 
rating
desc


-- used modulo aka % to handle odd index indentifier. 
-- 0 % 2 = 0 
-- 1 % 2 = 1 
-- 2 % 2 = 0 
-- 3 % 2 = 1 
-- 4 % 2 = 0 

-- rule is n modulo is also 1 or 2
-- where 1 is the result of an ODD % 2 
-- where 2 is the result of an EVEN % 2 

-- This can be leveraged to flag odds. 