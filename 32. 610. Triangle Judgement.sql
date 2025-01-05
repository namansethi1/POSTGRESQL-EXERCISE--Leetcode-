-- Query to determine if three sides form a valid triangle for each row
SELECT
    x,
    y,
    z,
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes' 
        ELSE 'No' 
    END AS triangle
FROM
    triangle;
