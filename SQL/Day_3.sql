-- 1. Display the Department id, name and id and the name of its manager.
SELECT Dnum , Dname ,SSN, Fname + ' '+ Lname [Manager]
FROM Departments , Employee
WHERE Departments.MGRSSN = Employee.SSN ;

--2. Display the name of the departments and the name of the projects under its control.
SELECT Dname , Pname 
FROM Departments D,Project P
WHERE D.Dnum = P.Dnum;
--3. Display the full data about all the dependence associated with the name of the employee they depend on him/her.
SELECT E.Fname, E.Lname , D.*
FROM Employee E
, Dependent AS D WHERE D.ESSN = E.SSN;
--4. Display the Id, name and location of the projects in Cairo or Alex city.
SELECT Pnumber , Pname , City  FROM Project 
WHERE City IN ('Cairo' , 'Alex');
--5. Display the Projects full data of the projects with a name starts with "a" letter.
SELECT * FROM Project 
WHERE Pname LIKE 'a%';
--6. display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
SELECT Fname , Lname FROM Employee
WHERE Dno=30 AND Salary BETWEEN 1000 AND 2000;
--7. Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
SELECT E.Fname, E.Lname
FROM Employee E
JOIN Works_for W ON E.SSN = W.ESSN
JOIN Project P ON W.Pno = P.Pnumber
WHERE E.DNO = 10
  AND P.Pname = 'AL Rabwah'
  AND W.Hours >= 10;
--8. Find the names of the employees who directly supervised with Kamel Mohamed.
SELECT E.Fname ,E.Lname FROM Employee E
JOIN Employee S
ON E.SSN = S.Superssn 
WHERE S.Fname = 'Kamel' AND S.Lname= 'Mohamed';
--9. Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
SELECT E.Fname , E.Lname , P.Pname FROM Employee E
JOIN Works_for W ON W.ESSn = E.SSN
JOIN Project P ON W.Pno = P.Pnumber
ORDER BY P.Pname;
--10. For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
SELECT Pnumber , D.Dname , E.Lname , E.Address, E.Bdate  FROM Project P
JOIN Departments D
ON P.Dnum = D.Dnum
JOIN Employee E
ON E.SSN = D.MGRSSN
WHERE City='Cairo';
--11. Display All Data of the managers
SELECT * FROM Employee E 
JOIN Departments D
ON E.SSN = D.MGRSSN ;
--12. Display All Employees data and the data of their dependents even if they have no dependents
SELECT * FROM Employee E 
LEFT JOIN Dependent D
ON E.SSN = D.ESSN;

--13. Insert your personal data to the employee table as a new employee in department
--number 30, SSN = 102672, Superssn = 112233, salary=3000.
INSERT INTO Employee(Dno,SSN,Superssn,Salary)
VALUES(30,102672,112233,3000);
--14. Insert another employee with personal data your friend as new employee in
--department number 30, SSN = 102660, but don’t enter any value for salary or
--supervisor number to him.
INSERT INTO Employee(Dno,SSN)
VALUES(30,102660);
--15. Upgrade your salary by 20 % of its last value.
UPDATE Employee SET Salary = salary + (0.2 * salary);
