/* Write your T-SQL query statement below */
WITH temp1 AS (SELECT TOP 1 u.name, count(rating) rating_count
    FROM Users u
    JOIN MovieRating mr
    on u.user_id=mr.user_id
    GROUP BY u.name
    ORDER BY rating_count DESC, u.name ASC
    ),
temp2 AS (
    SELECT TOP 1 m.title, avg(CAST(mr.rating AS DECIMAL)) rating_average
    FROM Movies m
    JOIN MovieRating mr
    on m.movie_id=mr.movie_id
    AND mr.created_at LIKE '2020-02%'
    GROUP BY m.title
    ORDER BY rating_average DESC, m.title ASC
)
SELECT name AS results
FROM temp1
UNION ALL 
SELECT title AS results
FROM temp2