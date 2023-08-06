--1.	Retrieve number of students who have a value in their age.
SELECT COUNT(St_id) FROM Student 
WHERE St_Age is not null ;
SELECT St_Fname FROM Student 
WHERE St_Age is not null ;
--2.	Get all instructors Names without repetition
SELECT DISTINCT Ins_Name FROM Instructor;
--3.	Display student with the following Format (use isNull function)
SELECT St_id [Student ID], 
ISNULL(St_Fname +' ' + St_Lname ,'Unknown' ) AS [Student Full Name] , 
Dept_Name [Department name]  
FROM Student s , Department d
WHERE s.Dept_Id=d.Dept_Id;

--4.	Display instructor Name and Department Name 
--Note: display all the instructors if they are attached to a department or not
SELECT Ins_Name , Dept_Name FROM Instructor i 
LEFT OUTER JOIN Department d
ON i.Dept_Id=d.Dept_Id;

--5.	Display student full name and the name of the course he is taking
--For only courses which have a grade  
SELECT St_Fname +' ' + St_Lname AS [Full Name] ,Crs_Name 
FROM Student s
JOIN Stud_Course sc ON  s.St_Id=sc.St_Id
JOIN Course  c
ON c.Crs_Id = sc.Crs_Id
WHERE Grade is not null;

--6.	Display number of courses for each topic name
SELECT Top_Name,COUNT(Crs_id) AS[number of courses]
FROM Course,Topic
WHERE Course.Top_Id=Topic.Top_Id
GROUP BY Top_Name;

--7.	Display max and min salary for instructors
UPDATE Instructor SET Salary =150000
WHERE Ins_Id=1;
UPDATE Instructor SET Salary =190000
WHERE Ins_Id=2;
UPDATE Instructor SET Salary =200000
WHERE Ins_Id=3
UPDATE Instructor SET Salary =10000
WHERE Ins_Id=4;
UPDATE Instructor SET Salary =150000
WHERE Ins_Id=5;
UPDATE Instructor SET Salary =150000
WHERE Ins_Id=6;
UPDATE Instructor SET Salary =140000
WHERE Ins_Id=7;
UPDATE Instructor SET Salary =130000
WHERE Ins_Id=8;
UPDATE Instructor SET Salary =150000
WHERE Ins_Id=9;

SELECT MAX(Salary),MIN(Salary) FROM Instructor;

--8.	Display instructors who have salaries less than the average salary of all instructors.
SELECT Ins_Name , Salary FROM Instructor
WHERE Salary < (
SELECT AVG(ISNULL((Salary),0))
FROM Instructor
)
--9.	Display the Department name that contains the instructor who receives the minimum salary.
SELECT Dept_Name FROM Department d
JOIN
Instructor i
ON d.Dept_Id=i.Dept_Id
WHERE i.Salary=(
SELECT MIN(Salary) FROM Instructor);
--10.	 Select max two salaries in instructor table. 
SELECT TOP(2) Salary FROM Instructor
ORDER BY Salary DESC;
--11.	 Select instructor name and his salary but if there is no salary display instructor bonus keyword.
--“use coalesce Function”
SELECT Ins_Name, COALESCE(CAST(Salary AS VARCHAR(20)), 'Instructor Bonus') AS Salary
FROM Instructor;

--12.	Select Average Salary for instructors 
SELECT AVG(ISNULL(Salary,0))
FROM Instructor;
--13.	Select Student first name and the data of his supervisor 
SELECT St_Fname , Ins_Name , Ins_Id ,Ins_Degree, Salary,Instructor.Dept_Id FROM Student
JOIN Instructor
ON Student.St_super=Instructor.Ins_Id;
--14.	Write a query to select the highest two salaries in Each Department for instructors who have 
--salaries. “using one of Ranking Functions”
SELECT * FROM(
SELECT Ins_Name, Salary, Dept_Id, DENSE_RANK() over (partition by Dept_Id ORDER BY Salary desc) AS [salary_rank]
FROM Instructor
WHERE Salary IS NOT NULl) t
WHERE salary_rank<=2;

--15.	 Write a query to select a random  student from each department.  “using one of Ranking Functions”
SELECT *
FROM (
SELECT Dept_Id, St_Id, St_Fname, St_Lname,
ROW_NUMBER() OVER (PARTITION BY Dept_Id ORDER BY NEWID()) AS row_num
FROM Student
) AS ranked_students
WHERE row_num = 1;
