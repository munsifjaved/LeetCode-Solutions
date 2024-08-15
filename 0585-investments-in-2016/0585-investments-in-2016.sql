/* Write your T-SQL query statement below */
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance i
WHERE EXISTS (SELECT * FROM Insurance WHERE i.tiv_2015 = tiv_2015 AND i.pid <> pid)
AND NOT EXISTS (SELECT * FROM Insurance WHERE i.pid <> pid AND i.lat = lat AND i.lon = lon)