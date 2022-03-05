USE Sagar1
SELECT *
FROM dbo.Products

ALTER TABLE dbo.Products
	ADD CONSTRAINT UQ_Products_PD UNIQUE (Price)

--Returns INDEX informations
EXEC sys.sp_helpindex @objname = N'dbo.Products'

--Create indexes: CLUSTERED, NONCLUSTERED [, UNIQUE]
CREATE UNIQUE INDEX IX_Products_ProductName
ON dbo.Products(ProductName)

--DROP Indexes
DROP INDEX IX_Products_ProductName
ON dbo.Products

--DISABLE Index on dbo.Products
ALTER INDEX IX_Products_ProductName ON dbo.Products
DISABLE
-- Disables all indexes on dbo.Products
ALTER INDEX ALL ON dbo.Products
DISABLE;

--ENABLE Index on dbo.Products
ALTER INDEX IX_Products_ProductName ON dbo.Products
REBUILD
--ENABLE all indexes on dbo.Products
ALTER INDEX ALL ON dbo.Products
REBUILD
