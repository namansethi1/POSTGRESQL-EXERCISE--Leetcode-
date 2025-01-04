-- Query to calculate the fraction of players who logged in on the next day after their first login
WITH first_day_login AS (
    SELECT
        player_id,
        MIN(event_date) AS first_day_login_date
    FROM
        activity
    GROUP BY
        player_id
),
next_day_login AS (
    SELECT
        a.player_id
    FROM 
        activity a
    JOIN
        first_day_login fdl ON a.player_id = fdl.player_id
    WHERE
        a.event_date = fdl.first_day_login_date + INTERVAL '1 day'
)
SELECT
    ROUND(
        (COUNT(DISTINCT ndl.player_id)::numeric / COUNT(fdl.player_id)::numeric), 
        2
    ) AS fraction
FROM 
    first_day_login fdl
LEFT JOIN
    next_day_login ndl ON fdl.player_id = ndl.player_id;
