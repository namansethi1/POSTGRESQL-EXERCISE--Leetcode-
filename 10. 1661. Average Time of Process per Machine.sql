-- Query to calculate the average processing time per machine by first calculating total processing time for each machine and process
WITH total_processing_time AS (
    SELECT machine_id, process_id, 
           MAX(timestamp) - MIN(timestamp) AS time_stamp
    FROM activity
    GROUP BY machine_id, process_id
)

SELECT machine_id, 
       ROUND((SUM(time_stamp)::numeric / COUNT(time_stamp)::numeric), 3) AS processing_time
FROM total_processing_time
GROUP BY machine_id;
