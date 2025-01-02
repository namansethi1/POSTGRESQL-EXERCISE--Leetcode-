-- Query to calculate the confirmation rate for each user, rounded to two decimal places
SELECT
    s.user_id,
    ROUND(
        CASE
            WHEN COALESCE(COUNT(c.user_id), 0.00) = 0 THEN 0.00
            ELSE COALESCE((
                SELECT COUNT(*)::numeric 
                FROM confirmations 
                WHERE user_id = s.user_id AND action = 'confirmed'
            ), 0.00) 
            / COALESCE(COUNT(c.user_id), 0.00)::numeric
        END,
        2
    ) AS confirmation_rate
FROM 
    signups s
LEFT JOIN 
    confirmations c 
    ON s.user_id = c.user_id
GROUP BY 
    s.user_id;
