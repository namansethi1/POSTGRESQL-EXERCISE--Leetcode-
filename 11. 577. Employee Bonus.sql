-- Query to select names and bonuses of employees with no bonus or a bonus less than 1000
SELECT 
    e.name, 
    b.bonus
FROM 
    employee AS e
LEFT JOIN 
    bonus AS b ON e.empId = b.empId
WHERE 
    b.bonus IS NULL OR b.bonus < 1000;
