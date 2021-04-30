/*Display course prices, and prices with a 4.5% increase. Display the new price rounded and formatted to 2 decimal places.
Call the new column 'new price'*/
SELECT price, ROUND((price + (price * .045)),2) AS "new price"
FROM course;

/*Display all student information, and the first 10 character of the combined lastname, firstname.*/
SELECT *, SUBSTRING(CONCAT(lname, ",", fname),1,10) AS "last name,first name"
FROM student;

/*Display all student first name, last name and sex. Display sex as 'Male' or 'Female' instead of M/F.*/
SELECT fname, lname,
CASE
WHEN sex = "M" THEN "Male"
WHEN sex = "F" THEN "Female"
END AS sex
FROM student;

/*Display all information for students taking courses containing the word 'Web' or 'web'
You can of course use LIKE. However for this exercise, do not use LIKE.*/
SELECT student.ssn,student.lname,student.fname,student.ssn,student.sex,course.description
FROM student
INNER JOIN class
ON student.ssn = class.stu_ssn
INNER JOIN course
ON class.course_id = course.course_id
WHERE INSTR(course.description,"Web") > 0 || INSTR(course.description,"web") > 0;

/*Display the current date, current time, and both date & time together*/
SELECT CURDATE() AS Date,CURTIME() AS Time,CONCAT(CURDATE()," ",CURTIME()) AS "Date/Time";

/*Compute how old you are in days (substitute any day you wish)*/
SELECT DATEDIFF(CONCAT(CURDATE()," ",CURTIME()),"1992-09-24 00:00:00") AS "Days I've Been Alive";

/*Compute how many hours left in this year*/
SELECT HOUR(TIMEDIFF("2022-01-01 00:00:00",CONCAT(CURDATE()," ",CURTIME()))) AS "Hours Left This Year";

/*Display the date for next week for the same day as today.*/
SELECT ADDDATE(CURDATE(),INTERVAL 7 DAY) AS "Next Week's Date";

/*Add 2.5 hours to the current time*/
SELECT ADDTIME(CURTIME(),TIME_TO_SEC("02:30:00"));

/*Display the date and time for 1:00pm for the first day of this year, using format: Day, Mon DD YYYY HH:MI:SS PM*/
SELECT CONCAT(DATE_FORMAT("2021-01-01","%D %M %d %Y")," ",TIME_FORMAT("13:00:00","%r"));