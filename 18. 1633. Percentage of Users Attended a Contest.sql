-- Query to calculate the percentage of users registered for each contest, based on the total number of users
WITH total_users_count AS (
    SELECT COUNT(user_id) AS total_users 
    FROM users
)

SELECT
    contest_id,
    ROUND(
        (COUNT(user_id)::numeric / (SELECT total_users FROM total_users_count)::numeric) * 100, 
        2
    ) AS percentage
FROM  
    register
GROUP BY
    contest_id
ORDER BY
    percentage DESC, contest_id ASC;
