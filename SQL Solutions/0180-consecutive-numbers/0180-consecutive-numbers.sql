/* Write your T-SQL query statement below */
WITH Consecutive AS (
    SELECT id,num AS num_orginial, 
    lead(id,1) OVER(order by id asc) AS id_next1,
    lead(num,1) OVER(order by id asc) AS num_next1,
    lead(id,2) OVER(order by id asc) AS id_next2,
    lead(num,2) OVER(order by id asc) AS num_next2
    FROM logs
)
SELECT DISTINCT num_orginial AS ConsecutiveNums FROM Consecutive
WHERE num_orginial=num_next1 AND num_orginial=num_next2
AND id+1=id_next1 AND id_next1+1=id_next2
