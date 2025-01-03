-- Query to calculate the percentage of immediate deliveries based on the first customer delivery type
SELECT
    ROUND(
        (
            COUNT(CASE 
                    WHEN customer_pref_delivery_date = order_date THEN 1 
                    ELSE NULL 
                END) * 100.0
        ) / NULLIF(COUNT(customer_id), 0), 
    2) AS immediate_percentage
FROM 
    (SELECT 
        customer_id,
        MIN(customer_pref_delivery_date) AS customer_pref_delivery_date,
        MIN(order_date) AS order_date
    FROM 
        delivery
    GROUP BY 
        customer_id) AS subquery;
