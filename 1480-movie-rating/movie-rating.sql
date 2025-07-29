# Write your MySQL query statement below
with cte1 as
(
    select
        m.user_id
        ,u.name
        ,count(distinct m.movie_id) as count
        ,row_number() over (order by count(distinct m.movie_id) desc, u.name asc) as rownum
    from MovieRating m
    join Users u
    on m.user_id=u.user_id
    group by m.user_id
)

, cte2 as
(
    select
        mr.movie_id
        ,m.title
        ,avg(mr.rating) as avg
        ,row_number() over (order by avg(mr.rating) desc, m.title asc) as rownum
    from MovieRating mr
    join Movies m
        on mr.movie_id=m.movie_id
    where created_at >= cast('2020-02-01' as date) and created_at<=cast('2020-02-29' as date)
    group by mr.movie_id
)

select
    name as results
from cte1
where rownum = 1

union all

select
    title as results
from cte2
where rownum = 1