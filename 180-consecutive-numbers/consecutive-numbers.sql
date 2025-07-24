# Write your MySQL query statement below
with cte as
(select *
    ,lead(num,1,null) over (order by id) as num2
    ,lead(num,2,null) over (order by id) as num3
from Logs)

select
    num as ConsecutiveNums
from cte
where num=num2 and num=num3
group by num
