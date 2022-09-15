USE Master
GO
IF DB_ID('SuperShopDB') IS NOT NULL
	BEGIN
		ALTER DATABASE SuperShopDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE SuperShopDB
	END
GO
CREATE DATABASE SuperShopDB
GO
USE SuperShopDB
GO

CREATE TABLE [Customer] (
  [Id] INT PRIMARY KEY IDENTITY(1,1),
  [Username] NVARCHAR(100),
  [Email] NVARCHAR(100),
  [Password] NVARCHAR(100)
);

CREATE TABLE [Product] (
  [Id] INT PRIMARY KEY IDENTITY(1,1),
  [Productname] NVARCHAR(100),
  [Price] DECIMAL(6,2)
);

CREATE TABLE [Order] (
  [Id] INT PRIMARY KEY IDENTITY(1,1),
  [Customer_Id] INT,
  CONSTRAINT [FK_Order.Customer_Id] FOREIGN KEY ([Customer_Id]) REFERENCES [Customer]([Id])
);

CREATE TABLE ProductOrder(
  [Product_Id] INT FOREIGN KEY REFERENCES Product(Id),
  [Order_Id] INT FOREIGN KEY REFERENCES [Order](id),
  [Amount] INT,
)

INSERT INTO [Order] VALUES (5)
INSERT INTO ProductOrder VALUES (13, 1, 10)
INSERT INTO ProductOrder VALUES (23, 1, 5)

SELECT * FROM [Product]
SELECT * FROM Customer

SELECT Username, Email, STRING_AGG(CONCAT(ProductOrder.Amount, ' ', Product.ProductName), ', ') AS Purchase
FROM [Order]
JOIN Customer ON [Order].Customer_Id = Customer.Id
JOIN ProductOrder ON [Order].Id = ProductOrder.Order_Id
JOIN Product ON Product.Id = ProductOrder.Product_Id
GROUP BY Username, Email

