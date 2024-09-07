/* Write your T-SQL query statement below */

SELECT  u.name, SUM(COALESCE(r.distance,0)) travelled_distance
FROM Rides r
RIGHT JOIN Users u
ON r.user_id=u.id
GROUP BY u.id,u.name
ORDER BY travelled_distance DESC, u.name ASC