-- Query to find IDs of records where the temperature is higher than the previous day's temperature
SELECT id
FROM (
    SELECT id, 
           recordDate, 
           temperature,
           LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date,
           LAG(temperature) OVER (ORDER BY recordDate) AS prev_temperature
    FROM Weather
) t
WHERE temperature > prev_temperature
  AND recordDate = prev_date + INTERVAL '1 day';
