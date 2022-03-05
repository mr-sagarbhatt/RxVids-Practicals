--6.Executing Subqueries and UNION Statements

--1-Subquery
	--A query within query
	--Uses: Breakdown complex logic, Simplify reading
		--"Sneak in" operations otherwise not allowed: Place an aggregate function on a where clause
	--Can often be replaced by a join:
		--Join may perform faster because SQL Server will frequently rewrite subqueries as joins
		--Most readable query is frequently best

--2-Using Subqueries
	--We can place subqueries in three parts: SELECT, FROM and WHERE
	--SELECT Line:
		--Access infromation from tables in SELECT line
		--Query must return a single(scalar) value

		--Q:Show the difference between the product price and average product price
		SELECT Name
			, ListPrice - (SELECT AVG(ListPrice) FROM Production.Product) AS 'DifferenceFromAverage'
		FROM Production.Product

	--FROM Line:
		--Create a "Dynamic" Table
		--Useful for breaking down queries
		--Query must be aliased

		--Q:Show list price compared to the average for that subcategory
		SELECT p.Name
			, p.ListPrice - ap.AverageListPrice AS 'DifferenceFromAverage'
		FROM Production.Product p
		INNER JOIN (SELECT ProductSubcategoryID
						, AVG(ListPrice) AS 'AverageListPrice'
					FROM Production.Product
					GROUP BY ProductSubcategoryID) ap
			ON p.ProductSubcategoryID = ap.ProductSubcategoryID

	--WHERE Line:
		--Useful for comparing values from other table

--3-Predicates used with subqueries
	--IN: Confirm column value exists in subquery, Similar to an inner join
		SELECT *
		FROM HumanResources.Employee e
		WHERE e.BusinessEntityID IN 
			(SELECT edh.BusinessEntityID 
			FROM HumanResources.EmployeeDepartmentHistory edh
			WHERE edh.DepartmentID = 1)
	
	--EXISTS: Returns true if subquery returns values, Frequently used with corelated queries
		SELECT *
		FROM HumanResources.Employee e
		WHERE EXISTS 
			(SELECT edh.BusinessEntityID 
			FROM HumanResources.EmployeeDepartmentHistory edh
			WHERE edh.BusinessEntityID = E.BusinessEntityID 
			AND edh.DepartmentID = 1)

	--ALL: Compares column value to all items returned by subquery, subquery must return only one column
	
	--ANY or SOME: Compares column value to sny item returned by subquery, subquery must return only one column, ANY and Some are identical(equal)

	--Correlated Subqueries: Pass column from main(outer) into subquery, Used to simulate a join

--4-UNION Statements
	--Unions are essentially two queries stacked on one another

--5-UNION Requirements:
	--Each query must contain the same no of columns
	--Data types must be compatible
	--First query sets column names of result set
	--If using ORDER BY there can only be one at the end
	--By default UNION queries are DISTINCT
	--Use UNION ALL to return all rows with duplicate values
	SELECT FirstName + ' ' + LastName 'FullName'
	FROM Person.Person
	UNION --By default this is DISTINCT
	SELECT ReviewerName
	FROM Production.ProductReview
	ORDER BY FullName

	SELECT FirstName + ' ' + LastName 'FullName'
	FROM Person.Person
	UNION ALL
	SELECT ReviewerName
	FROM Production.ProductReview
	ORDER BY FullName

