-- Query to delete duplicate entries from the 'person' table, keeping the record with the minimum ID for each email
DELETE FROM person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM person
    GROUP BY email
);
