/* Write your T-SQL query statement below */
with catergories as
(select
    delivery_id
    ,case when order_date=customer_pref_delivery_date then 'immediate' else 'scheduled'end as cat
from Delivery)

,first as
(
    select
        customer_id
        ,min(order_date) as first_del
    from Delivery
    group by customer_id
)

,immediate as
(select 
    d.delivery_id
from Delivery d
inner join catergories c
    on c.delivery_id=d.delivery_id
where c.cat = 'immediate')

select 
    round((count(i.delivery_id)*1.00/count(d.delivery_id)*1.00)*100, 2) as immediate_percentage
from Delivery d
inner join first f
    on f.first_del=d.order_date
    and f.customer_id=d.customer_id
left join immediate i
    on i.delivery_id=d.delivery_id



