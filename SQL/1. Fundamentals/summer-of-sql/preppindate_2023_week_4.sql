/*
Preppin Data 2023 Week 4
https://preppindata.blogspot.com/2023/01/2023-week-4-new-customers.html
*/

with union_all 
as 
(
select * , 'apr' as source_table from pd2023_wk04_april
Union all by name 
select * , 'aug' as source_table from pd2023_wk04_august
Union all by name 
select * , 'dec' as source_table from pd2023_wk04_december
Union all by name 
select * , 'feb' as source_table from pd2023_wk04_february
Union all by name 
select * , 'jan' as source_table from pd2023_wk04_january
Union all by name 
select * , 'jul' as source_table from pd2023_wk04_july
Union all by name 
select * , 'jun' as source_table from pd2023_wk04_june
Union all by name 
select * , 'mar' as source_table from pd2023_wk04_march
Union all by name 
select * , 'may' as source_table from pd2023_wk04_may
Union all by name 
select * , 'nov' as source_table from pd2023_wk04_november
Union all by name 
select * , 'oct' as source_table from pd2023_wk04_october
Union all by name 
select * , 'sep' as source_table from pd2023_wk04_september
)


,
 cleaned_union as
(
select 
id
, joining_day
, value
, source_table
, coalesce(demographic, demographiic, demagraphic) as demographic
from 
union_all 
)
,
join_table as
(
select
*
, to_date(concat(joining_day ,'-',  source_table, '-', 2023) , 'D-MON-YYYY') as joining_date
from 
cleaned_union
)
,
pivoted_table as
(
select 
id
,joining_date as joining_date
,to_date("'Date of Birth'") as date_of_birth
, "'Account Type'" as account_type
, "'Ethnicity'" as ethnicity
from 
join_table 
pivot 
(
max(value) for demographic in('Ethnicity', 'Account Type', 'Date of Birth')
)
)

select 
id 
, joining_date 
, date_of_birth
, account_type
, ethnicity

from 
pivoted_table 
qualify row_number() over(partition by id order by joining_date asc ) = 1

;