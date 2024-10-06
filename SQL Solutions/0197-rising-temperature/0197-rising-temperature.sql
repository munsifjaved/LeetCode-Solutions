/* Write your T-SQL query statement below */
SELECT w1.id
FROM weather w1
JOIN weather w2
ON w1.recordDate=DATEADD(DAY, 1, w2.recordDate)
WHERE w1.temperature>w2.temperature