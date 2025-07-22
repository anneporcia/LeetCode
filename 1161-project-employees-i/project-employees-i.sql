/* Write your T-SQL query statement below */
select
    p.project_id
    ,cast(avg(cast(e.experience_years as decimal(10,2))) as decimal(10,2)) as average_years
from Project p 
join Employee e
    on e.employee_id=p.employee_id
group by p.project_id
