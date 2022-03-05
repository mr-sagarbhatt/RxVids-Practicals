--(https://docs.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver15)
--SQL Server supports the following date and time types.

--ISDATE ( expression ): Returns 1 if the expression is a valid date, time, or datetime value; otherwise, 0.ISDATE returns 0 if the expression is a datetime2 value.
IF ISDATE('2009-05-12 10:19:41.177') = 1  
    PRINT 'VALID'  
ELSE  
    PRINT 'INVALID';

--DATEPART ( datepart , date ): This function returns an integer representing the specified datepart of the specified date.
SELECT DATEPART(dd, GETDATE())

--DATENAME ( datepart , date ): This function returns a character string representing the specified datepart of the specified date.
SELECT DATENAME(dd, GETDATE())

--DATEADD (datepart , number , date ): This function adds a specified number value (as a signed integer) to a specified datepart of an input date value, and then returns that modified value.
SELECT GETDATE()
SELECT CURRENT_TIMESTAMP
SELECT DATEADD(dd, 7, GETDATE())
SELECT DATEADD(MM, 7, GETDATE())
SELECT DATEADD(yyyy, 7, GETDATE())

--DATEDIFF ( datepart , startdate , enddate ): This function returns the count (as a signed integer value) of the specified datepart boundaries crossed between the specified startdate and enddate.
SELECT DATEDIFF(dd, CURRENT_TIMESTAMP, DATEADD(dd, 7, GETDATE()))
SELECT DATEDIFF(dd, CURRENT_TIMESTAMP, DATEADD(MM, 7, GETDATE()))
SELECT DATEDIFF(dd, CURRENT_TIMESTAMP, DATEADD(yyyy, 7, GETDATE()))

--DATEFROMPARTS ( year, month, day )
SELECT DATEFROMPARTS(1998, 02, 11)

--Return type: INT
SELECT DAY(GETDATE())
SELECT MONTH(GETDATE())
SELECT YEAR(GETDATE())

--EOMONTH ( start_date [, month_to_add ] ): This function returns the last day of the month containing a specified date, with an optional offset.
--Return type: DATE
SELECT EOMONTH(GETDATE())
SELECT EOMONTH(GETDATE(), -1) --Previous Month
SELECT EOMONTH(GETDATE(), 0) --Current Month --Defult
SELECT EOMONTH(GETDATE(), 1) --Next Month
SELECT EOMONTH(GETDATE(), 2)
