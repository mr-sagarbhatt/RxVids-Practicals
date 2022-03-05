--7.Aggregating Data

--2-Using Aggrigate Functions
	--Used to perforrm calculations on data
	--AVG(), COUNT(), MIN(), MAX(), SUM()
	
	--Aggregate Rules:
		--NULL values are ignored
		--Either Every single column on select line must be in aggregate
		--Or columns on select line which are not in aggregate we have to place them in GROUP BY

		--Common Aggregate functions:
			--SUM(column)
			--COUNT(column): Does not count null values for provided column
			--COUNT(*): Counts all rows     --COUNT(*), COUNT(1) or COUNT(PRIMARY KEY Column): Gives same result
			--MAX(column)
			--MIN(column)
			--AVG(column)

			SELECT COUNT(*) 'TotalPersons'
				, COUNT(MiddleName) 'PersonWithMiddleName'
			FROM Person.Person

--3-Using GROUP BY
	--Used to create groups
	--GROUP BY statement is required for all columns not in aggregate
	SELECT SUM(soh.TotalDue) 'SalesAmount'
		, st.Name 'SalesTerritory'
		, st.[Group] 'TerritoryGroup'
	FROM Sales.SalesOrderHeader soh
		INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
	GROUP BY st.Name
		, st.[Group]

--4-Using HAVING
	--Having filters groups
	--Used to find results that meet criteria
	SELECT SUM(soh.TotalDue) 'SalesAmount'
		, st.Name 'SalesTerritory'
	FROM Sales.SalesOrderHeader soh
		INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
	GROUP BY st.Name
	HAVING SUM(soh.TotalDue) > 20000000

--5-HAVING vs WHERE
	--WHERE filters rows
	--HAVING filters groups, HAVING can use aggregate functions
	SELECT SUM(soh.TotalDue) 'SalesAmount'
		, st.Name 'SalesTerritory'
	FROM Sales.SalesOrderHeader soh
		INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
	WHERE st.Name IN ('Southwest', 'Southeast', 'Northeast', 'Northwest')
	GROUP BY st.Name
	HAVING SUM(soh.TotalDue) > 10000000

--5-Data Rollups
	--ROLLUP provides totals using order of GROUP BY
	--2 ways: GROUP BY ROLLUP(columns) or WITH ROLLUP after GROUP BY statement
	--Provided GROUP BY Category, SubCategory, Product
	--Totals Provide automatically(we can't change it):													--Important
		--Category, SubCategory, Product
		--Category, SubCategory
		--Category
	CREATE VIEW Sales.vSalesByCategory
	AS
	SELECT soh.TotalDue
		, pc.Name 'Category'
		, ps.Name 'SubCategory'
		, p.Name 'Product'
	FROM Sales.SalesOrderHeader soh
		INNER JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderDetailID
		INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
		INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
		INNER JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID

	SELECT Category
		, SubCategory
		, Product
		, SUM(TotalDue) 'TotalSold'
	FROM Sales.vSalesByCategory
	--WHERE Category = 'Clothing'
	GROUP BY ROLLUP (Category
		, SubCategory
		, Product)
	--OR 
	--WITH ROLLUP 
	ORDER BY Category
		, SubCategory
		, Product

	--CUBE: PRovide totals for all combinations of columns on GROUP BY
		--Sometime gives duplicate data
		--2 ways: GROUP BY CUBE(columns) or WITH CUBE after GROUP BY statement
		--Provided GROUP BY Category, SubCategory, Product
		--Totals Provide automatically(we can't change it):													--Important
			--Category, SubCategory, Product
			--Category, SubCategory
			--Category, Product
			--SubCategory, Product
			--Category
			--SubCategory
			--Product

		SELECT Category
			, SubCategory
			, Product
			, SUM(TotalDue) 'TotalSold'
		FROM Sales.vSalesByCategory
		WHERE Category = 'Clothing'
		GROUP BY Category
			, SubCategory
			, Product
		WITH CUBE 
		ORDER BY Category
			, SubCategory
			, Product

--7-GROUPING SETS
	--ROLLUP and CUBE doesn't allowed control over totals
	--GROUPING SETS provides control over totals
	--Provided GROUP BY Category, SubCategory, Product
	--Desired totals(we can change it):													--Important
			--Category, SubCategory
			--SubCategory
			--Product
		SELECT Category
			, SubCategory
			, Product
			, SUM(TotalDue) 'TotalSold'
		FROM Sales.vSalesByCategory
		WHERE Category = 'Clothing'
		GROUP BY GROUPING SETS((Category, SubCategory)
							, (SubCategory)
							, (Product))
		ORDER BY Category
			, SubCategory
			, Product

--ROLLUP, CUBE, and GROUPING SETS adds NULL value inside columns, so to deal with NULL values				--Important
--we can use GROUPING and GROUPING_ID

--8-GROUPING(single column) and GROUPING_ID(multiple columns)
	--GROUPING identifies a column/row being used for a total (add a new column with flag 1 (indicates total) or 0 (indicates individual value))
		--Returns 1 whenever that colum/row is a total
		SELECT Category
			, GROUPING(Category)
			, SubCategory
			, GROUPING(SubCategory)
			, Product
			, GROUPING(Product)
			, SUM(TotalDue) 'TotalSold'
		FROM Sales.vSalesByCategory
		WHERE Category = 'Clothing'
		GROUP BY Category
			, SubCategory
			, Product
		WITH CUBE 
		ORDER BY Category
			, SubCategory
			, Product

	--GROUPING_ID accepts column parameters
		--Uses a bitmap to identify which columns are being used for total
			--FROM the right(right column form GROUPING_ID):						--Important
				--1 for the first column
				--2 for the second
				--4 for the third etc
		SELECT GROUPING_ID(Category, SubCategory, Product) 'TotalBitmap'
			, Category
			, SubCategory
			, Product
			, SUM(TotalDue) 'TotalSold'
		FROM Sales.vSalesByCategory
		WHERE Category = 'Clothing'
		GROUP BY Category
			, SubCategory
			, Product
		WITH CUBE 
		ORDER BY Category
			, SubCategory
			, Product
		

