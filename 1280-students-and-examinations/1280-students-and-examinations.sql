WITH StudentSubjectCombinations AS (
    SELECT s.student_id, s.student_name, sub.subject_name
    FROM Students s
    CROSS JOIN Subjects sub
)

SELECT
    ssc.student_id,
    ssc.student_name,
    ssc.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM StudentSubjectCombinations ssc
LEFT JOIN Examinations e ON ssc.student_id = e.student_id AND ssc.subject_name = e.subject_name
GROUP BY ssc.student_id, ssc.student_name, ssc.subject_name
ORDER BY ssc.student_id, ssc.subject_name;
