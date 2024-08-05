/* Write your T-SQL query statement below */
SELECT Round(
    (100.00*COUNT(case when order_date = customer_pref_delivery_date then 1 end))/COUNT(customer_id),2
    ) AS immediate_percentage
FROM (SELECT *, 
      DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS rank 
      FROM Delivery) AS data
WHERE rank = 1