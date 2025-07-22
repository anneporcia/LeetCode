/* Write your T-SQL query statement below */
select
    query_name
    , round(avg(rating*1.00/position*1.00),2) as quality
    , round((count(case when rating < 3 then query_name end )*1.00/count(query_name)*1.00)*100, 2) as poor_query_percentage
from Queries
group by query_name