# Write your MySQL query statement below
with end_table as
(
    select *
    from Activity
    where activity_type = "end"
)

select 
    s.machine_id
    ,round(avg(e.timestamp-s.timestamp),3) as processing_time
from Activity s
join end_table e
on concat(s.machine_id,' ',s.process_id) = concat(e.machine_id,' ', e.process_id)
where s.activity_type = "start"
group by s.machine_id;