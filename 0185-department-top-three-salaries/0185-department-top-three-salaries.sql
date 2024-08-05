/* Write your T-SQL query statement below */
WITH e AS 
(
    SELECT name, 
    departmentId, 
    salary, 
    DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rank_used
    FROM [Employee]
)
SELECT d.name AS Department, 
e.name AS Employee, 
e.Salary
FROM [Department] d
LEFT JOIN e
on d.id=e.departmentId
WHERE e.rank_used <=3