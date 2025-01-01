-- Query to select student IDs, names, subject names, and the count of attended exams for each subject
-- It returns 0 for students who haven't attended any exams for a particular subject
SELECT s.student_id, 
       s.student_name, 
       subj.subject_name, 
       COALESCE(COUNT(e.subject_name), 0) AS attended_exams
FROM students AS s
CROSS JOIN subjects AS subj
LEFT JOIN examinations AS e 
    ON e.student_id = s.student_id 
    AND e.subject_name = subj.subject_name
GROUP BY s.student_id, s.student_name, subj.subject_name
ORDER BY s.student_id, subj.subject_name;
