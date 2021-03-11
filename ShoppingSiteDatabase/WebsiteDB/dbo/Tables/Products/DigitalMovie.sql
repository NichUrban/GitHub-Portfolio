CREATE TABLE [dbo].[DigitalMovie]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductIDNum] INT NOT NULL, 
    [Price] DECIMAL(18, 2) NOT NULL, 
    [DownloadsLeft] INT NOT NULL, 
    [Title] VARCHAR(50) NOT NULL, 
    [DirectedBy] VARCHAR(50) NOT NULL, 
    [RunTimeInMinutes] FLOAT NOT NULL
)
