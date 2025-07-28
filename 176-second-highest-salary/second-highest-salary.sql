# Write your MySQL query statement below
with cte as
(select
    salary
    ,dense_rank() over (order by salary desc) as rnk
from Employee
group by salary)

select(
select 
    salary as SecondHighestSalary
from cte
where rnk=2) as SecondHighestSalary
from dual
