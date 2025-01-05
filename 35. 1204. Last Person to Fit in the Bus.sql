-- Query to find the person with the highest cumulative weight sum under a certain threshold (1000), 
-- and if the person_name is NULL, return the name of the first person in the queue

WITH total_weight_sum AS (
    SELECT
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS weight_sum
    FROM
        queue
)
SELECT
    CASE 
        WHEN person_name IS NULL THEN (SELECT person_name FROM queue WHERE turn = 1)
        ELSE person_name
    END AS person_name
FROM
    total_weight_sum
WHERE
    weight_sum = (SELECT MAX(weight_sum) FROM total_weight_sum WHERE weight_sum <= 1000);
