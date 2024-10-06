/* Write your T-SQL query statement below */
WITH pp AS (
    SELECT count(product_key) as p_count FROM product
)
SELECT c.customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING count(DISTINCT c.product_key)=(SELECT p_count FROM pp)

