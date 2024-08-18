/* Write your T-SQL query statement below */
WITH temp AS(
    SELECT requester_id id, COUNT(accepter_id) num 
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id id, COUNT(requester_id ) num 
    FROM RequestAccepted
    GROUP BY accepter_id)
SELECT TOP 1 id, max_num num
FROM (SELECT id, SUM(num) max_num
    FROM temp
    GROUP BY id) AS temp2
ORDER BY max_num desc


