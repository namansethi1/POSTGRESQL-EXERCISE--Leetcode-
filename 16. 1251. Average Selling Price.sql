-- Query to calculate the average price of products based on units sold within valid date ranges
SELECT
    p.product_id,
    COALESCE(
        ROUND(
            (SUM(p.price * u.units)::numeric / SUM(u.units)::numeric), 
            2
        ), 
        0.00
    ) AS average_price
FROM
    prices AS p
LEFT JOIN
    unitssold AS u 
    ON p.product_id = u.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    p.product_id;
