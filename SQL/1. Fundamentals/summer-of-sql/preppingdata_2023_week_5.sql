/*
Prepping Data Completed in SQL for 2023 Week 5
https://preppindata.blogspot.com/2023/02/2023-week-5-dsb-ranking.html
*/

with 
cte_1 as(
select 
value 
,customer_code
,monthname(to_date(transaction_date, 'DD/MM/YYYY HH24:MI:SS')) as transaction_date
, split_part(transaction_code, '-', 0) as bank
from 
pd2023_wk01
)
,
cte_2 as 
(
select 
bank 
, transaction_date
, sum(value) as value 
from 
cte_1 
group by 
bank 
, transaction_date
)
,
cte_3 as
(
select 
* 
, rank() over(partition by transaction_date order by value desc) as bank_rank_per_month
from 
cte_2 
)

select 
* 
, avg(bank_rank_per_month) over(partition by bank) as avg_rank_per_bank
, avg(value) over(partition by bank_rank_per_month) avg_transaction_value_per_rank
from 
cte_3 

;