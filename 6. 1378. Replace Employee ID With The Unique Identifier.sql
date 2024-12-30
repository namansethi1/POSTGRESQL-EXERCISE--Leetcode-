-- Query to select employee unique IDs and names using a LEFT JOIN between employees and employeeuni tables
SELECT emp_uni.unique_id, emp.name
FROM employees AS emp
LEFT JOIN employeeuni AS emp_uni ON emp.id = emp_uni.id;
