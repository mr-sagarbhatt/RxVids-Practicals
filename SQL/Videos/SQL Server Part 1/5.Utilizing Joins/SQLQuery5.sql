--5.Utilizing Joins

--2-JOIN Syntax
	--ANSI Standard Joins																	--preferred method for sql server
		--SELECT <columns>
		--FROM Schema.Table1 AS t1
			--INNER JOIN Schema.Table2 AS t2 ON t1.Column = t2.Column 
			--Here t1.Column = t2.Column is called "seam" which join two tables and match data from those tables

	--WHERE line Joins, SQL will rewrite													--not preferred for sql server
		--SELECT <columns>
		--FROM Schema.Table1 AS t1
			--, Schema.Table2 AS t2 
		--WHERE t1.Column = t2.Column

	--Coding Best Practicies and Conventions:
		--Always alias table names: Schema.Table AS t
		--Always use two part naming for columns: t.columnName
		--Place each join on separate line:
			--FROM Schema.Table1 AS t1
				--INNER JOIN Schema.Table2 AS t2 ON t1.Column = t2.Column
		--Place tables in logical order
		SELECT p.Name
		FROM Production.Product p

--3-Inner Join
	--Only rows that match are returned
	SELECT pc.Name AS 'CategoryName'
		, ps.Name AS 'SubCategoryName'
		, pc.ProductCategoryID AS 'PC-ProductCategoryID'
		, ps.ProductSubcategoryID AS 'PS-ProductSubcategoryID'
	FROM Production.ProductCategory AS pc
		INNER JOIN Production.ProductSubcategory ps ON pc.ProductCategoryID = ps.ProductCategoryID

--4-Outer Joins
	--Rows from tables are returned even if they don't match
	--Types:
		--FULL: Returns rows from both tables even if they don't match join statement
		--LEFT or RIGHT: No difference except in order of tables in FROM clause, Direction points at table to retrieve non-matching rows from
	SELECT pc.Name AS 'CategoryName'
		, ps.Name AS 'SubCategoryName'
		, pc.ProductCategoryID AS 'PC-ProductCategoryID'
		, ps.ProductSubcategoryID AS 'PS-ProductSubcategoryID'
	FROM Production.ProductCategory AS pc
		FULL OUTER JOIN Production.ProductSubcategory ps ON pc.ProductCategoryID = ps.ProductCategoryID

--5-Self Joins
	--Join a table to itself, Tables must be aliased, Need to filter rows matching themselves
	SELECT lhs.BusinessEntityID AS 'lhs.BusinessEntityID'
		, lhs.HireDate
		, rhs.BusinessEntityID AS 'rhs.BusinessEntityID'
	FROM HumanResources.Employee lhs
		INNER JOIN HumanResources.Employee rhs ON lhs.HireDate = rhs.HireDate
												AND lhs.BusinessEntityID < rhs.BusinessEntityID

--6-Cross Join(Cartesian Product)
	--All rows match from each table, No ON statement
	--Used for Generating test data
	SELECT p.Name
		, e.HireDate AS 'ProductionDate'
	FROM Production.Product AS p
		, HumanResources.Employee AS e










                                                                                                                                                                                                                                                                                                                                                                                                                                                                               