/* Write your T-SQL query statement below */
SELECT TOP 1 customer_number 
FROM (SELECT customer_number, count(order_number) as quantity
    FROM Orders
    group by customer_number) AS temp
ORDER BY quantity desc
