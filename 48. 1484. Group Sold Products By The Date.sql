-- Query to find the number of unique products sold per day along with their names, grouped by sell_date.

WITH grouped_activities AS (
    SELECT
        product, 
        sell_date
    FROM
        activities
    GROUP BY
        product, sell_date
    ORDER BY
        sell_date, product
)
SELECT
    sell_date,
    COUNT(product) AS num_sold,
    STRING_AGG(product, ',') AS products
FROM
    grouped_activities
GROUP BY
    sell_date
ORDER BY 
    sell_date;
