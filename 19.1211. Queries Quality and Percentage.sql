-- Query to calculate the quality and poor query percentage for each query, ensuring no null values in the poor query percentage
SELECT
    query_name, 
    ROUND(SUM(rating::numeric / position::numeric) / COUNT(result)::numeric, 2) AS quality,
    ROUND(
        COALESCE((
            NULLIF((
                SELECT COUNT(q1.position) 
                FROM queries q1 
                WHERE q1.query_name = queries.query_name 
                AND q1.rating < 3
            ), 0)::numeric / COUNT(result)::numeric
        ) * 100, 0), 
        2
    ) AS poor_query_percentage
FROM
    queries
GROUP BY
    query_name;
