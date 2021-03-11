CREATE TABLE [dbo].[PhysicalMusicAlbumCD]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductIDNum] INT NOT NULL, 
    [Price] DECIMAL(18, 2) NOT NULL, 
    [IsSpecialEdition] BIT NOT NULL, 
    [InStock] INT NOT NULL, 
    [Artist] VARCHAR(50) NOT NULL, 
    [Title] VARCHAR(50) NOT NULL, 
    [NumberOfTracks] INT NOT NULL
)
