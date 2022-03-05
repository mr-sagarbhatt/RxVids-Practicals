USE Day2

SELECT *
FROM Employees

--CURSOR
--The following example creates a SCROLL cursor to allow full scrolling capabilities through the LAST, PRIOR, RELATIVE, and ABSOLUTE options.
DECLARE employees_cursor CURSOR GLOBAL
--[, KEYSET, STATIC, or SCROLL]: All FETCH options are supported, [, FORWARD_ONLY or FAST_FORWARD]: Only NEXT FETCH option are supported,
--[, DYNAMIC SCROLL]: All FETCH options are supported except ABSOLUTE, [, READ_ONLY]: Prevents update or delete made through this cursor. 
SCROLL READ_ONLY FOR 
SELECT *
FROM Employees
OPEN employees_cursor
--FETCH:  --Retrieves a specific row from a Transact-SQL server cursor.
FETCH FIRST FROM employees_cursor
FETCH LAST FROM employees_cursor
FETCH NEXT FROM employees_cursor
FETCH PRIOR FROM employees_cursor
FETCH ABSOLUTE 3 FROM employees_cursor -- Fetch the third row in the cursor.
FETCH ABSOLUTE -3 FROM employees_cursor -- Fetch the last third row in the cursor.
FETCH RELATIVE 3 FROM employees_cursor -- Fetch the row that is three rows afyer the current row.
FETCH RELATIVE -3 FROM employees_cursor -- Fetch the row that is three rows prior to the current row.
CLOSE employees_cursor
DEALLOCATE employees_cursor

--CURSOR Variable
DECLARE Emp_cursor CURSOR
FOR 
SELECT EmployeeID FROM Employees
DECLARE @curemp CURSOR
DECLARE @empid INT
SET @curemp = Emp_cursor
OPEN @curemp
FETCH NEXT FROM @curemp INTO @empid
PRINT @empid
CLOSE @curemp

--CURSOR Example
SET NOCOUNT ON
DECLARE employees_cursor CURSOR
STATIC FOR 
	SELECT EmployeeID
		, FirstName
		, Salary 
	FROM Employees
OPEN employees_cursor
IF @@CURSOR_ROWS > 0
BEGIN
	PRINT @@CURSOR_ROWS
	DECLARE @id INT, @name VARCHAR(30), @salary MONEY
	FETCH NEXT FROM employees_cursor INTO @id, @name, @salary
	WHILE @@FETCH_STATUS = 0
	BEGIN
	PRINT @@FETCH_STATUS
		--PRINT CAST(@id AS VARCHAR) + ' ' + @name + + ' ' + CONVERT(VARCHAR, @salary)
		PRINT CONCAT('ID: ', @id, SPACE(3), 'First Name: ', @name, SPACE(3), 'Salary: ', @salary)
		FETCH NEXT FROM employees_cursor INTO @id, @name, @salary
	END
END
CLOSE employees_cursor

DEALLOCATE employees_cursor
SET NOCOUNT OFF
