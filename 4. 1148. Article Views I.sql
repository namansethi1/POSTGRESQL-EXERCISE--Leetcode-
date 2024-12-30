-- Query to select distinct author IDs where the author is also the viewer, ordered by author ID
SELECT DISTINCT author_id AS id 
FROM views 
WHERE author_id = viewer_id 
ORDER BY author_id;
