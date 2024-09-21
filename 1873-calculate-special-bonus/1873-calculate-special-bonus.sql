/* Write your T-SQL query statement below */
SELECT employee_id, CASE WHEN (name NOT LIKE 'M%' AND employee_id %2=1) THEN salary ELSE 0 END bonus
FROM Employees
ORDER BY 1