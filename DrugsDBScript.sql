--Database Definition Language (DDL) CREATE/ALTER/DROP
USE Master
GO
IF DB_ID('DrugsDB') IS NOT NULL
	BEGIN
		ALTER DATABASE DrugsDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE DrugsDB
	END
GO
CREATE DATABASE DrugsDB
GO
USE DrugsDB
GO

DROP TABLE IF EXISTS Drug
CREATE TABLE Drug (
Id INT IDENTITY(1,1),
[Name] NVARCHAR(255),
NickName NVARCHAR(255)
)

-- DML INSERT/UPDATE/DELETE
INSERT INTO Drug ([Name], NickName) VALUES ('Cocaine', 'Coke')
--SELECT NickName, [Name] FROM Drug

--DDL ALTER
--ALTER TABLE table_name
--ADD column_name datatype;
ALTER TABLE Drug ADD WeightInGram DECIMAL(6,2)
GO
--DML
INSERT INTO Drug ([Name], NickName, WeightInGram) VALUES ('Hash', 'Ganja, Weed, Marijuana', 100)

--NO GO INSERT INTO:
--INSERT INTO Drug VALUES ('D1','',1),('D2','',1),('D3','',1),('D4','',1)

--SELECT * FROM Drug WHERE [Name] like 'Co_ain%'
--UPDATE table_name
--SET column1 = value1, column2 = value2, ...
--WHERE condition;
--UPDATE Drug SET WeightInGram = 10 WHERE [Name] like 'Co_ain%'
UPDATE Drug SET WeightInGram = 1 WHERE ID = 1



--select 'Palle' as 'ANd the Winner is'

--DELETE FROM Drug WHERE NickName like '%Ganja%'
SELECT * FROM Drug



