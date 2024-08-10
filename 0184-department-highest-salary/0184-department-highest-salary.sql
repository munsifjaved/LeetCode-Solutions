/* Write your T-SQL query statement below */
SELECT  Department, Employee, Salary
FROM (
    SELECT d.name Department,e.name Employee, e.salary Salary, 
    RANK() OVER(Partition by e.departmentID order by e.salary DESC)  AS rnk
    FROM Employee AS e
    JOIN Department AS d
    on e.departmentID=d.id
) AS temp
WHERE rnk=1