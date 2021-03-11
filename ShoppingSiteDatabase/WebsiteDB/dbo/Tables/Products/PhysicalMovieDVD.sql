CREATE TABLE [dbo].[PhysicalMovieDVD]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductIDNum] INT NOT NULL, 
    [Price] DECIMAL(18, 2) NOT NULL, 
    [NumberOfDisks] INT NOT NULL, 
    [InStock] INT NOT NULL, 
    [Title] VARCHAR(50) NOT NULL, 
    [DirectedBy] VARCHAR(50) NOT NULL, 
    [RunTimeInMinutes] FLOAT NOT NULL
)
