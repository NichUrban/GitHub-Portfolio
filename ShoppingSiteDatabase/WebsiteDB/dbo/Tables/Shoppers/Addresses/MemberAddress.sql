CREATE TABLE [dbo].[MemberAddress]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StreetAddress] VARCHAR(50) NOT NULL, 
    [City] VARCHAR(50) NOT NULL, 
    [State] VARCHAR(50) NOT NULL, 
    [ZipCode] VARCHAR(50) NOT NULL, 
    [MemberId] INT NOT NULL, 
    CONSTRAINT [FK_Address_Member] FOREIGN KEY ([MemberId]) REFERENCES [MemberShopper]([Id]) 
    
)
