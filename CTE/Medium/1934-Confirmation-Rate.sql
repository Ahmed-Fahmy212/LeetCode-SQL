-- problem link :

WITH total_requests AS (
    SELECT user_id, COUNT(*) AS totalRequests
    FROM Confirmations
    GROUP BY user_id
),
total_confirmed AS (
    SELECT user_id, COUNT(*) AS totalConfirmed
    FROM Confirmations
    WHERE action = 'confirmed'
    GROUP BY user_id
)
SELECT 
    s.user_id,
    COALESCE(ROUND(CAST(tc.totalConfirmed AS NUMERIC) / NULLIF(CAST(tr.totalRequests AS NUMERIC), 0), 2), 0) AS confirmation_rate
FROM 
    Signups s
    LEFT JOIN total_requests tr ON s.user_id = tr.user_id
    LEFT JOIN total_confirmed tc ON s.user_id = tc.user_id
ORDER BY s.user_id;
-------------------------------------------------------------------
-- another solution
-- WITH total_confirmed AS( 
--     select user_id , count (user_id) as totalConfirmed
--     from Confirmations 
--     where action = 'confirmed'
--     group by user_id 
-- ), confirmed_rate AS (
--     SELECT 
--         c1.user_id,
--         COALESCE(c3.totalConfirmed, 0) AS tConfirmed,
--         COUNT(c2.user_id) AS tSignups
--     FROM Signups c1
--     LEFT JOIN Confirmations c2 ON c1.user_id = c2.user_id
--     LEFT JOIN total_confirmed c3 ON c1.user_id = c3.user_id
--     GROUP BY c1.user_id, c3.totalConfirmed
--     order by user_id
-- )
-- select user_id ,  COALESCE(CASE 
--         WHEN tConfirmed = 0 THEN 0
--         ELSE CAST(tConfirmed AS NUMERIC) / tSignups
--     END, 0)as confirmation_rate
-- from confirmed_rate
