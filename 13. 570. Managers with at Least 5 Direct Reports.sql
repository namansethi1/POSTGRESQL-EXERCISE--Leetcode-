-- Query to select names of employees who are managers of at least 5 employees
SELECT name
FROM employee
WHERE id IN (
    SELECT managerId
    FROM employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
);
