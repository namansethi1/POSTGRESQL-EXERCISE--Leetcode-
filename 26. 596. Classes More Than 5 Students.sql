-- Query to find classes with 5 or more students enrolled
SELECT 
    class
FROM 
    courses
GROUP BY 
    class
HAVING 
    COUNT(student) >= 5;
