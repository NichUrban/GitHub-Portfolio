CREATE VIEW [dbo].[AllProductsBasicInfo]
	AS 
	SELECT [db].[Title], [db].[Price] FROM dbo.DigitalBook db
	UNION ALL
	SELECT [dm].[Title], [dm].[Price] FROM dbo.DigitalMovie dm
	UNION ALL
	SELECT [da].[Title], [da].[Price] FROM dbo.DigitalMusicAlbum da
	UNION ALL
	SELECT [pb].[Title], [pb].[Price] FROM dbo.PhysicalBook pb
	UNION ALL
	SELECT [pm].[Title], [pm].[Price] FROM dbo.PhysicalMovieDVD pm
	UNION ALL
	SELECT [pa].[Title], [pa].[Price] FROM dbo.PhysicalMusicAlbumCD pa;
	
	 
	
	
	
	

