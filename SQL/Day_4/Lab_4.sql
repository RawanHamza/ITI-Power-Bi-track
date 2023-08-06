--1.Display (Using Union Function)
--a.The name and the gender of the dependence that's gender is Female and depending on Female Employee.
SELECT Dependent_name , Dependent.Sex FROM Dependent
JOIN
Employee 
ON Dependent.ESSN=Employee.SSN
WHERE Dependent.Sex='F' AND Employee.Sex='F'
--b.And the male dependence that depends on Male Employee.
UNION
SELECT Dependent_name , Dependent.Sex FROM Dependent
JOIN
Employee 
ON Dependent.ESSN=Employee.SSN
WHERE Dependent.Sex='M' AND Employee.Sex='M';
--2.For each project, list the project name and the total hours per week (for all employees) spent on that project.
SELECT Pname , SUM(Hours) FROM Project,Works_for 
WHERE Pnumber=Pno
GROUP BY Pname;
--3.Display the data of the department which has the smallest employee ID over all employees' ID.
SELECT * FROM Departments
JOIN
Employee 
ON Departments.Dnum=Employee.Dno
WHERE SSN= (SELECT MIN(SSN) FROM Employee);
--4.For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
SELECT Dname , MAX(Salary) [Max Salary],MIN(Salary) [MIN Salary],AVG(Salary) [AVG Salary] FROM Departments , Employee
WHERE Departments.Dnum = Employee.Dno
GROUP BY Dname;
--5.List the full name of all managers who have no dependents.
SELECT Fname + ' ' + Lname AS [Full Name] FROM Employee
JOIN Departments
ON Employee.SSN=Departments.MGRSSN
EXCEPT
SELECT Fname + ' ' + Lname AS [Full Name] FROM Employee
JOIN Dependent
ON Employee.SSN = Dependent.ESSN

--6.For each department
-- if its average salary is less than the average salary of all employees
-- display its number, name and number of its employees.
SELECT Dnum ,Dname , COUNT(Dno) FROM Departments , Employee
WHERE Departments.Dnum=Employee.Dno
GROUP BY Dnum, Dname
HAVING AVG(Employee.Salary)<
(SELECT AVG(Salary) FROM Employee)

--7.Retrieve a list of employees names and the projects names they are working on <-----
--ordered by department number and within each department, ordered alphabetically by last name, first name.
SELECT Dnum,Fname , Lname , Pname  FROM Employee
JOIN Project
ON Employee.Dno=Project.Dnum
JOIN Works_for w
ON w.Pno=Project.Pnumber
ORDER BY Dnum , Lname , Fname; --Not ordered Alphabetically!!!!

--8.Try to get the max 2 salaries using subquery 
SELECT Salary FROM Employee WHERE Salary IN
(SELECT DISTINCT TOP(2) Salary FROM Employee ORDER BY Salary DESC);

--9.Get the full name of employees that is similar to any dependent name
SELECT Fname + ' ' + Lname AS FullName FROM Employee
WHERE Fname IN (SELECT Dependent_name FROM Dependent) OR
Lname IN(SELECT Dependent_name FROM Dependent);
--10.Display the employee number and name if at least one of them have dependents (use exists keyword) self-study.
SELECT SSN, Fname + ' ' +Lname [Full Name] FROM Employee 
WHERE SSN IN (SELECT DISTINCT ESSN FROM Dependent);
--11.In the department table insert new department called "DEPT IT" , with id 100, employee 
--with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'
INSERT INTO Departments(Dnum,Dname,MGRSSN)
VALUES(100,'DEPI IT',112233);
--12.Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department(id = 100), 
--and they give you(your SSN =102672) her position (Dept. 20 manager) 
--a.First try to update her record in the department table
UPDATE Departments SET MGRSSN=968574
WHERE Dnum=100;
--b.Update your record to be department 20 manager.
UPDATE Departments SET MGRSSN=102672
WHERE Dnum=20
--c.Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)
UPDATE Employee SET Dno=20 ,Superssn=102672
WHERE SSN =102660;
--13.Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344) so try to delete his data from your database 
--in case you know that you will be temporarily in his position.
--Hint:(Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or works in any projects and handle these cases).
DELETE Works_for WHERE ESSN=223344;
DELETE Dependent WHERE ESSN=223344;
SELECT Fname , Lname , MGRSSN  FROM Employee , Departments
WHERE MGRSSN=SSN;
UPDATE Departments
SET MGRSSN=102672
WHERE MGRSSN=223344;
SELECT Fname,Lname FROM Employee WHERE Superssn=223344;
UPDATE Employee SET Superssn=102672
WHERE Superssn=223344;
DELETE Employee WHERE SSN=223344;

--14.Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30%
UPDATE Employee SET Salary =Salary*1.3
WHERE SSN in(SELECT ESSN FROM Works_for
JOIN
Project ON Pno=Pnumber
WHERE Pname='Al Rabwah')
