# Write your MySQL query statement below
with newtable as 
(
    select
        requester_id as id
    from RequestAccepted

    union all

    select
        accepter_id as id
    from RequestAccepted
)

,counted as
(select count(id) as count from newtable group by id)
select
    id
    ,count(id) as num
from newtable
group by id
having count(id) = (select max(count) from counted)