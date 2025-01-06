-- Query to calculate the total insurance value in 2016 (rounded to two decimal places) for policies meeting specific criteria.

SELECT 
    ROUND(SUM(tiv_2016)::NUMERIC, 2) AS tiv_2016
FROM
    insurance i1
WHERE 
    tiv_2015 IN (
        SELECT tiv_2015 
        FROM insurance 
        WHERE pid != i1.pid
    ) 
    AND (i1.lat, i1.lon) NOT IN (
        SELECT lat, lon 
        FROM insurance 
        WHERE pid != i1.pid
    );
