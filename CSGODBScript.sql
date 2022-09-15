USE Master
GO
IF DB_ID('CSGODB') IS NOT NULL
	BEGIN
		ALTER DATABASE CSGODB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE CSGODB
	END
GO
CREATE DATABASE CSGODB
GO
USE CSGODB
GO

CREATE TABLE Player(
Id INT PRIMARY KEY IDENTITY(1,1),
PlayerName NVARCHAR(20)
)

CREATE TABLE Skin(
Id INT PRIMARY KEY IDENTITY(1,1),
SkinName NVARCHAR(100)
)

INSERT INTO Player VALUES ('Kjærbye'), ('Dev1ce'), ('KennyS')
INSERT INTO Skin VALUES ('AK-47 Ice Coaled'),('AK-47 Asiimov'),('AWP Neo-Noir'),('USP-S Printstream')

CREATE TABLE PlayerSkin(
PlayerId INT,
SkinId INT,
CONSTRAINT FK_PlayerId FOREIGN KEY (PlayerId) REFERENCES Player(Id)
)
ALTER TABLE PlayerSkin ADD CONSTRAINT FK_SkinId FOREIGN KEY (SkinId)
REFERENCES Skin(Id)

INSERT INTO PlayerSkin VALUES (1,1),(1,3),(2,1),(2,4),(2,3),(3,3),(3,4)

GO
CREATE VIEW PlayerSkinView AS
	SELECT PlayerName as Player, STRING_AGG(SkinName, ', ') AS Skins 
	FROM Player
	JOIN PlayerSkin ON Player.Id = PlayerSkin.PlayerId
	JOIN Skin ON Skin.Id = PlayerSkin.SkinId
	GROUP BY PlayerName
GO

SELECT * FROM PlayerSkinView WHERE Player like 'Dev%'