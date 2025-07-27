/* Write your T-SQL query statement below */
with cte1 as
(
    select 
    *
    ,dense_rank() over (partition by departmentId order by salary desc) as rank
    from Employee
)

,cte2 as 
(
    select
    departmentId
    ,salary
    ,rank
    from cte1
    where rank <=3
)

select
    d.name as Department
    ,e.name as Employee
    ,e.salary as Salary
from Employee e
join Department d
    on e.departmentId=d.id
join cte2 c
    on e.departmentId=c.departmentId and e.salary=c.salary
group by d.name,e.name,e.salary
