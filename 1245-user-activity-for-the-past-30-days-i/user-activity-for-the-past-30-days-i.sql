/* Write your T-SQL query statement below */
select
    activity_date as day
    , count(distinct user_id) as active_users
from Activity
where activity_date <= convert(date, '2019-07-27') and activity_date>dateadd(day,-30,convert(date, '2019-07-27') )
group by activity_date
having count(session_id)>0