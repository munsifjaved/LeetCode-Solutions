/* Write your T-SQL query statement below */
SELECT project_id, ROUND(AVG(experience_years*1.0),2) AS average_years
FROM Project p
LEFT JOIN Employee e
ON p.employee_id=e.employee_id
GROUP BY project_id