--(https://docs.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver15)
--The following scalar functions perform an operation on a string input value and return a string or numeric value:

--ASCII( character_expression ): Returns the ASCII code value of the leftmost character of a character expression.
SELECT ASCII('A') AS [A], ASCII('a') AS [a]
--UNICODE ( 'ncharacter_expression' ): Returns the integer value, as defined by the Unicode standard, for the first character of the input expression.
SELECT UNICODE('A') AS 'UNICODE(A)'

--CHAR( integer_expression ): Returns the single-byte character with the specified integer code
SELECT CHAR(78) AS 'CHAR(78)', CHAR(188) AS 'CHAR(188)'
--NCHAR ( integer_expression ): Returns the Unicode character with the specified integer code, as defined by the Unicode standard.
SELECT NCHAR(78) AS 'NCHAR(78)'

--CHARINDEX( expressionToFind , expressionToSearch [ , start_location ] ): This function searches for one character expression inside a second character expression, returning the starting position of the first expression if found.
DECLARE @str1 VARCHAR(50)
SELECT @str1 = 'Learning SQL Server String Function'
SELECT CHARINDEX('s', @str1) AS 'CHARINDEX', CHARINDEX('s', @str1, CHARINDEX('s', @str1) + 1)
SELECT CHARINDEX('S', @str1 COLLATE Latin1_General_CS_AS) AS 'CASE SENSITIVE'
SELECT CHARINDEX('S', @str1 COLLATE Latin1_General_CI_AS) AS 'CASE INSENSITIVE'

--PATINDEX ( '%pattern%' , expression ): Returns the starting position of the first occurrence of a pattern in a specified expression, or zeros if the pattern is not found, on all valid text and character data types.
SELECT PATINDEX('%sagar%', 'Bhatt Sagar')
SELECT PATINDEX('%__gar%', 'Bhatt Sagar')
DECLARE @search VARCHAR(10) = 'Bhatt'
SELECT PATINDEX('%' + @search + '%', 'Sagar Bhatt')

--CONCAT( string_value1, string_value2 [, string_valueN ] ): This function returns a string resulting from the concatenation, or joining, of two or more string values in an end-to-end manner.
SELECT CONCAT('SAGAR ', 'BHATT')

--CONCAT_WS( separator, argument1, argument2 [, argumentN]... ): CONCAT_WS indicates concatenate with separator.
SELECT CONCAT_WS(' - ', 'DATE', GETDATE())

--DIFFERENCE ( character_expression , character_expression ): This function returns an integer value measuring the difference between the SOUNDEX() values of two different character expressions.
SELECT DIFFERENCE('Sagar', 'Bhatt') AS 'DIFFERENCE'

--FORMAT( value, format [, culture ] ): Returns a value formatted with the specified format and optional culture. Use the FORMAT function for locale-aware formatting of date/time and number values as strings. For general data type conversions, use CAST or CONVERT.
DECLARE @date DATE = GETDATE()
SELECT @date, FORMAT(@date, 'dd/MMM/yyyy'), FORMAT(@date, 'dd-MM-yyyy', 'en-US')
SELECT FORMAT(7600608432, '+91 ##########') AS 'Custom Number'

--LEFT ( character_expression , integer_expression ): Returns the left part of a character string with the specified number of characters.
SELECT LEFT('Sagar Bhatt', 4)

--LEN ( string_expression ): Returns the number of characters of the specified string expression, excluding trailing spaces.
SELECT LEN('Sagar Bhatt')
SELECT DATALENGTH('Sagar Bhatt')
--Use the LEN to return the number of characters encoded into a given string expression, and DATALENGTH to return the size in bytes for a given string expression. These outputs may differ depending on the data type and type of encoding used in the column.

--LOWER ( character_expression ): Convert string to lowecase
SELECT LOWER('SAGAR')

--LTRIM ( character_expression ): Returns a character expression after it removes leading blanks.
SELECT LTRIM('        SAGAR')

--QUOTENAME ( 'character_string' [ , 'quote_character' ] )
SELECT QUOTENAME('sagar bhattt')
SELECT QUOTENAME('sagar bhattt', '()')

--REPLACE ( string_expression , string_pattern , string_replacement )
SELECT REPLACE('Sagar Bhatt', 'Sagar', 'Harsh')

--REPLICATE ( string_expression , integer_expression ): Repeats a string value a specified number of times.
SELECT REPLICATE('1 ', 10)

--REVERSE ( string_expression )
SELECT REVERSE('sagar')

--RIGHT ( character_expression , integer_expression ): Returns the right part of a character string with the specified number of characters.
SELECT RIGHT('Sagar Bhatt', 5)

--RTRIM ( character_expression ): Returns a character string after truncating all trailing spaces.
SELECT RTRIM('sagar     ')

--SOUNDEX ( character_expression ): Returns a four-character (SOUNDEX) code to evaluate the similarity of two strings.
SELECT SOUNDEX('sagar'), SOUNDEX('SEGER')

--SPACE ( integer_expression ): Returns a string of repeated spaces.
SELECT 'Sagar' + SPACE(5) + 'Bhatt'

--STR ( float_expression [ , length [ , decimal ] ] ): Convert to string format
SELECT STR(123.123000000, 10, 3)

--STRING_ESCAPE( text , type )
SELECT STRING_ESCAPE('
', 'json')

--STUFF ( character_expression , start , length , replaceWith_expression ): The STUFF function inserts a string into another string. It deletes a specified length of characters in the first string at the start position and then inserts the second string into the first string at the start position.
SELECT STUFF('Sagar Bhatt', 1, 5, 'Harsh')

--SUBSTRING ( expression ,start , length )
SELECT SUBSTRING('Sagar Bhatt', 7, 5)

--TRANSLATE ( inputString, characters, translations):
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');
SELECT TRANSLATE('Sagar Bhatt', 'SB', 'sb')

--TRIM ( string ): Removes space from both sides
SELECT TRIM('	Sagar	')

--UPPER ( character_expression )
SELECT UPPER('sagar')

--STRING_AGG ( expression, separator ): Concatenates the values of string expressions and places separator values between them. The separator is not added at the end of string.
SELECT STRING_AGG(FirstName, ','), COUNT(*)
FROM Person.Person
GROUP BY FirstName
