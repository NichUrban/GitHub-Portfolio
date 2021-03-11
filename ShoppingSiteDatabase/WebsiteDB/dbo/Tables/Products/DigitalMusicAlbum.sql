CREATE TABLE [dbo].[DigitalMusicAlbum]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductIDNum] INT NOT NULL, 
    [Price] DECIMAL(18, 2) NOT NULL, 
    [DownloadsLeft] INT NOT NULL, 
    [Artist] VARCHAR(50) NOT NULL, 
    [Title] VARCHAR(50) NOT NULL, 
    [NumberOfTracks] INT NOT NULL
)
