/* Write your T-SQL query statement below */
select 
    isnull((case 
    when id % 2<>0 or id=1 then (lead(id) over (order by id))
    when id % 2 = 0 then (lag(id) over (order by id))
    end), id) as id
    ,student
from Seat
order by isnull((case 
    when id % 2<>0 or id=1 then (lead(id) over (order by id))
    when id % 2 = 0 then (lag(id) over (order by id))
    end), id)
