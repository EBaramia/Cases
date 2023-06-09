/*
CREATED BY: <Name>
CREATED ON: 08/06/2023
DESCRIPTION: Запрос выбирает всех студентов, обучающихся на курсе "Математика".
*/

SELECT s.*
FROM student s
JOIN course c ON s.fk_course_id = c.course_id
WHERE c.title = 'Математика';


/*
CREATED BY: <Name>
CREATED ON: 08/06/2023
DESCRIPTION: Запрос обновит оценку студента по курсу.
*/

UPDATE evaluation
SET evaluation_value = 'new_value'
WHERE evaluation_id = 'value_id' 
AND fk_evaluation_type_id IN (
  SELECT evaluation_type_id 
  FROM evaluation_type 
  WHERE fk_evaluation_type_independent_work IS NULL
)
AND evaluation_id IN (
  SELECT evaluation_id 
  FROM evaluation_student 
  WHERE student_id = 'student_id' 
  AND evaluation_id IN (
    SELECT evaluation_id 
    FROM evaluation_course 
    WHERE course_id = 'course_id'
  )
);


/*
CREATED BY: <Name>
CREATED ON: 08/06/2023
DESCRIPTION: Запрос выберет всех преподавателей, которые преподают в здании №3.
*/

SELECT DISTINCT t.teacher_id, t.first_name, t.last_name
FROM teacher t
INNER JOIN teacher_faculty tf ON t.teacher_id = tf.teacher_id
INNER JOIN faculty f ON tf.faculty_id = f.faculty_id
INNER JOIN building_faculty bf ON f.faculty_id = bf.faculty_id
INNER JOIN building b ON bf.building_id = b.building_id
WHERE b.building_id = 3;


/*
CREATED BY: <Name>
CREATED ON: 08/06/2023
DESCRIPTION: Запрос удалит задание для самостоятельной работы, которое было создано более года назад.
*/

DELETE FROM independent_work
WHERE assignment_date <= NOW() - INTERVAL '1 year';


/*
CREATED BY: <Name>
CREATED ON: 08/06/2023
DESCRIPTION: Запрос добавить новый семестр в учебный год.
*/

SELECT (semester_type, start_date, end_date)
FROM semester

INSERT INTO semester (semester_type, start_date, end_date)
VALUES ('Весенний семестр', '2023-09-01', '2023-12-31');