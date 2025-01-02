-- Query to calculate the average years of experience per project, rounded to two decimal places
SELECT
    p.project_id,
    ROUND(
        SUM(e.experience_years)::numeric / NULLIF(COUNT(p.employee_id), 0)::numeric,
        2
    ) AS average_years
FROM
    project p
LEFT JOIN
    employee e ON p.employee_id = e.employee_id
GROUP BY
    p.project_id;
