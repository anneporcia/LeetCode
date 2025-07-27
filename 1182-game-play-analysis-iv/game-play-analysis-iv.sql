# Write your MySQL query statement below
with cte1 as
(
    select
    player_id
    ,min(event_date) as firstdate
    from Activity
    group by player_id
)

, cte as
(select
    *
    ,date_add(event_date, interval 1 day) as nextday
    ,lead(event_date,1,null) over (partition by player_id order by event_date) as nextlogin
from Activity)

select
    round(
        ((select 
            count(distinct(
                case 
                when c.nextday=c.nextlogin 
                then c.player_id end))
        from cte c
        join cte1 c1 on c.player_id=c1.player_id and c.event_date=c1.firstdate
    )
    /
    count(distinct player_id)),2) as fraction
from cte
