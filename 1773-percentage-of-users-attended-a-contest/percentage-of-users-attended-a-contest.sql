/* Write your T-SQL query statement below */
select 
    r.contest_id 
    ,round((count(distinct r.user_id)*1.00/(select count(distinct u.user_id) from Users u)*1.00)*100, 2) as percentage
from Register r
join Users u
    on u.user_id=r.user_id
group by r.contest_id
order by percentage desc, r.contest_id asc

