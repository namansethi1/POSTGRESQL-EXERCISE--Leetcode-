-- Query to find the number of subordinates and their average age for each employee
SELECT
    e.employee_id,
    e.name,
    COUNT(sub_reports.employee_id) AS reports_count,
    ROUND(AVG(sub_reports.age)) AS average_age
FROM
    employees e
JOIN
    employees sub_reports ON sub_reports.reports_to = e.employee_id
GROUP BY
    e.employee_id, e.name
HAVING
    AVG(sub_reports.age) IS NOT NULL
ORDER BY
    e.employee_id;
