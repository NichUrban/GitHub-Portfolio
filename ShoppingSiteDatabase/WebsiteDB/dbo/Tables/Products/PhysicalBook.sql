CREATE TABLE [dbo].[PhysicalBook]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductIDNum] INT NOT NULL, 
    [Price] DECIMAL(18, 2) NOT NULL, 
    [Pages] INT NOT NULL, 
    [InStock] INT NOT NULL, 
    [Title] VARCHAR(50) NOT NULL, 
    [Author] VARCHAR(50) NOT NULL
)
