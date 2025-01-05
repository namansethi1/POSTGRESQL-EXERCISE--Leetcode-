-- Query to assign students to adjacent seats based on the given conditions
SELECT
    id,
    CASE 
        WHEN id % 2 = 0 AND LAG(student) OVER (ORDER BY id) IS NOT NULL THEN LAG(student) OVER (ORDER BY id)
        WHEN id % 2 != 0 AND LEAD(student) OVER (ORDER BY id) IS NOT NULL THEN LEAD(student) OVER (ORDER BY id)
        WHEN id % 2 != 0 AND LEAD(student) OVER (ORDER BY id) IS NULL THEN student
    END AS student
FROM
    seat
ORDER BY
    id;
