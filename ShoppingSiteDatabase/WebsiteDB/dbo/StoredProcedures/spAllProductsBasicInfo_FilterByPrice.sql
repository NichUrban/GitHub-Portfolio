CREATE PROCEDURE [dbo].[spAllProductsBasicInfo_FilterByPrice]
	@MinPrice decimal(18,2),
	@MaxPrice decimal(18,2)
AS
	BEGIN
		SELECT [Title], [Price] 
		FROM AllProductsBasicInfo
		WHERE Price > @MinPrice AND Price < @MaxPrice;
	END