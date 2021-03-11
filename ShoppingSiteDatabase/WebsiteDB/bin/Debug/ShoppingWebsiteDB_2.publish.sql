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
USE [$(DatabaseName)];


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
('11 Elm Ln', 'PintBorough', 'NY', '67512', 2),
('4 Cedar St', 'Allensburg', 'PA', '77742', 3),
('16 Triar St', 'Basset', 'NJ', '54596', 4),
('1428 Akron Dr', 'Garret', 'OH', '12467', 5);

--Member address table
DELETE FROM dbo.MemberAddress;
INSERT INTO dbo.MemberAddress(StreetAddress, City, State, ZipCode, MemberId)
VALUES ('17 Bonnie Ln', 'Madeline', 'WI', '79720', 1),
('18 Sun Dr', 'Texca', 'AZ', '25643', 2),
('665 Apple St', 'Plinton', 'GA', '11568', 3),
('248 Esher Rd', 'Stockton', 'NJ', '46972', 4),
('2 Lone St', 'Wildwood', 'MT', '34465', 5);
GO

GO
PRINT N'Update complete.';


GO
