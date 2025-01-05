-- Query to calculate the total and average amount spent by customers over the past 7 days for each 'visited_on' date, excluding the first 6 rows.

WITH total_amount_customers AS (
    SELECT 
        visited_on, 
        SUM(amount) AS amount
    FROM 
        customer
    GROUP BY 
        visited_on
)
SELECT 
    t.visited_on,
    (SELECT SUM(amount) 
     FROM total_amount_customers 
     WHERE visited_on BETWEEN t.visited_on - INTERVAL '6 days' AND t.visited_on) AS amount,
    ROUND((SELECT AVG(amount) 
           FROM total_amount_customers 
           WHERE visited_on BETWEEN t.visited_on - INTERVAL '6 days' AND t.visited_on)::numeric, 2) AS average_amount
FROM 
    total_amount_customers t
ORDER BY 
    t.visited_on ASC
OFFSET 6;
