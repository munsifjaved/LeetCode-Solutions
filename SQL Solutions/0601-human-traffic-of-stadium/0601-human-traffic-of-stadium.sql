WITH TOTAL AS (
    SELECT S1.id AS id1, S2.id AS id2, S3.id AS id3
    FROM Stadium AS S1
    LEFT JOIN Stadium AS S2
    ON S2.id = DATEADD(day, 1, S1.id)
    LEFT JOIN Stadium AS S3
    ON S3.id = DATEADD(day, 1, S2.id)
    WHERE S1.people >= 100 AND S2.people >= 100 AND S3.people >= 100
)

SELECT DISTINCT
S.id, S.visit_date, S.people
FROM Stadium AS S
INNER JOIN TOTAL
ON S.id = TOTAL.id1 OR S.id = TOTAL.id2 OR S.id = TOTAL.id3
ORDER BY S.visit_date