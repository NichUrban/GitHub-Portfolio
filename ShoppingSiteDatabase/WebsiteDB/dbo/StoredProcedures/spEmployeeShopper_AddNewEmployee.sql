CREATE PROCEDURE [dbo].[spEmployeeShopper_AddNewEmployee]
	@FirstName varchar(50),
	@LastName varchar(50),
	@PhoneNumber varchar(50)
AS
	BEGIN
		INSERT INTO dbo.EmployeeShopper
		VALUES (@FirstName, @LastName, @PhoneNumber);
	END	