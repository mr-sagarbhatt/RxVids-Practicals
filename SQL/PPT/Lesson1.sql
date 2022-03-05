--Data types: (https://sqlserver-kit.org/en/home/data-types)

--MAX Size: Float=53, Numeric,Decimal=38
DECLARE @Numeric NUMERIC(38,38) = 0.11111111111111111111111111
SELECT @Numeric
DECLARE @Decimal DECIMAL(38,38) = 0.11111111111111111111111111
SELECT @DECIMAL
--Takes Integer Only
DECLARE @Numeric2 NUMERIC(38) = 0.11111111111111111111111111
SELECT @Numeric2
DECLARE @Decimal2 DECIMAL(38) = 0.11111111111111111111111111
SELECT @DECIMAL2

DECLARE @Float FLOAT(53) = 0.11111111111111111111111111
SELECT @Float

--Data type Coversions:
	--Implicit: (Occurs without using functions)
	--Explicit: (Required to use functions like CAST, CONVERT or PARSE)

--(https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15)

--These functions convert an expression of one data type to another.
--CAST ( expression AS data_type [ ( length ) ] )    
--CONVERT ( data_type [ ( length ) ] , expression [ , style ] )
--PARSE ( string_value AS data_type [ USING culture ] )

DECLARE @Date DATETIME = GETDATE()
SELECT CAST(@Date AS NVARCHAR(10))
SELECT CAST(@Date AS NVARCHAR(20))

SELECT CONVERT(NVARCHAR(50), @Date, 5)
SELECT CONVERT(NVARCHAR(50), @Date, 105)
SELECT CONVERT(NVARCHAR(50), @Date, 108)
SELECT CONVERT(NVARCHAR(50), @Date, 131)

SELECT PARSE('11/02/1198' AS DATE USING 'en-US')
SELECT PARSE('11/02/1198' AS DATETIME USING 'en-US') --Raise an Error
SELECT TRY_PARSE('11/02/1198' AS DATETIME USING 'en-US') --Returs NULL instead of Error
SELECT PARSE('11/02/1198' AS DATETIME2 USING 'en-US')
-- The English language is mapped to en-US specific culture  
SET LANGUAGE 'English'
SELECT PARSE('12/16/2010' AS datetime2) AS Result

--Returns a value cast to the specified data type if the cast succeeds; otherwise, returns null.
--TRY_CAST ( expression AS data_type [ ( length ) ] )
--TRY_CONVERT ( data_type [ ( length ) ], expression [, style ] )
--TRY_PARSE ( string_value AS data_type [ USING culture ] )

SELECT   
    CASE WHEN TRY_CAST('test' AS float) IS NULL   
    THEN 'Cast failed'  
    ELSE 'Cast succeeded'  
END AS Result;  
GO

SET DATEFORMAT dmy;  
--SET DATEFORMAT mdy;  
SELECT CAST('12/31/2010' AS DATETIME2) AS Result --Raise an Error
SELECT TRY_CAST('12/31/2010' AS DATETIME2) AS Result --Returs NULL instead of Error
GO

SELECT   
    CASE WHEN TRY_CONVERT(float, 'test') IS NULL   
    THEN 'Cast failed'  
    ELSE 'Cast succeeded'  
END AS Result;  
GO
