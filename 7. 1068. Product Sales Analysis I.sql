-- Query to select product name, year, and price by joining sales and product tables
SELECT p.product_name, s.year, s.price
FROM sales AS s
JOIN product AS p ON s.product_id = p.product_id;
