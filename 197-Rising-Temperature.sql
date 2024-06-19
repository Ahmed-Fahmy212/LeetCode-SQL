SELECT w2.id as Id
from Weather w1 
join Weather w2 ON w1.recordDate + INTERVAL '1 day'  = w2.recordDate
WHERE w2.temperature > w1.temperature;
