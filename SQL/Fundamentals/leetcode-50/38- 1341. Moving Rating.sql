# Write your MySQL query statement below
with cte as(
    select user_id,count(movie_id) as cnt from MovieRating
    group by user_id
),
cte1 as(
  select AVG(rating) as average,movie_id from movierating
  where MONTH(created_at)=02 and year(created_at)=2020
  group by movie_id
)
(select name as results from users
where user_id in(
    select user_id from cte
    where cnt in(
        select MAX(cnt) from cte
    )
)
order by results 
limit 1
)
union all
(
select title as results from movies
where movie_id in(
    select movie_id from cte1
    where average in (
        select max(average) from cte1
    )
)

order by results
LIMIT 1
)