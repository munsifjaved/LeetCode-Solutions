SELECT name, bonus
FROM Employee e
LEFT JOIN  Bonus b 
ON e.empID=b.empID
WHERE bonus < 1000 OR bonus IS NULL