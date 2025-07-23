/* Write your T-SQL query statement below */
with minyear as
(
select
    product_id
    ,min(year) as first_year
from Sales
group by product_id
)

select 
    s.product_id
    ,m.first_year
    ,s.quantity
    ,s.price
from Sales s
join minyear m
    on s.product_id=m.product_id
    and m.first_year=s.year