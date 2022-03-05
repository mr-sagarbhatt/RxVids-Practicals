USE AdventureWorks2019
GO
SELECT NEWID()

--Exception Handling
--TRY-CATCH
SELECT *
FROM Person.ContactType

BEGIN TRY
	INSERT INTO Person.ContactType
		VALUES(NULL, NULL)
	SELECT *
	FROM Person.ContactType
END TRY
BEGIN CATCH
	SELECT 'There was an error! ' + ERROR_MESSAGE() 'ErrorMessage'
		, ERROR_LINE() 'ErrorLine'
		, ERROR_NUMBER() 'ErrorNumber'
		, ERROR_PROCEDURE() 'ErrorProcedure'
		, ERROR_SEVERITY() 'ErrorSeverity'
		, ERROR_STATE() 'ErrorState'
END CATCH

--RAISE ERROR
--RAISEERROR('Message', Severity, State)

RAISERROR (N'This is message.', -- Message text.  
           10, -- Severity,  
           1 -- State,  
           ) 
-- The message text returned is: This is message number 5.  
GO

RAISERROR (N'This is message %s %d.', -- Message text.  
           10, -- Severity,  
           1, -- State,  
           N'number', -- First argument.  
           5); -- Second argument.  
-- The message text returned is: This is message number 5.  
GO
