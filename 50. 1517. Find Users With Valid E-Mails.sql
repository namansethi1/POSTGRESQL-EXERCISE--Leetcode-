-- Query to retrieve users with email addresses matching the LeetCode domain pattern.

SELECT 
    user_id, 
    name, 
    mail 
FROM 
    Users 
WHERE 
    mail ~ '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\.com$';
