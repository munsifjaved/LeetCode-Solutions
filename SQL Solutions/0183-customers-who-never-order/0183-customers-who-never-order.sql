/* Write your T-SQL query statement below */
SELECT c.name AS Customers
FROM Customers AS c
LEFT JOIN Orders o
ON c.id=o.customerId
WHERE o.customerId IS NULL