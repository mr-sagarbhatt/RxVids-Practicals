--8-Advanced Data Aggregations

--1-Common Table Expressions(CTEs)
	--Inline View or temporary table
	--Uses: Breakdown complex queries, 
		--Avoid subqueries, 
		--Simplify certain syntax

	--Syntax: WITH <cte_name> [(columns)]  
	--		AS(
	--			<SELECT statement>
	--		)
	--CTE can be used as a table(can perform select, insert, update, delete)

	WITH SalesData (TotalSold, OrderYear, TerritoryName) --If columns are not listed then it will take all columns from select statement.
	AS (
		SELECT SUM(soh.TotalDue) 'TotalSold'
			, YEAR(soh.OrderDate) 'OrderYear'
			, st.Name 'TerritoryName'
		FROM Sales.SalesOrderHeader soh
			INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
		GROUP BY YEAR(soh.OrderDate)
			, st.Name
	)
	SELECT *
	FROM SalesData

WITH CTE_Practice
AS
(
SELECT *
FROM Sales.Currency
)
--SELECT *
--FROM CTE_Practice
--INSERT INTO CTE_Practice
--	VALUES('RUP', 'I Rupee', '2008-04-30 00:00:00.000')
UPDATE CTE_Practice
SET Name = 'Indian Rupees' 
WHERE CurrencyCode = 'RUP'

--2-PIVOT and UNPIVOT
	--PIVOT:
		--Convert row data into columns
		--PYVOT Syntax:
			--SELECT <NonPivot>
				--, <FirstPivotedColumn>
				--, ...
			--FROM <table>
				--PIVOT (FUNCTION(<data column>)
					--FOR <List of pivoted columns>)
						--AS <alias>
		WITH SalesData (TotalSold, OrderYear, TerritoryName)
		AS (
			SELECT SUM(soh.TotalDue) 'TotalSold'
				, YEAR(soh.OrderDate) 'OrderYear'
				, st.Name 'TerritoryName'
			FROM Sales.SalesOrderHeader soh
				INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
			GROUP BY YEAR(soh.OrderDate)
				, st.Name
		)
		SELECT *
		FROM SalesData
			PIVOT (SUM(TotalSold)
				FOR OrderYear IN ([2011], [2012], [2013], [2014])) AS Pvt

	--UNPIVOT:	
		--Convert columns back to row data
		--Does not perform a full reverse of a pivot statement
		--UNPIVOT Syntax:
			--SELECT <Columns>
			--FROM <PivotedTable>
				--UNPIVOT (<AggregatedColumn>
					--FOR <NewColumn>
						--IN (<ColumnList>)) AS <alias>

	--EXCEPT and INTERSECT:
		--Behaves like a UNION statement:
			--Same number of columns
			--Data types must be compatible
		--INTERSECT returns rows from top query that match bottom query
		--EXCEPT retuns rows from top  query that don't match bottom query

	--INTERSECT:
	WITH PersonsWhichEmployee
	AS (
		SELECT BusinessEntityID
		FROM Person.Person
		INTERSECT
		SELECT BusinessEntityID
		FROM HumanResources.Employee
	)
	SELECT p.BusinessEntityID
		, p.FirstName
		, p.LastName
	FROM Person.Person p
		INNER JOIN PersonsWhichEmployee pwe ON p.BusinessEntityID = pwe.BusinessEntityID
	
	--EXCEPT:
	WITH PersonsWhichNotEmployee
	AS (
		SELECT BusinessEntityID
		FROM Person.Person
		EXCEPT
		SELECT BusinessEntityID
		FROM HumanResources.Employee
	)
	SELECT p.BusinessEntityID
		, p.FirstName
		, p.LastName
	FROM Person.Person p
		INNER JOIN PersonsWhichNotEmployee pwne ON p.BusinessEntityID = pwne.BusinessEntityID

--3-Sorting Data
	--ORDER BY: (ASC or DESC) - Default order ASC
		--ORDER BY controls which columns will be used to sort
		--Can sort by multiple columns(Uses columns in order)
		--ORDER BY executes last in a SELECT statement
			--Can use column alias												--Best Practice
			--Can also use column number(But never use this syntax)				--Bad Practice
	SELECT BusinessEntityID
		, FirstName
		, LastName
	FROM Person.Person
	ORDER BY FirstName ASC
		, LastName DESC

--4-TOP
	--Used to limit number of rows return
	--Can specify number of rows or percent
	--TOP is typically used with ORDER BY

	SELECT TOP 10 BusinessEntityID
		, FirstName
		, LastName
	FROM Person.Person
	ORDER BY FirstName ASC
		, LastName DESC

	SELECT TOP 10 BusinessEntityID
		, FirstName
		, LastName
	FROM Person.Person
	ORDER BY FirstName ASC
		, LastName DESC

--5-Ranking Functions
	--ROW_NUMBER(): 
		--Returns the row number
	--RANK(): 
		--Returns ranking based on ORDER BY statement, 
		--Ties skip to the next number
	--DENSE_RANK():
		--Returns ranking based on ORDER BY statement, 
		--Ties don't advanced the rank number
	--NTILE(X):
		--Breaks rows into equal sections
		--x is the number of sections

	SELECT Name
		, ListPrice
		, ROW_NUMBER() OVER (ORDER BY ListPrice DESC) 'RowNumber'
		, RANK() OVER (ORDER BY ListPrice DESC) 'Rank'
		, DENSE_RANK() OVER (ORDER BY ListPrice DESC) 'DenseRank'
		, NTILE(5) OVER (ORDER BY ListPrice DESC) 'DenseRank'
	FROM Production.Product
	WHERE ProductSubcategoryID = 1
	ORDER BY ListPrice DESC

--6-Paging
	--Used to retrive portions of data
	--FETCH and OFFSET:
		--FETCH indicates the number of rows to retrive
		--OFFSET indicates the number of rows to skip
	--Restrictions:
		--ORDER BY is required
		--TOP is not allowed
	--Syntx:
		--SELECT <columns>
		--FROM <tables>
		--ORDER BY <columns>
			--OFFSET x ROWS
			--FETCH NEXT x ROWS ONLY
	
	--Pagging by 10, grabbing page 2, 11-20
	SELECT ROW_NUMBER() OVER (ORDER BY Name) 'RowNumber'
		, Name
		, ListPrice
	FROM Production.Product
	ORDER BY Name
		OFFSET 10 ROWS
		FETCH NEXT 10 ROWS ONLY

--7-DISTINCT statement
	--Removes duplicate values
	--The entire row must be duplicate
	--Will cause a sort of the data(Impacts performance)
	SELECT DISTINCT DepartmentID
	FROM HumanResources.EmployeeDepartmentHistory
