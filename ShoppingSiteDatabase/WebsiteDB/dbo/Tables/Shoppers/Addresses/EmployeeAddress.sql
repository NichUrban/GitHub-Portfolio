CREATE TABLE [dbo].[EmployeeAddress]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StreetAddress] VARCHAR(50) NOT NULL, 
    [City] VARCHAR(50) NOT NULL, 
    [State] VARCHAR(50) NOT NULL, 
    [ZipCode] VARCHAR(50) NOT NULL, 
    [EmployeeId] INT NOT NULL, 
    CONSTRAINT [FK_Address_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [EmployeeShopper]([Id])
)
