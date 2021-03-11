﻿/*
Deployment script for ShoppingWebsiteDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ShoppingWebsiteDB"
:setvar DefaultFilePrefix "ShoppingWebsiteDB"
:setvar DefaultDataPath "C:\Users\nicho\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\nicho\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[DigitalBook]...';


GO
CREATE TABLE [dbo].[DigitalBook] (
    [Id]            INT             IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]  INT             NOT NULL,
    [Price]         DECIMAL (18, 2) NOT NULL,
    [DownloadsLeft] INT             NOT NULL,
    [Title]         VARCHAR (50)    NOT NULL,
    [Author]        VARCHAR (50)    NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[DigitalMovie]...';


GO
CREATE TABLE [dbo].[DigitalMovie] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]     INT             NOT NULL,
    [Price]            DECIMAL (18, 2) NOT NULL,
    [DownloadsLeft]    INT             NOT NULL,
    [Title]            VARCHAR (50)    NOT NULL,
    [DirectedBy]       VARCHAR (50)    NOT NULL,
    [RunTimeInMinutes] FLOAT (53)      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[DigitalMusicAlbum]...';


GO
CREATE TABLE [dbo].[DigitalMusicAlbum] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]   INT             NOT NULL,
    [Price]          DECIMAL (18, 2) NOT NULL,
    [DownloadsLeft]  INT             NOT NULL,
    [Artist]         VARCHAR (50)    NOT NULL,
    [Title]          VARCHAR (50)    NOT NULL,
    [NumberOfTracks] INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EmployeeAddress]...';


GO
CREATE TABLE [dbo].[EmployeeAddress] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [StreetAddress] VARCHAR (50) NOT NULL,
    [City]          VARCHAR (50) NOT NULL,
    [State]         VARCHAR (50) NOT NULL,
    [ZipCode]       VARCHAR (50) NOT NULL,
    [EmployeeId]    INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EmployeeShopper]...';


GO
CREATE TABLE [dbo].[EmployeeShopper] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [FirstName]   VARCHAR (50) NOT NULL,
    [LastName]    VARCHAR (50) NOT NULL,
    [PhoneNumber] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[MemberAddress]...';


GO
CREATE TABLE [dbo].[MemberAddress] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [StreetAddress] VARCHAR (50) NOT NULL,
    [City]          VARCHAR (50) NOT NULL,
    [State]         VARCHAR (50) NOT NULL,
    [ZipCode]       VARCHAR (50) NOT NULL,
    [MemberId]      INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[MemberShopper]...';


GO
CREATE TABLE [dbo].[MemberShopper] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [FirstName]   VARCHAR (50) NOT NULL,
    [LastName]    VARCHAR (50) NOT NULL,
    [PhoneNumber] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PhysicalBook]...';


GO
CREATE TABLE [dbo].[PhysicalBook] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [ProductIDNum] INT             NOT NULL,
    [Price]        DECIMAL (18, 2) NOT NULL,
    [Pages]        INT             NOT NULL,
    [InStock]      INT             NOT NULL,
    [Title]        VARCHAR (50)    NOT NULL,
    [Author]       VARCHAR (50)    NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PhysicalMovieDVD]...';


GO
CREATE TABLE [dbo].[PhysicalMovieDVD] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]     INT             NOT NULL,
    [Price]            DECIMAL (18, 2) NOT NULL,
    [NumberOfDisks]    INT             NOT NULL,
    [InStock]          INT             NOT NULL,
    [Title]            VARCHAR (50)    NOT NULL,
    [DirectedBy]       VARCHAR (50)    NOT NULL,
    [RunTimeInMinutes] FLOAT (53)      NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PhysicalMusicAlbumCD]...';


GO
CREATE TABLE [dbo].[PhysicalMusicAlbumCD] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]     INT             NOT NULL,
    [Price]            DECIMAL (18, 2) NOT NULL,
    [IsSpecialEdition] BIT             NOT NULL,
    [InStock]          INT             NOT NULL,
    [Artist]           VARCHAR (50)    NOT NULL,
    [Title]            VARCHAR (50)    NOT NULL,
    [NumberOfTracks]   INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Address_Employee]...';


GO
ALTER TABLE [dbo].[EmployeeAddress]
    ADD CONSTRAINT [FK_Address_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[EmployeeShopper] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Address_Member]...';


GO
ALTER TABLE [dbo].[MemberAddress]
    ADD CONSTRAINT [FK_Address_Member] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[MemberShopper] ([Id]);


GO
PRINT N'Creating [dbo].[FullEmployeeShopper]...';


GO
CREATE VIEW [dbo].[FullEmployeeShopper]
	AS 
	SELECT [e].[Id] AS EmployeeTableId, [e].[FirstName], [e].[LastName], [e].[PhoneNumber], 
		[a].[Id] AS AddressTableId, [a].[EmployeeId] AS AddressTableEmployeeId, [a].[StreetAddress], [a].[City], [a].[State], [a].[ZipCode]
	FROM dbo.EmployeeShopper e
	LEFT JOIN dbo.EmployeeAddress a ON e.Id = a.EmployeeId
GO
PRINT N'Creating [dbo].[FullMemberShopper]...';


GO
CREATE VIEW [dbo].[FullMemberShopper]
	AS 
	SELECT [m].[Id] AS MemberTableId, [m].[FirstName], [m].[LastName], [m].[PhoneNumber], 
		[a].[Id] AS AddressTableId, [a].[MemberId] AS AddressTableMemberId, [a].[StreetAddress], [a].[City], [a].[State], [a].[ZipCode]
	FROM dbo.MemberShopper m
	LEFT JOIN dbo.MemberAddress a ON m.Id = a.MemberId
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5fe18b4e-0ec6-4b56-acec-9e95cabad997')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5fe18b4e-0ec6-4b56-acec-9e95cabad997')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '718d05a0-c11a-48fc-89aa-2a8fbd15e60e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('718d05a0-c11a-48fc-89aa-2a8fbd15e60e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e2fc0f95-0d0f-454d-879b-4e2507b02b4b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e2fc0f95-0d0f-454d-879b-4e2507b02b4b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '16719584-64eb-4fda-acb5-a8b4b96cfcab')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('16719584-64eb-4fda-acb5-a8b4b96cfcab')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


----------Shopper Tables----------

--Employee shopper table
DELETE FROM dbo.EmployeeShopper;
INSERT INTO dbo.EmployeeShopper(FirstName, LastName, PhoneNumber)
VALUES ('John', 'Smith', '123-456-7890'),
('Jill', 'Sanders', '234-567-8901'),
('Bob', 'Pearson', '345-678-9012'),
('Xandra', 'Eliper', '456-789-0123'),
('Amy', 'Peterson', '567-890-1234');

--Member shopper table
DELETE FROM dbo.MemberShopper;
INSERT INTO dbo.MemberShopper(FirstName, LastName, PhoneNumber)
VALUES ('Samantha', 'Edgar', '987-654-3210'),
('Bill', 'Wilson', '876-543-2109'),
('Tim', 'Corey', '765-432-1098'),
('Jessica', 'Bonovitch', '654-321-0987'),
('Vijay', 'Samperi', '543-210-9876');

--Employee address table
DELETE FROM dbo.EmployeeAddress;
INSERT INTO dbo.EmployeeAddress(StreetAddress, City, State, ZipCode, EmployeeId)
VALUES ('342 Deerborne Ave', 'Midtown', 'IL', '64880', 1),
('11 Elm Ln', 'PintBorough', 'NY', '67512', 3),
('4 Cedar St', 'Allensburg', 'PA', '77742', 2),
('16 Triar St', 'Basset', 'NJ', '54596', 5),
('1428 Akron Dr', 'Garret', 'OH', '12467', 4);

--Member address table
DELETE FROM dbo.MemberAddress;
INSERT INTO dbo.MemberAddress(StreetAddress, City, State, ZipCode, MemberId)
VALUES ('17 Bonnie Ln', 'Madeline', 'WI', '79720', 5),
('18 Sun Dr', 'Texca', 'AZ', '25643', 3),
('665 Apple St', 'Plinton', 'GA', '11568', 4),
('248 Esher Rd', 'Stockton', 'NJ', '46972', 1),
('2 Lone St', 'Wildwood', 'MT', '34465', 2);


----------Product Tables----------

--Digital book table
DELETE FROM dbo.DigitalBook
INSERT INTO dbo.DigitalBook(ProductIDNum, Price, DownloadsLeft, Title, Author)
VALUES (12345, 25.99, 3, 'Reading in the Digital Age', 'Jeff Scorpio'),
(23456, 16.99, 3, 'Dragon Slaying Adventures', 'Edmund Sagittarius'),
(34567, 21.99, 3, 'The Greylock Mysteries', 'Julia Leo');

--Digital movie table
DELETE FROM dbo.DigitalMovie
INSERT INTO dbo.DigitalMovie(ProductIDNum, Price, DownloadsLeft, Title, DirectedBy, RunTimeInMinutes)
VALUES (45678, 20.99, 3, 'Action Park', 'Eugene Mulvihill', 92.45),
(56789, 10.59, 3, 'Fast Cars', 'Siri Appleton', 58.35),
(67890, 5.49, 3, 'Master Guitar 101', 'Shred Davis', 96.66666666666667);

--Digital music album table
DELETE FROM dbo.DigitalMusicAlbum
INSERT INTO dbo.DigitalMusicAlbum(ProductIDNum, Price, DownloadsLeft, Artist, Title, NumberOfTracks)
VALUES (78901, 19.99, 3, 'Mettalico', 'Unjustice for All', 7),
(89012, 5.45, 3, 'Horus Baker', 'Soothing Guitar', 12),
(90123, 15.98, 3, 'Ice Cold', 'Best Beats vol III', 10);

--Physical book table
DELETE FROM dbo.PhysicalBook
INSERT INTO dbo.PhysicalBook(ProductIDNum, Price, Pages, InStock, Title, Author)
VALUES (98765, 44.79, 451, 985, 'Ancient Rome', 'Titus Pullo'),
(87654, 28.95, 236, 1545, 'How to Code', 'Linus Gates'),
(76543, 14.99, 180, 567, 'Essential Recipes', 'Lao Chao');

--Physical movie table
DELETE FROM dbo.PhysicalMovieDVD
INSERT INTO dbo.PhysicalMovieDVD(ProductIDNum, Price, NumberOfDisks, InStock, Title, DirectedBy, RunTimeInMinutes)
VALUES (65432, 18.99, 1, 433, 'Summer of Romance', 'Fantas Marjorie', 72.66),
(54321, 25.59, 2, 986, 'Wise Guys', 'Ben Nottingham', 55.7333333333333333),
(43210, 16.99, 3, 556, 'Lord of the Bracelets Trilogy', 'Octavian Eris', 245.66);

--Physical music album cd table
DELETE FROM dbo.PhysicalMusicAlbumCD
INSERT INTO dbo.PhysicalMusicAlbumCD(ProductIDNum, Price, IsSpecialEdition, InStock, Artist, Title, NumberOfTracks)
VALUES (32109, 20.95, 0, 958, 'Propaganda', 'Fight the Power', 7),
(21098, 15.98, 1, 228, 'Billy Gilfoyle', 'Greatest Hits 77-92', 25 ),
(10987, 26.99, 0, 473, 'Blue Skies', 'A Different Breed', 7);
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
