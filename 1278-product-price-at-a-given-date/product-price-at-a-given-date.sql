/* Write your T-SQL query statement below */
with cte as 
(select *
from Products
where change_date<=cast('2019-08-16' as date))

, cte2 as
(
select
    p.product_id
    ,max(c.change_date) as max_date
from Products p
left join cte c
    on p.product_id=c.product_id 
group by p.product_id)

select
    c.product_id
    ,isnull(min(p.new_price),10) as price
from cte2 c
left join Products p
    on c.product_id=p.product_id
        and p.change_date=c.max_date
group by c.product_id