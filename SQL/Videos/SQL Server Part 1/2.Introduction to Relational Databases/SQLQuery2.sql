--2.Introduction to Relational Databases

--2-Database Concepts
	--Databases: A collection of objects (like tables, triggers, store procedures)
	--Database Objects
		--Tables: Store Data, Core component to all databases
		--And the Other objects work with table data and all are reusable
			--Views: Virtual Tables, Simplify Structure, Can only read the data
			--Stored Procedures: Commands that can be executed- It can make Changes to data as well as Return Data (pre-compiled objects) EX. sp_rename, sp_help
			--Functions: Commands that can be executed- Return Data (A function is compiled and executed every time whenever it is called.)
				--https://www.dotnettricks.com/learn/sqlserver/difference-between-stored-procedure-and-function-in-sql-server

--3-Table Concepts
	--Fields: Individual value in particular row and column
	--Constraints: Ensure valid values
	--Triggers: Execute code in response to modification
	--Primary Key: Designed to uniquely identify each row
	--Foreign Key: Used to create relationships between two tables, Refers to the column poting to the primary key column in the other table
	--Table Relationships: Divide data into multiple tables, Faster updates, More flexible reporting and queries
		--One to one: One row refers to one row
		--One to many: One row refers to many rows
		--Many to many: Many rows refers to many rows

--6
	--Normalization Rules:
		--Don't duplicate column data
			--First Normal Form: Table has no repeating groups
		--Don't duplicate row data
			--Second Normal Form: No non-prime atttribute is dependent on a subset of any key, Or if column could uniquely identify an item, don't duplicated it 
		--Don't store calculated field
			--Third Normal Form: Every value must only depend on the key
		--Ensure data will remain consistent if changes occur

--7-Working with data
	--SELECT, INSERT, UPDATE, DELETE
	--SQL statements can update sets of rows, It reffered to as result set
	--SQL can update individul rows done through cursors (Not preferred)

	--Variables: Store temporary data
		--Created using DECLARE Statement
		--Name: All variables start with an @ sign, System variables start with @@
		--Data type: What type of information will be stored, EX. INT, VARCHAR
		--Value: Information being stored, It can be NULL

		--Syntax:
			--DECLARE @<name> <DataType>
			--SET @<name> = <Value>
			--PRINT @<name> or SELECT @<name>

