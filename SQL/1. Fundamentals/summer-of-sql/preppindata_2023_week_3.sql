/*
SQL completion of Preppin Data 2023 Week 3
https://preppindata.blogspot.com/2023/01/2023-week-3-targets-for-dsb.html
*/

-- select 
-- *
-- from 
-- pd2023_wk03_targets
-- ;

with cte_targets 
as 
(

select 
online_or_in_person
, targets
, replace(quarter, 'Q', '') as quarter
from 
pd2023_wk03_targets
unpivot
(
 targets for quarter in(q1, q2, q3, q4) 
)
)
,

cte_trans
as 
(
select 
value
, case   
    when online_or_in_person = 1 then 'Online'
    else 'In-Person'
end as online_or_in_person
, date_part('quarter',to_date(transaction_date, 'DD/MM/YYYY HH:MI:SS')) as quarter
from 
pd2023_wk01
where 
contains(transaction_code, 'DSB')
)
,

cte_trans_2
as(
select 
quarter
, online_or_in_person
, sum(value) as value 
from 
cte_trans
group by 
quarter , online_or_in_person
)


select  
tgs.online_or_in_person
, tgs.quarter
, value
, targets
, value - targets as variance
from 
cte_targets as tgs 
join cte_trans_2 as tns
on tgs.online_or_in_person = tns.online_or_in_person
and tgs.quarter = tns.quarter
order by 
value desc
;
