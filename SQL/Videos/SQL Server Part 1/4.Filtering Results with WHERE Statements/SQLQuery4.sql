--4.Filtering Results with WHERE Statements

--1-WHERE Statements
	--Syntax: WHERE <conditions>
	--Used to filter or limit rows
	--Creating Predicates: (expression that evaluates to TRUE, FALSE, or UNKNOWN)
		--<column> <operator> <value>
		--Predicates is an expression that evaluates to TRUE, FALSE, or UNKNOWN. Predicates are used in the search condition of WHERE clauses and 
		--HAVING clauses, the join conditions of FROM clauses, and other constructs where a Boolean value is required.
		--EX: CONTAINS, FREETEXT, IS [NOT] NULL
		--operators: =, <>, <, >, <=, >=

	SELECT FirstName
		, LastName				--Executed 3
	FROM Person.Person			--Executed 1
	WHERE LastName = 'Abel'		--Executed 2: So we can not use alias in WHERE statement

--2-Pradicate Keywords
	--Between: Inclusive Range
		--Syntax: <column> BETWEEN <value> and <value>
		SELECT ProductID
			, ListPrice
		FROM Production.ProductListPriceHistory
		WHERE ListPrice BETWEEN 10 and 25
	--[NOT] IN: Value contained in list of values	
		--Syntax: <column> IN (values), <column> NOT IN (values)  
	--ALL, ANY or SOME, [NOT] Exists: Mostly used in sub queries

	--Combining Predicated:
		--AND: Both side must match
		--OR: Either side can match
		SELECT ProductID
			, ListPrice
		FROM Production.ProductListPriceHistory
		WHERE (ListPrice >= 10
			AND ListPrice <= 20)

--3-Quering Strings with LIKE
	--Syntax: <column> LIKE <expression>
	--LIKE allows wild card characters:
		--%: Zero or more characters
		--_: One character
		--[]: Used for a range
			--[ad]: Will find only a or d
			--[a-d]: Will find a, b, c, or d
		--^: Any character except what is in the range
		SELECT *
		FROM Production.Product
		WHERE Name LIKE 'Mou%'
		--Avoid to use wildcard characters at begining and Provide many letters as possible for searching: For better performance
		
		--Escape character to search for special character:
			--ProductCode LIKE '\[pc-%\]' ESCAPE '\' : will search for [pc-%]
			--We can define our own escape character by using ESCAPE keyword after LIKE clause
		
		--Handling Null data
			--Predicates is an expression that evaluates to TRUE, FALSE, or UNKNOWN.
				--Only rows test true are returned
				--Any operation involving null evalutes to "unknown"
		SELECT FirstName
			, MiddleName
			, LastName
		FROM Person.Person
		WHERE (MiddleName = NULL 
			OR NOT (MiddleName = NULL)) --Both predicates return Unknown

--4-Filtering NULL data
	--NULL operators: IS NULL, IS NOT NULL
		SELECT FirstName
			, MiddleName
			, LastName
		FROM Person.Person
		WHERE (MiddleName IS NULL 
			OR MiddleName IS NOT NULL)


