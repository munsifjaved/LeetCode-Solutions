/* Write your T-SQL query statement below */
SELECT e1.employee_id,e1.name, count(e2.reports_to) reports_count,ROUND(avg(CAST(e2.age AS DECIMAL)),0) average_age
FROM Employees e1
JOIN Employees e2
ON e1.employee_id=e2.reports_to
GROUP BY e1.employee_id, e1.name
order by e1.employee_id