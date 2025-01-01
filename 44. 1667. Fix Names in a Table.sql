-- Query to select user IDs and names with the first letter capitalized and the rest in lowercase
SELECT
    user_id,
    UPPER(SUBSTRING(name FROM 1 FOR 1)) || LOWER(SUBSTRING(name FROM 2)) AS name
FROM
    users
ORDER BY
    user_id;
