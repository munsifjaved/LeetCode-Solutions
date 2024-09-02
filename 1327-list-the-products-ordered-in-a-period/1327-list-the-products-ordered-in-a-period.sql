/* Write your T-SQL query statement below */
SELECT p.product_name, SUM(o.unit) unit
FROM Orders o
JOIN Products p
ON o.product_id=p.product_id
WHERE o.order_date LIKE '2020-02%'
GROUP BY p.product_name
HAVING SUM(o.unit)>=100