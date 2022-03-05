-- (https://docs.microsoft.com/en-us/sql/sql-server/?view=sql-server-ver15)
--These scalar functions return information about current configuration option settings:
SELECT @@SERVERNAME  
SELECT @@SERVERNAME AS 'Server Name'  -->Returns the name of the local server that is running SQL Server.
SELECT @@SERVICENAME AS 'Service Name'  -->Returns the name of the registry key under which SQL Server is running.
SELECT @@VERSION AS 'SQL Server Version'  -->Returns system and build information for the current installation of SQL Server.
SELECT @@SPID AS 'ID', SYSTEM_USER AS 'Login Name', USER AS 'User Name'  -->Returns the session ID of the current user process.

--SQL Server provides the following metadata functions.
SELECT Name, Description FROM fn_helpcollations() -->Returns a list of all supported collations.

--Databases
	SELECT * FROM sys.databases  -->View Databases
	CREATE DATABASE NewDB  -->Create Database: CREATE DATABASE <db_name>
	USE NewDB  -->Use Database: USE <db_name>
	DROP DATABASE NewDB  -->Drop Database: DROP DATABASE <db_name>
	ALTER DATABASE Sagar MODIFY NAME = Sagar1  -->Rename Database: ALTER DATABASE <old_db_name> MODIFY NAME = <new_db_name>

	--Manage Database Properties (We can modify it using ALTER Statement)
	SELECT * FROM sys.databases WHERE name = 'NewDB'  -->To view the properties of a database by querying sys.databases

	sp_spaceused  -->To display data and log space information for a database by using sp_spaceused
	SELECT file_id, name, type_desc, physical_name, size, max_size FROM sys.database_files  -->To display data and log space information for a database by querying sys.database_files

	-->Create a User-Defined Data Type Alias
	CREATE TYPE snumber FROM VARCHAR(11) NOT NULL  --The snumber data type alias is used for columns holding 11-digit social security numbers (999-99-9999). The column cannot be NULL.

--Tables
	--Create Table: CREATE TABLE <table_name> (<column_name> <data_type>)
	Create Table Users (ID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY, Name VARCHAR(30))
		--Insert Data: INSERT INTO <table_name>(<column_names>) VALUES(<column_values>)
		INSERT INTO Users VALUES('Sagar'), ('Harsh')
		--Update Data: Update <table_name> SET <clumn_name> = <column_value> WHERE <condition>
		UPDATE Users SET Name = 'Sagar Bhatt' WHERE ID = 1
		--Select Data: SELECT * FROM <table_name>
		SELECT * FROM Users
		--Delete Data: DELETE FROM <table_name> WHERE <condition>
		DELETE FROM Users WHERE ID = 1
		--Truncate Data: TRUNCATE TABLE <table_name>
		TRUNCATE TABLE Users
	--Drop Table: DROP TABLE <table_name>
	DROP TABLE Users
	--Copy Columns from One Table to Another(Duplicate Table): SELECT * INTO <table_name> FROM <table_name>
	--Copy data from one table to another: INSERT INTO <table_name> SELECT * FROM <table_name>
	--Rename Table: EXEC sp_rename <old_table_name>, <name_table_name>
	EXEC sp_help 'Users' --View Table Definition: sp_help '<table_name>'

	--Alter Table (Change Table Structure)
		--Add Column: ALTER TABLE <table_name> ADD <column_name> <data_type>
		--Delete Column: ALTER TABLE <table_name> DROP COLUMN <column_name>
		--Rename Column: sp_rename '<table_name>.<old_column_name>', '<new_column_name>', 'COLUMN'
			EXEC sp_rename 'Users.UName', 'Name'
			sp_help 'Users'
		--Modify the data type of a column: ALTER TABLE <table_name> ALTER COLUMN <column_name> <data_type>; 




