USE AdventureWorks2019
--Stored Procedures
SELECT * 
FROM HumanResources.Employee
SELECT * 
FROM HumanResources.Department
SELECT * 
FROM HumanResources.EmployeeDepartmentHistory
GO

--Create Procedure
CREATE PROCEDURE Person.uspPersonDetails
	@LastName NVARCHAR(20)
	, @FirstName NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON
	SELECT BusinessEntityID
		, CONCAT(FirstName, SPACE(1), LastName) 'Person Name'
		, PersonType
	FROM Person.Person
	WHERE FirstName = @FirstName 
		AND LastName = @LastName
		AND PersonType LIKE 'EM'
	SET NOCOUNT OFF
END

--Execute Procedure
EXEC Person.uspPersonDetails N'Miller', N'Dylan'
EXECUTE Person.uspPersonDetails @LastName = N'Miller', @FirstName = N'Dylan'
EXECUTE Person.uspPersonDetails @FirstName = N'Dylan', @LastName = N'Miller'

--Drop procedure
DROP PROCEDURE Person.uspPersonDetails

CREATE PROCEDURE HumanResources.uspGetEmployeeDetails
	@EmployeeId INT
	, @DeptName VARCHAR(50) OUTPUT
	, @ShiftId INT OUTPUT
AS
BEGIN
	IF EXISTS(SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = @EmployeeId)
	BEGIN
		SELECT @DeptName = d.Name
			, @ShiftId = edh.ShiftID
		FROM HumanResources.Employee e
			INNER JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
			INNER JOIN Department d ON edh.DepartmentID = d.DepartmentID
		WHERE e.BusinessEntityID = @EmployeeId
	END
	RETURN 0
END

DECLARE @DeptName VARCHAR(50), @ShiftId INT
EXEC HumanResources.uspGetEmployeeDetails 1, @DeptName OUTPUT, @ShiftId OUT
SELECT @DeptName, @ShiftId

DROP PROCEDURE HumanResources.uspGetEmployeeDetails

--Call Procedure from another procedure
CREATE PROCEDURE HumanResources.uspDisplayEmployeeStatus @EmployeeId INT
AS
BEGIN
	DECLARE @DeptName VARCHAR(50)
		, @ShiftId INT
		, @ReturnValue INT
	EXEC @ReturnValue =	HumanResources.uspGetEmployeeDetails @EmployeeId, @DeptName OUTPUT, @ShiftId OUTPUT
	IF (@ReturnValue = 0)
	BEGIN
		PRINT 'The details of an employee with ID: ' + CONVERT(VARCHAR(10), @EmployeeId)
		PRINT 'Department Name: ' + @DeptName
		PRINT 'ShifId: ' + CONVERT(CHAR(1), @ShiftId)
		SELECT *
		FROM HumanResources.Employee
		WHERE BusinessEntityID = @EmployeeId
	END
	ELSE
		PRINT 'No records found for the given employee.'
END
GO

EXEC HumanResources.uspDisplayEmployeeStatus 10

DROP PROCEDURE HumanResources.uspDisplayEmployeeStatus

--System Defined Stored Procedure:
	EXEC sp_rename 'Person.usp_PersonDetails', 'Person.usp_PersonDetailsNew'
	EXEC sp_helpdb AdventureWorks2019
	EXEC sp_help

--JSON
USE Sagar1
GO

CREATE PROCEDURE uspJsonData
    @InputDetails NVARCHAR(MAX)
AS 
BEGIN
    SET NOCOUNT ON
        INSERT INTO dbo.Faculty
        SELECT F_Name
        FROM OPENJSON(@InputDetails)
        WITH(
        F_Name NVARCHAR(50) N'$.F_Name'
        ) AS JSON_Details
    SET NOCOUNT OFF
		SELECT *
		FROM Faculty FOR JSON AUTO
END
GO
 
DECLARE @JsonValue NVARCHAR(MAX) 
SET @JsonValue = '[
                    {
                    "F_ID":1,
                    "F_Name":"Vinod"
                    },
                    {
                    "F_ID":2,
                    "F_Name":"Amit"
                    },
                    {
                    "F_ID":3,
                    "F_Name":"Sagar"
                    },
                    {
                    "F_ID":4,
                    "F_Name":"Niraj"
                    }
                ]'
 
EXEC uspJsonData @JsonValue
 
DROP PROCEDURE uspJsonData

