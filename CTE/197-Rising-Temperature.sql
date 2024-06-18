-- using CTE
WITH tempDiff AS(
    SELECT
        id,
        recordDate,
        temperature,
        LAG(temperature) OVER (ORDER BY recordDate) AS prevTemp,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prevDate
    FROM 
        Weather
)
SELECT
    id
FROM
    tempDiff
WHERE
    temperature > prevTemp AND
    recordDate = prevDate + INTERVAL '1 day';