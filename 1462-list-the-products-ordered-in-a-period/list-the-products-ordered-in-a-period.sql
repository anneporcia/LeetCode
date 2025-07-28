# Write your MySQL query statement below
select
    p.product_name
    ,sum(o.unit) as unit
from Orders o
join Products p
    on o.product_id=p.product_id
where o.order_date>=cast('2020-02-01' as date) and o.order_date<=cast('2020-02-29' as date)
group by product_name
having sum(o.unit)>=100