# Write your MySQL query statement below
With cte as
(
select *
    ,sum(weight) over (order by turn) as Total_Weight
from Queue
)

select
    person_name
from cte
where Total_Weight<=1000
order by turn desc
limit 1