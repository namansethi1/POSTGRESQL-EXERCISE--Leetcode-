-- Query to select customer IDs and count of visits without transactions (left join to find visits without corresponding transactions)
SELECT v.customer_id, COUNT(v.customer_id) AS count_no_trans
FROM visits AS v
LEFT JOIN transactions AS t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;
