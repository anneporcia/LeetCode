/* Write your T-SQL query statement below */
select
    c.customer_id
from Customer c
group by c.customer_id
having count(distinct c.product_key)=(select count(p.product_key) from product p)



