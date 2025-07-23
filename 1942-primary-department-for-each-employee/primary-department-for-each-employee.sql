/* Write your T-SQL query statement below */
with cte as 
(select employee_id, count(employee_id) as count from Employee group by employee_id)

select 
    e.employee_id
    ,e.department_id
from Employee e
join cte c
    on c.employee_id=e.employee_id
where e.primary_flag='Y' or c.count=1
