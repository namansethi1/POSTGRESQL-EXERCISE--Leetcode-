-- Query to find the maximum unique number from the 'mynumbers' table
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM mynumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS unique_numbers;
