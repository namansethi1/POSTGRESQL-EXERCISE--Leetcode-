-- Query to find customers who have purchased all available products
SELECT
    customer_id
FROM
    customer
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product);
