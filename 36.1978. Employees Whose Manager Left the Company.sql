-- Query to find employees with a salary less than 30000 and an invalid manager
SELECT
    employee_id
FROM
    employees
WHERE 
    salary < 30000 
    AND manager_id IS NOT NULL 
    AND manager_id NOT IN (SELECT DISTINCT employee_id FROM employees)
ORDER BY 
    employee_id;
