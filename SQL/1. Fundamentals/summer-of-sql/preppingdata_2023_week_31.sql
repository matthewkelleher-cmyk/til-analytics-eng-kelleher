/*
Preppin' Data 2023 Week 21 - HR Month - Filling in Missing IDs
https://preppindata.blogspot.com/2023/08/2023-week-31-hr-month-filling-in.html
*/


-- Find the clean and table with nulls filled for the pd2023_wk31_employees table
with 
look_up 
as 
(
select distinct
employee_id
, guid
from 
pd2023_wk31_monthly
where 
employee_id is not null
and 
guid is not null

UNION 

select distinct
employee_id
, guid 
from 
pd2023_wk31_employee
where 
employee_id is not null
and 
guid is not null
)

,
cte_em_joined
as 
(
select 
e.employee_id as e_employee_id 
, l.employee_id as l_employee_id 
, e.guid as e_guid 
, l.guid as l_guid 
, first_name 
, last_name 
, date_of_birth
, nationality
, gender
, email 
, hire_date
, leave_date
from 
pd2023_wk31_employee as e
left join 
look_up as l
on 
e.employee_id = l.employee_id
)

,
cte_gu_filled
as(

select 
e_employee_id as employee_id  
, coalesce(e_guid, l_guid) as guid
, first_name 
, last_name 
, date_of_birth
, nationality
, gender
, email 
, hire_date
, leave_date
from 
cte_em_joined
)


,
cte_gu_joined 
as 
(
select 
e.employee_id as e_employee_id 
, l.employee_id as l_employee_id 
, e.guid as e_guid
, l.guid as l_guid
, first_name 
, last_name 
, date_of_birth
, nationality
, gender
, email 
, hire_date
, leave_date
from 
cte_gu_filled as e
left join 
look_up as l
on 
e.guid = l.guid
)

select 
coalesce(e_employee_id, l_employee_id) as employee_id 
, coalesce(e_guid, l_guid) as guid 
, first_name
, last_name
, date_of_birth
, nationality
, gender
, email 
, hire_date 
, leave_date 
from 
cte_gu_joined
order by
employee_id



;



-- clean and filled the missing nulls for pd2023_wk31_monthly 

with 
look_up 
as 
(
select distinct
employee_id
, guid
from 
pd2023_wk31_monthly
where 
employee_id is not null
and 
guid is not null

UNION 

select distinct
employee_id
, guid 
from 
pd2023_wk31_employee
where 
employee_id is not null
and 
guid is not null
)
, 
cte_em_filled
as
(
select 
m.employee_id 
, coalesce(m.guid, l.guid) as guid 
, dc_nbr
, month_end_date
, hire_date
, leave_date
from 
pd2023_wk31_monthly as m 
left join 
look_up as l
on 
m.employee_id = l.employee_id 
)

select 
coalesce(m.employee_id, l.employee_id) as employee_id 
, m.guid 
, dc_nbr
, month_end_date
, hire_date
,leave_date
from 
cte_em_filled as m 
left join 
look_up as l 
on m.guid = l.guid 
