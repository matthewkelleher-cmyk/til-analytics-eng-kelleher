
/*
Preppin' Data 2023 Week 6 DSB Customer Ratings 
https://preppindata.blogspot.com/2023/02/2023-week-6-dsb-customer-ratings.html
*/




with 
cte_mobile_unpvt
as(
select 
* 
from 
pd2023_wk06_dsb_customer_survey
unpivot(
mobile_value for mobile in( mobile_app___ease_of_access, mobile_app___ease_of_use , mobile_app___navigation , mobile_app___likelihood_to_recommend )
)
-- Excluded column [mobile_app___overall_rating]
)
, 
cte_online_unpvt
as(
select 
* 
from 
cte_mobile_unpvt
unpivot (
online_value for online in(online_interface___ease_of_access, online_interface___ease_of_use, online_interface___likelihood_to_recommend, online_interface___navigation )
)
-- Exlcuded over column [online_interface___overall_rating]
)
,
cte_clean
as (
select 
customer_id 
, split_part(mobile, '___', 2) as mobile 
, mobile_value
, split_part(online, '___', 2) as online 
, online_value 
from 
cte_online_unpvt
)
, 
cte_avg
as 
(
select
customer_id
, avg(mobile_value) as mobile_avg
, avg(online_value) as online_avg
, avg(mobile_value) - avg(online_value) as avg_diff
from cte_clean
group by
customer_id
)
, 
cte_cat 
as 
(
select 
customer_id
,avg_diff
,case 
    when avg_diff >= 2 then 'Mobile App Superfans'
    when avg_diff >= 1 then 'Mobile App Fans'
    when avg_diff <= -2 then 'Online Interface Superfan'
    when avg_diff <= -1 then 'Online Interface Fan'
    else 'Neutral'
end as preference 
from 
cte_avg
)

select 
preference
, count(*) / sum(count(*)) over() as per_of_total
from 
cte_cat 
group by 
preference 