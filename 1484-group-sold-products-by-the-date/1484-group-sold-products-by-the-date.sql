/* Write your T-SQL query statement below */
WITH DistinctProducts AS (
    SELECT DISTINCT sell_date, product
    FROM Activities
)
SELECT sell_date,COUNT(product) AS num_sold, STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM DistinctProducts
GROUP BY sell_date
ORDER BY sell_date;
