-- Query to find numbers that appear consecutively at least three times in a row
WITH prev_logs AS (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev_num,
        LAG(num, 2) OVER (ORDER BY id) AS prev_2_num
    FROM
        logs
)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM 
    prev_logs
WHERE
    num = prev_num AND num = prev_2_num AND prev_num = prev_2_num;
