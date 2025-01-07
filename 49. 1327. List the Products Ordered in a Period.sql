-- Query to find the total units sold per product in February 2020, only for products with total units sold greater than or equal to 100.

SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM
    orders o
JOIN
    products p ON o.product_id = p.product_id
WHERE
    EXTRACT(month FROM order_date) = 2 
    AND EXTRACT(year FROM order_date) = 2020
GROUP BY 
    p.product_id, p.product_name
HAVING
    SUM(unit) >= 100;
