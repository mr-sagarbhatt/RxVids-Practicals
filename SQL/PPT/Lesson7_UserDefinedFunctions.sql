USE AdventureWorks2019
GO
--User Defined Functions

--Scalar Functions
SELECT OBJECT_ID(N'dbo.ufnMonthlySalary', N'FN') --Returns Function ID If Exists or NULL if not exists
GO

CREATE FUNCTION ufnMonthlySalary (@PayRate FLOAT)
RETURNS FLOAT
AS
BEGIN
	RETURN (@PayRate * 8 * 30)
END
GO

PRINT dbo.ufnMonthlySalary(20)
GO

--Table-Valued Functions
CREATE FUNCTION Person.ufnGetPersonDetails (@Id INT)
RETURNS TABLE
AS
RETURN (
	SELECT *
	FROM Person.Person
	WHERE BusinessEntityID = @Id
)
GO

SELECT * FROM Person.ufnGetPersonDetails(100)
GO
