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

