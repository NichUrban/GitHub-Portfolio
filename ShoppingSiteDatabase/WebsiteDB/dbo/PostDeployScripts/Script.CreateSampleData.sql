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
VALUES ('Samantha', 'Samperi', '987-654-3210'),
('Bill', 'Wilson', '876-543-2109'),
('Tim', 'Corey', '765-432-1098'),
('Jessica', 'Bonovitch', '654-321-0987'),
('Vijay', 'Wilson', '543-210-9876');

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