/* Write your T-SQL query statement below */
select
    left(trans_date, 7) as month
    ,country
    ,count(id) as trans_count
    ,count(case when state='approved' then id end) as approved_count
    ,sum(amount) as trans_total_amount
    ,isnull(sum(case when state='approved' then amount end), 0) as approved_total_amount
from Transactions
group by left(trans_date, 7), country