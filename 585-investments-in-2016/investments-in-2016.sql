# Write your MySQL query statement below
with cte1 as
(
    select
        tiv_2015
        ,count(tiv_2015) as count
    from Insurance
    group by tiv_2015
    having count(tiv_2015)>1
)

,cte2 as
(
    select
        concat(lat,lon) as city
        ,count(*)
    from Insurance
    group by concat(lat,lon)
    having count(*)=1
)

select
    round(sum(tiv_2016),2) as tiv_2016
from Insurance
where tiv_2015 in (select tiv_2015 from cte1) 
    and concat(lat,lon) in (select city from cte2)