-- Query to select names of customers whose referee ID is not 2 or is NULL
SELECT name 
FROM customer 
WHERE referee_id != 2 OR referee_id IS NULL;
