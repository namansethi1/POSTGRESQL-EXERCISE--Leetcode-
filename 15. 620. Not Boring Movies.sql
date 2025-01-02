-- Query to select all columns from the 'cinema' table for rows with odd IDs and non-boring descriptions, ordered by rating in descending order
SELECT 
    * 
FROM 
    cinema 
WHERE 
    id % 2 != 0 
    AND description != 'boring' 
ORDER BY 
    rating DESC;
