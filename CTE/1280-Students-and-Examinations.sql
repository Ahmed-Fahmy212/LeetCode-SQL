SELECT 
    S.student_id,
    S.student_name,
    SJ.subject_name,
    COUNT(E.student_id) AS attended_exams
FROM 
    Students S
CROSS JOIN 
    Subjects SJ
LEFT JOIN 
    Examinations E 
ON 
    E.student_id = S.student_id AND E.subject_name = SJ.subject_name
GROUP BY 
    S.student_id, S.student_name, SJ.subject_name