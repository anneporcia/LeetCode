/* Write your T-SQL query statement below */
select
    p.product_id
    ,isnull(cast(cast(sum(p.price*u.units)as decimal(10,2))/cast(sum(u.units) as decimal(10,2)) as decimal(10,2)), 0)  as average_price
from Prices p
left join UnitsSold u
    on u.product_id = p.product_id
    and (u.purchase_date>=p.start_date and u.purchase_date<=p.end_date)
group by p.product_id