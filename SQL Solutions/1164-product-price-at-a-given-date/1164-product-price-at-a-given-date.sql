SELECT p2.product_id,COALESCE(p1.new_price,10) price
FROM (SELECT product_id,new_price,change_date, 
RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) rnk
FROM Products
WHERE change_date<='2019-08-16') p1
RIGHT JOIN (SELECT DISTINCT product_id FROM Products) p2
ON p1.product_id=p2.product_id
AND rnk=1
