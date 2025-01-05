-- Query to find the highest-rated user and the highest-rated movie in February 2020
WITH user_movie_rating_count AS (
    SELECT
        user_id,
        COUNT(user_id) AS user_count
    FROM
        movierating
    GROUP BY
        user_id
),
movie_average_rating AS (
    SELECT
        movie_id,
        AVG(rating) AS avg_rating
    FROM
        movierating
    WHERE
        EXTRACT(MONTH FROM created_at) = 2 
        AND EXTRACT(YEAR FROM created_at) = 2020
    GROUP BY
        movie_id
),
highest_rated_user AS (
    SELECT
        u.name AS results
    FROM
        users u
    JOIN
        user_movie_rating_count umrc ON u.user_id = umrc.user_id
    WHERE
        umrc.user_count = (
            SELECT MAX(user_count) FROM user_movie_rating_count
        )
    ORDER BY
        u.name
    LIMIT 1
),
highest_rated_movie AS (
    SELECT
        m.title AS results
    FROM
        movies m
    JOIN
        movie_average_rating mar ON m.movie_id = mar.movie_id
    WHERE
        mar.avg_rating = (
            SELECT MAX(avg_rating) FROM movie_average_rating
        )
    ORDER BY
        m.title
    LIMIT 1
)
SELECT results FROM highest_rated_user
UNION ALL
SELECT results FROM highest_rated_movie;
