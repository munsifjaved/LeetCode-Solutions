WITH cte1 AS (
    SELECT student_id, subject, exam_date, score,
           ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS rnk
    FROM scores
),
cte2 AS (
    SELECT student_id, subject, exam_date, score,
           ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) AS rnk
    FROM scores
)

SELECT 
    a.student_id, 
    a.subject, 
    b.score AS first_score, 
    a.score AS latest_score
FROM cte1 AS a 
JOIN cte2 AS b 
    ON a.student_id = b.student_id 
    AND a.subject = b.subject
WHERE a.rnk = 1 
  AND b.rnk = 1
  AND a.exam_date>b.exam_date
  AND a.score>b.score;
