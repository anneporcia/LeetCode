/* Write your T-SQL query statement below */
select
    max(e1.name) as name
from Employee e1
inner join Employee e2
    on e1.id=e2.managerId
group by e1.id
having count(e1.id)>=5
