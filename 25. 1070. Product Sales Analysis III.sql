-- Query to retrieve sales information for each product's first year of sale
WITH product_min_year AS (
    SELECT product_id, MIN(year) AS year
    FROM sales
    GROUP BY product_id
)
SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM
    sales s
JOIN
    product_min_year pmy ON pmy.product_id = s.product_id AND pmy.year = s.year;
