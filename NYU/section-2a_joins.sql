/*List all students and course ids for classes they are taking*/

SELECT *
FROM student
LIMIT 10;

SELECT *
FROM class
LIMIT 10;

SELECT *
FROM student 
INNER JOIN class
ON ssn = stu_ssn;

/*List all students, course ids and course descriptions for courses they are taking*/

SELECT *
FROM student
LIMIT 10;

SELECT *
FROM class
LIMIT 10;

SELECT *
FROM course
LIMIT 10;

SELECT student_id, lname, fname, ssn, course.course_id, course.description
FROM student
INNER JOIN class
ON ssn = stu_ssn
INNER JOIN course
ON class.course_id = course.course_id
ORDER BY student_id;

/*List all instructors, and their students - only list instructors that have students*/

SELECT *
FROM student
LIMIT 10;

SELECT *
FROM instructor
LIMIT 10;

SELECT *
FROM class;

SELECT instructor_id, instructor.lname, instructor.fname, instructor.ssn, course_id, inst_ssn, stu_ssn, student_id, student.lname, student.fname, student.ssn
FROM instructor
INNER JOIN class
ON instructor.ssn = class.inst_ssn
INNER JOIN student
ON class.stu_ssn = student.ssn
ORDER BY instructor_id;

/*List all students, course ids and course descriptions. Include all students regardless of whether they are taking a class or not (think outer join)*/

SELECT *
FROM student
LIMIT 10;

SELECT *
FROM course
LIMIT 10;

SELECT *
FROM class
LIMIT 10;

SELECT student_id, lname, fname, course.course_id, course.description
FROM student
LEFT JOIN class
ON ssn = stu_ssn
LEFT JOIN course
ON class.course_id = course.course_id
ORDER BY student_id;

/*List all instructors (currently teaching or not), classes they are teaching, and all their students (as well as students not taking any classes)
- Data from all 3 tables (instructors, classes, students) must be all on the same line.
- Hint: in Oracle it is easy. How would you do this in MySql? Think UNION*/

SELECT *
FROM instructor;

SELECT *
FROM class
LIMIT 10;

SELECT *
FROM student;

SELECT instructor.fname AS 'Instructor fname', instructor.lname AS 'Instructor lname', class.course_id AS 'Course Id', student.fname AS 'Student fname', student.lname AS 'Student lname'
FROM instructor
LEFT JOIN class
ON instructor.ssn = class.inst_ssn
LEFT JOIN student
ON class.stu_ssn = student.ssn
UNION
SELECT NULL, NULL, NULL, student.fname, student.lname
FROM student
LEFT JOIN class
ON student.ssn = class.stu_ssn
WHERE class.course_id IS NULL;