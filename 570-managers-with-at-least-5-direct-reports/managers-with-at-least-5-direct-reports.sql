/* Write your T-SQL query statement below */
select
    e1.name as name
from Employee e1
inner join Employee e2
    on e1.id=e2.managerId
group by e1.id, e1.name
having count(e1.id)>=5
