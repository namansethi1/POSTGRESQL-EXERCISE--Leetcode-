-- Query to find the ID(s) of the user(s) with the maximum number of friends.

WITH combined_friends AS (
    SELECT requester_id AS friend
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS friend
    FROM RequestAccepted
),
friend_counts AS (
    SELECT
        friend AS id,
        COUNT(*) AS num
    FROM combined_friends
    GROUP BY friend
)
SELECT
    id,
    num
FROM friend_counts
WHERE num = (SELECT MAX(num) FROM friend_counts);
