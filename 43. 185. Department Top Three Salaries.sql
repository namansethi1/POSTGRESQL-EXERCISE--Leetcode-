-- Query to find the top three highest-paid employees in each department based on their salaries.

WITH SalaryRanking AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS Rank
    FROM
        employee e
    JOIN
        department d ON e.departmentId = d.id
)
SELECT 
    Department, 
    Employee, 
    Salary
FROM 
    SalaryRanking
WHERE 
    Rank <= 3;
