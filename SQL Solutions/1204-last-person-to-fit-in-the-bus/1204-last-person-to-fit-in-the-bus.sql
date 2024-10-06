/* Write your T-SQL query statement below */
WITH temp AS (
    SELECT person_name,turn,SUM(weight) OVER(ORDER BY turn ASC) AS cum_sum
    FROM Queue
)
SELECT TOP 1 person_name 
FROM temp
WHERE cum_sum<=1000
ORDER BY turn DESC