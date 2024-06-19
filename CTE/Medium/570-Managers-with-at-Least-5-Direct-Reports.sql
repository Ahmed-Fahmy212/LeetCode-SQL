-- problem Link = https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50
WITH ManagerEmployeeCounts AS (
    SELECT 
        E1.name,
        COUNT(E1.id) AS total_managed
    FROM 
        Employee E1
    JOIN 
        Employee E2 ON E1.id = E2.managerId
    GROUP BY 
        E1.name, E1.id
)
SELECT name FROM ManagerEmployeeCounts
where total_managed >= 5;

