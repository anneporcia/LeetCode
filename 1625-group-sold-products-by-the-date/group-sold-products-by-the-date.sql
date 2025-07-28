# Write your MySQL query statement below
with cte as
(
    select * from Activities group by sell_date, product
)

select
    sell_date
    ,count(distinct product) as num_sold
    ,group_concat(product order by product asc) as products
from cte
group by sell_date
order by sell_date asc