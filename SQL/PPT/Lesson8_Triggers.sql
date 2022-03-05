USE AdventureWorks2019
GO
--Triggers
--Types: DML Triggers, DDL Triggers

--DML Triggers (3 Types: INSERT, UPDATE, DELETE)
--Copy HumanResources.Shift structure into HumanResources.ShiftHistory
SELECT *
INTO HumanResources.ShiftHistory
FROM HumanResources.Shift
WHERE 1=0

SELECT *
FROM HumanResources.Shift
SELECT *
FROM HumanResources.ShiftHistory
GO

--Insert Trigger
CREATE TRIGGER HumanResources.trgInsertShift
ON HumanResources.Shift
FOR INSERT
AS
	SELECT *
	FROM inserted
GO

DROP TRIGGER HumanResources.trgInsertShift

INSERT INTO HumanResources.Shift
	VALUES('Noon', '12:00:00.0000000', '15:00:00.0000000', '2008-04-30 00:00:00.000')
GO

--Update Trigger (Data inserted in both magic tables(inserted, deleted))
CREATE TRIGGER HumanResources.trgUpdateShift
ON HumanResources.Shift
FOR Update
AS
	SELECT *
	FROM inserted
	SELECT *
	FROM deleted
	INSERT INTO HumanResources.ShiftHistory
	SELECT *
	FROM deleted
GO

DROP TRIGGER HumanResources.trgUpdateShift

Update HumanResources.Shift
SET Name = 'NOON'
WHERE ShiftID = 22
GO

--Delete Trigger
CREATE TRIGGER HumanResources.trgDeleteShift
ON HumanResources.Shift
FOR DELETE
AS
	INSERT INTO HumanResources.ShiftHistory
	SELECT *
	FROM deleted
GO

DROP TRIGGER HumanResources.trgDeleteShift

DELETE 
FROM HumanResources.Shift
WHERE ShiftID = 22
GO

--AFTER TRIGGER
--Fired after record is deleted from Shift table
CREATE TRIGGER HumanResources.trgDeleteShiftMsg
ON HumanResources.Shift
AFTER DELETE
AS
	PRINT 'Deletion Successfull.'
GO

--INSTEAD OF TRIGGER
--Fired instead of delete
CREATE TRIGGER HumanResources.trgDeleteShiftMsg1
ON HumanResources.Shift
INSTEAD OF DELETE
AS
	PRINT 'Records cannot be deleted.'
GO

--DDL Triggers (Differnt DDL Events: DROP_TABLE, ALTER_TABLE, CREATE_TABLE)
--https://docs.microsoft.com/en-us/sql/relational-databases/triggers/ddl-events?view=sql-server-ver15
CREATE TRIGGER trgSafety
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
	PRINT 'You must disable trigger trgSafety to create, alter or drop tables!'
	ROLLBACK
GO

DROP TRIGGER trgSafety ON DATABASE
GO

--DISABLE TRIGGER 
DISABLE TRIGGER trgSafety ON DATABASE
GO
DISABLE TRIGGER HumanResources.trgDeleteShiftMsg1 ON HumanResources.Shift
GO
--ENABLE TRIGGER 
ENABLE TRIGGER trgSafety ON DATABASE
GO
ENABLE TRIGGER HumanResources.trgDeleteShiftMsg1 ON HumanResources.Shift
GO
