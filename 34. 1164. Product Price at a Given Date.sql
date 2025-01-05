-- Query to find the latest price of products on or before a specific date (2019-08-16) 
-- or assign a default price of 10 for products added after that date

WITH specific_date_products AS (
    SELECT
        product_id,
        MAX(change_date) AS change_date
    FROM
        products
    WHERE
        change_date <= '2019-08-16'
    GROUP BY
        product_id
)

SELECT 
    p.product_id,
    MAX(p.new_price) AS price
FROM
    products p
JOIN
    specific_date_products spd ON p.product_id = spd.product_id AND p.change_date = spd.change_date
GROUP BY
    p.product_id

UNION ALL

SELECT 
    p.product_id,
    10 AS price
FROM
    products p
GROUP BY
    product_id
HAVING
    MIN(change_date) > '2019-08-16';
