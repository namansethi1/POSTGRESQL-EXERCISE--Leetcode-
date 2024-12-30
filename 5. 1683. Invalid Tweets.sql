-- Query to select tweet IDs where the content length is greater than 15
SELECT tweet_id
FROM tweets
WHERE LENGTH(content) > 15;
