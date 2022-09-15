USE Master
GO
IF DB_ID('MovieDB') IS NOT NULL
	BEGIN
		ALTER DATABASE MovieDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE MovieDB
	END
GO
CREATE DATABASE MovieDB
GO
USE MovieDB
GO

CREATE TABLE Movie (
Id INT IDENTITY(1,1),
Title NVARCHAR(255)
)

CREATE TABLE Actor (
Id INT IDENTITY(1,1),
[Name] NVARCHAR(255)
)

--Bridge Table for many 2 many relations
CREATE TABLE MovieActor (
MovieId INT,
ActorId INT
)

INSERT INTO Movie VALUES ('Saving Private Ryan'),('Forest Gump'),('Sausage Party'),('Ted')
INSERT INTO Actor VALUES ('Tom Hanks'),('Seth Rogan'),('Mark Wahlberg')

INSERT INTO MovieActor VALUES (1,1), (1,3), (2,1), (3,2), (4,2), (4,3)

SELECT Movie.Title, STRING_AGG(Actor.Name,', ') AS 'Actor' FROM Movie
FULL JOIN MovieActor ON Movie.Id = MovieActor.MovieId
FULL JOIN Actor ON Actor.Id = MovieActor.ActorId
GROUP BY Movie.Title