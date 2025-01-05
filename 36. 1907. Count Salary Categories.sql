-- Query to categorize accounts based on income into Low, Average, and High Salary ranges
SELECT
    'Low Salary' AS category,
    COUNT(income) AS accounts_count
FROM
    accounts
WHERE
    income < 20000 

UNION ALL

SELECT
    'Average Salary' AS category,
    COUNT(income) AS accounts_count
FROM
    accounts
WHERE
    income BETWEEN 20000 AND 50000

UNION ALL

SELECT
    'High Salary' AS category,
    COUNT(income) AS accounts_count
FROM
    accounts
WHERE
    income > 50000;
