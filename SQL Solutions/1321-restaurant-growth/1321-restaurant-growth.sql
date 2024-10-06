/* Write your T-SQL query statement below */
WITH AggregatedData AS (
    SELECT visited_on, SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT visited_on, 
SUM(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) amount, 
ROUND(AVG(CAST(total_amount AS DECIMAL(10, 2))) OVER (
    ORDER BY visited_on 
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
), 2) AS average_amount
FROM AggregatedData
ORDER BY visited_on
OFFSET 6 ROWS

