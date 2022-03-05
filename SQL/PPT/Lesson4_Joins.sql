SELECT * 
FROM HumanResources.Employee
SELECT *
FROM Person.Person
SELECT * 
FROM HumanResources.EmployeeDepartmentHistory
SELECT *
FROM HumanResources.Department

--Joins: 
--Inner Join
SELECT CONCAT(P.FirstName,SPACE(1),P.LastName) AS 'FullName'
	, D.GroupName
FROM Person.Person AS P
	JOIN HumanResources.EmployeeDepartmentHistory ED
	ON ED.BusinessEntityID = P.BusinessEntityID
	JOIN HumanResources.Department AS D
	ON ED.DepartmentID = D.DepartmentID

--Outer Join
--Left Outer Join
SELECT P.FirstName + ' ' + P.LastName [FullName]
	, D.GroupName
FROM Person.Person AS P
	LEFT JOIN HumanResources.EmployeeDepartmentHistory AS ED
	ON P.BusinessEntityID = ED.BusinessEntityID
	LEFT JOIN HumanResources.Department AS D
	ON D.DepartmentID = ED.DepartmentID

--Right Outer Join
SELECT P.FirstName + ' ' + P.LastName [FullName]
	, D.GroupName
FROM Person.Person AS P
	RIGHT JOIN HumanResources.EmployeeDepartmentHistory AS ED
	ON P.BusinessEntityID = ED.BusinessEntityID
	RIGHT JOIN HumanResources.Department AS D
	ON D.DepartmentID = ED.DepartmentID

--Full Outer Join
SELECT P.FirstName + ' ' + P.LastName [FullName]
	, D.GroupName
FROM Person.Person AS P
	FULL JOIN HumanResources.EmployeeDepartmentHistory AS ED
	ON P.BusinessEntityID = ED.BusinessEntityID
	FULL JOIN HumanResources.Department AS D
	ON D.DepartmentID = ED.DepartmentID

--Cross Join
SELECT E.BusinessEntityID, HE.DepartmentID
FROM HumanResources.Employee AS E
	CROSS JOIN HumanResources.EmployeeDepartmentHistory AS HE

SELECT D1.*, D2.*
FROM HumanResources.Department AS D1
	CROSS JOIN HumanResources.Department AS D2

--Self Join
SELECT D1.*, D2.*
FROM HumanResources.Department AS D1
	JOIN HumanResources.Department AS D2
	ON D1.DepartmentID = D2.DepartmentID

SELECT BEI.*, DI.*
FROM HumanResources.EmployeeDepartmentHistory BEI, HumanResources.EmployeeDepartmentHistory DI
WHERE BEI.BusinessEntityID = DI.DepartmentID

--1.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT CONCAT(P.FirstName,SPACE(1),P.LastName) AS 'FullName'
	, Emp.JobTitle
	, FORMAT(Emp.BirthDate,'dd-MM-yyyy') AS 'Date of Birth'
	--, FORMAT(P.ModifiedDate,'dd-MM-yyyy') AS 'Hire Date'
	, CONVERT(VARCHAR, P.ModifiedDate, 105) AS 'Hire Date'
	, DATEDIFF(YYYY,Emp.BirthDate,P.ModifiedDate) AS 'Age Difference'
FROM HumanResources.Employee AS Emp
	JOIN Person.Person AS P
	ON Emp.BusinessEntityID = P.BusinessEntityID

--2-Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT Emp.FirstName
, Emp.Salary
, Dept.DepartmentName
, Loc.City
FROM Employees AS Emp
	JOIN Departments AS Dept
	ON Emp.DepartmentID = Dept.DepartmentID
	JOIN Locations AS Loc
	ON Loc.LocationID = Dept.LocationID
	WHERE Emp.Salary > 3000

--3-Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT Emp.FirstName
, Emp.Salary
, Dept.DepartmentName
, Loc.City
FROM Employees AS Emp
	LEFT JOIN Departments AS Dept
	ON Emp.DepartmentID = Dept.DepartmentID
	LEFT JOIN Locations AS Loc
	ON Loc.LocationID = Dept.LocationID

--4-Select EmployeeName, ManagerName from the employee table.
SELECT CONCAT(E2.FirstName,SPACE(1),E2.LastName) AS 'Employee Name'
, CONCAT(E1.FirstName,SPACE(1),E1.LastName) AS 'Manager Name'
FROM Employees AS E1
	JOIN Employees AS E2
	ON E2.ManagerID = E1.EmployeeID


SELECT * FROM Employees

SELECT * FROM Employees
WHERE Salary > (SELECT Salary FROM Employees WHERE FirstName IN ('Neena', 'Lex') GROUP BY Salary)
