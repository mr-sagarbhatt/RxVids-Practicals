--SubQuery: Query within a query
SELECT *
FROM HumanResources.Employee
WHERE VacationHours >
(
SELECT VacationHours
FROM HumanResources.Employee
WHERE NationalIDNumber = 112457891
)

--IN
SELECT *
FROM HumanResources.Employee
SELECT * 
FROM Person.Person

SELECT *
FROM HumanResources.Employee
WHERE BusinessEntityID IN
(
SELECT BusinessEntityID
FROM Person.Person
WHERE PersonType = 'EM'
)

--EXISTS
SELECT *
FROM HumanResources.Employee
WHERE EXISTS
(
SELECT *
FROM HumanResources.EmployeeDepartmentHistory
WHERE BusinessEntityID = HumanResources.Employee.BusinessEntityID 
AND
DepartmentID = 10
)

--Nested Subquries
SELECT *
FROM HumanResources.EmployeeDepartmentHistory

SELECT *
FROM HumanResources.Employee
WHERE BusinessEntityID IN
(
SELECT BusinessEntityID
FROM HumanResources.EmployeeDepartmentHistory
WHERE DepartmentID = 
(
SELECT DepartmentID
FROM HumanResources.Department
WHERE Name = 'Engineering'
)
)

--Correlated SubQuries
--Database Day2
SELECT *
FROM Employees as Emp
WHERE Salary =
(
SELECT MAX(Salary)
FROM Employees
WHERE DepartmentID = Emp.DepartmentID
)

--View
CREATE VIEW VIEW_Employee
AS
SELECT * 
FROM HumanResources.Employee
WHERE BusinessEntityID <= 10

SELECT *
FROM VIEW_Employee

--Variable:
DECLARE @FirstName VARCHAR(10) -- DECLARE @var_name DataType
SET @FirstName = 'Sagar'
PRINT @FirstName
SELECT @FirstName

--Programming Construct
--IF..Else
SELECT *
FROM HumanResources.EmployeePayHistory

DECLARE @Rate MONEY
DECLARE @Bid INT

SELECT @Bid = BusinessEntityID, @Rate = Rate
FROM HumanResources.EmployeePayHistory
IF @Rate < 15
BEGIN
PRINT 'Review is required'
PRINT CONCAT('Bid= ', @Bid)
PRINT CONCAT('Rate = ', @Rate)
END
ELSE
BEGIN
PRINT 'Review is not required'
PRINT CONCAT('Bid= ', @Bid)
PRINT CONCAT('Rate = ', @Rate)
END

--CASE
SELECT *
FROM HumanResources.Employee

SELECT BusinessEntityID, 'MaritalStatus' = 
CASE MaritalStatus
	WHEN 's' THEN 'Single'
	WHEN 'm' THEN 'Married'
	ELSE 'Not Specified'
END
FROM HumanResources.Employee

--While
DECLARE @e_id INT
DECLARE @rate MONEY
DECLARE @flag INT

SELECT TOP 1 @flag = BusinessEntityID
FROM HumanResources.EmployeePayHistory
ORDER BY BusinessEntityID 

SELECT TOP 1 @e_id = BusinessEntityID
FROM HumanResources.EmployeePayHistory
ORDER BY BusinessEntityID DESC

WHILE(@flag <= @e_id)
BEGIN

SELECT @rate = Rate 
FROM HumanResources.EmployeePayHistory
WHERE BusinessEntityID = @flag
IF @rate < 15
    BEGIN
        PRINT 'Reviw is required'
        PRINT CONCAT('ID:',@flag,SPACE(5),'RATE:', @rate)
    END
ELSE
    BEGIN
        PRINT 'Reviw not required'
        PRINT CONCAT('ID:',@flag,SPACE(5),'RATE:', @rate)
    END
SET @flag += 1
END
