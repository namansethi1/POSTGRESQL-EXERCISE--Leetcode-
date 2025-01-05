-- Query to determine the primary department for each employee
WITH primary_departments AS (
    SELECT
        employee_id,
        department_id
    FROM
        employee
    WHERE
        primary_flag = 'Y'
),
single_department_employees AS (
    SELECT
        employee_id,
        MAX(department_id) AS department_id
    FROM
        employee
    GROUP BY
        employee_id
    HAVING
        COUNT(*) = 1
)
SELECT
    employee_id,
    department_id
FROM
    primary_departments
UNION ALL
SELECT
    employee_id,
    department_id
FROM
    single_department_employees
ORDER BY
    employee_id;
