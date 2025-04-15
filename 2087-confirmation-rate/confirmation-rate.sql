/* Write your T-SQL query statement below */
SELECT 
    S.user_id
    ,round(
    isnull(
        CASE WHEN C.time_stamp = NULL THEN 0.0 ELSE
            CAST(SUM(CASE WHEN C.action = 'confirmed' THEN 1 END) AS DECIMAL(10, 2)) 
            /CAST(COUNT(C.time_stamp) AS DECIMAL(10, 2)) 
        END 
    ,0.00) ,2) AS confirmation_rate
FROM Confirmations AS C
right join Signups as S
    on C.user_id=S.user_id
group by S.user_id
