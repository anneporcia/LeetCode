/* Write your T-SQL query statement below */
select 
    r.contest_id 
    ,cast((cast(count(distinct r.user_id) as decimal(10,2))/cast((select count(distinct u.user_id) from Users u) as decimal(10,2))*100) as decimal(10,2)) as percentage
from Register r
left join Users u
    on u.user_id=r.user_id
group by r.contest_id
order by percentage desc, r.contest_id asc

