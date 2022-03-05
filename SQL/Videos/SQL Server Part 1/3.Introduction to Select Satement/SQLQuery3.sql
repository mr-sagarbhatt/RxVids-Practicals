--3.Introduction to Select Satement

--1
--Basic Information: PROCESSID(SPID)\SERVERNAME.database_name(PROCESSID\USERNAME)
--Comments:
	--Single Line Comment: --
	/*
		Multiline Comment
	*/
--Database:
	--CREATE DATABASE <database_name>
	--USE <database_name>
	--DROP <database_name>

--2-Referencing Objects:
	--Each object has four parts to its name:
		--1.Server: Default to the current server if not specify
		--2.Database: Default to current database if not specify
		--3.Schema: Defaults to configuration schema or dbo if not specify, Best practice is to always specify the name of the schema		--Best Practice
			--(Schema is like folder, Structure Objects, set permissions, reuse name)
		--4.Object Name
	--Keywords and special characters in object name:
		--Starts with letters or underscore and contains only letters, numbers or underscore (Valid Characters)
		--For invalid characters:
			--[] (Square brackets)																											--Best Practice
			--"" (Double quotes): It must be enabled on server (Quoted identifiers)
	--Case Sensitivity:
		--TSQL keywords are not case sensitive (Convention: to put keywords in all capital letters)											--Best Practice
		--String Comparision may be case sensitive

--3-Structure of SELECT statement
/*
	SELECT <columns>
	FROM <tables>
	WHERE <conditions>
	GROUP BY <columns>
	HAVING <conditions>
	ORDER BY <columns>
*/

--4-Using SELECT Statement
	--SELECT choose Columns
	--Columns separated by commas
		--Convenstion: List columns on separate lines, Be consistent																		--Best Practice
		--Can use * for all columns																											--Bad Practice

	SELECT ContactTypeID
		, Name
		, ModifiedDate
	FROM [Person].[ContactType]

--5-Column Aliases
	--Change Name of Columns: External application may need different names, Certain operations remove column name
		--<column> AS <alias>

	SELECT ContactTypeID 'ID'
		, Name
		, ModifiedDate
	FROM [Person].[ContactType]

	--Performing Calculations:
		--Math Operators: +(Also performs string concatenation), -, /, *, %

	SELECT FirstName + ' ' + LastName 'FullName'
	FROM [Person].[Person]



