CREATE PROCEDURE [dbo].[spMemberShopper_FillterByLastName]
	@LastName nvarchar(50)
AS
	BEGIN
		SELECT [Id], [FirstName], [LastName], [PhoneNumber]
		FROM dbo.MemberShopper
		WHERE LastName = @LastName;
	END