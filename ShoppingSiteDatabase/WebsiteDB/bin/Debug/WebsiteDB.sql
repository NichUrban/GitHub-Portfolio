﻿/*
Deployment script for WebsiteDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "WebsiteDB"
:setvar DefaultFilePrefix "WebsiteDB"
:setvar DefaultDataPath "C:\Users\nicho\AppData\Local\Microsoft\VisualStudio\SSDT\ShoppingSiteDatabase"
:setvar DefaultLogPath "C:\Users\nicho\AppData\Local\Microsoft\VisualStudio\SSDT\ShoppingSiteDatabase"

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
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
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
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Rename refactoring operation with key 5fe18b4e-0ec6-4b56-acec-9e95cabad997 is skipped, element [dbo].[DigitalBook].[productIDNum] (SqlSimpleColumn) will not be renamed to ProductIDNum';


GO
PRINT N'Rename refactoring operation with key 718d05a0-c11a-48fc-89aa-2a8fbd15e60e is skipped, element [dbo].[Address].[ShopperId] (SqlSimpleColumn) will not be renamed to MemberId';


GO
PRINT N'Rename refactoring operation with key e2fc0f95-0d0f-454d-879b-4e2507b02b4b is skipped, element [dbo].[Address].[Member] (SqlSimpleColumn) will not be renamed to MemberId';


GO
PRINT N'Rename refactoring operation with key 16719584-64eb-4fda-acb5-a8b4b96cfcab is skipped, element [dbo].[FK_Address_ToTable] (SqlForeignKeyConstraint) will not be renamed to [FK_Address_Member]';


GO
PRINT N'Creating [dbo].[DigitalBook]...';


GO
CREATE TABLE [dbo].[DigitalBook] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]  INT          NULL,
    [Price]         DECIMAL (18) NULL,
    [DownloadsLeft] INT          NULL,
    [Title]         VARCHAR (50) NULL,
    [Author]        VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[DigitalMovie]...';


GO
CREATE TABLE [dbo].[DigitalMovie] (
    [Id]               INT          IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]     INT          NULL,
    [Price]            DECIMAL (18) NULL,
    [DownloadsLeft]    INT          NULL,
    [Title]            VARCHAR (50) NULL,
    [DirectedBy]       VARCHAR (50) NULL,
    [RunTimeInMinutes] FLOAT (53)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[DigitalMusicAlbum]...';


GO
CREATE TABLE [dbo].[DigitalMusicAlbum] (
    [Id]             INT          IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]   INT          NULL,
    [Price]          DECIMAL (18) NULL,
    [DownloadsLeft]  INT          NULL,
    [Artist]         VARCHAR (50) NULL,
    [Title]          VARCHAR (50) NULL,
    [NumberOfTracks] INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EmployeeShopper]...';


GO
CREATE TABLE [dbo].[EmployeeShopper] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [FirstName]   VARCHAR (50) NULL,
    [LastName]    VARCHAR (50) NULL,
    [PhoneNumber] VARCHAR (50) NULL,
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
    [MemberId]      INT          NULL,
    [EmployeeId]    INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[MemberShopper]...';


GO
CREATE TABLE [dbo].[MemberShopper] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [FirstName]   VARCHAR (50) NULL,
    [LastName]    VARCHAR (50) NULL,
    [PhoneNumber] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PhysicalBook]...';


GO
CREATE TABLE [dbo].[PhysicalBook] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [ProductIDNum] INT          NULL,
    [Price]        DECIMAL (18) NULL,
    [Pages]        INT          NULL,
    [InStock]      INT          NULL,
    [Title]        VARCHAR (50) NULL,
    [Author]       VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PhysicalMovieDVD]...';


GO
CREATE TABLE [dbo].[PhysicalMovieDVD] (
    [Id]               INT          IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]     INT          NULL,
    [Price]            DECIMAL (18) NULL,
    [NumberOfDisks]    INT          NULL,
    [InStock]          INT          NULL,
    [Title]            VARCHAR (50) NULL,
    [DirectedBy]       VARCHAR (50) NULL,
    [RunTimeInMinutes] FLOAT (53)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PhysicalMusicAlbumCD]...';


GO
CREATE TABLE [dbo].[PhysicalMusicAlbumCD] (
    [Id]               INT          IDENTITY (1, 1) NOT NULL,
    [ProductIDNum]     INT          NOT NULL,
    [Price]            DECIMAL (18) NOT NULL,
    [IsSpecialEdition] BIT          NOT NULL,
    [InStock]          INT          NULL,
    [Artist]           VARCHAR (50) NULL,
    [Title]            VARCHAR (50) NULL,
    [NumberOfTracks]   INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Address_Member]...';


GO
ALTER TABLE [dbo].[MemberAddress] WITH NOCHECK
    ADD CONSTRAINT [FK_Address_Member] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[MemberShopper] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Address_Employee]...';


GO
ALTER TABLE [dbo].[MemberAddress] WITH NOCHECK
    ADD CONSTRAINT [FK_Address_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[EmployeeShopper] ([Id]);


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
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[MemberAddress] WITH CHECK CHECK CONSTRAINT [FK_Address_Member];

ALTER TABLE [dbo].[MemberAddress] WITH CHECK CHECK CONSTRAINT [FK_Address_Employee];


GO
PRINT N'Update complete.';


GO
