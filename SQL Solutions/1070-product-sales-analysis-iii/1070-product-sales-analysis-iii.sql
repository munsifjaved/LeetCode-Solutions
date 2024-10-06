/* Write your T-SQL query statement below */
WITH temp AS (
SELECT product_id,year  first_year,quantity,price,
rank() OVER(PARTITION BY product_id ORDER BY year) as rnk
FROM Sales )

SELECT product_id,first_year,quantity,price
FROM temp WHERE rnk=1