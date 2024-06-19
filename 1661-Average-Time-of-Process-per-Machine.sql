select A.machine_id, round(avg(B.timestamp-A.timestamp), 3) as processing_time 
from Activity A
join Activity B 
ON A.machine_id = B.machine_id AND A.process_id = B.process_id AND A.activity_type='start' and B.activity_type='end'
group by A.machine_id