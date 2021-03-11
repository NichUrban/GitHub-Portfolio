CREATE VIEW [dbo].[FullMemberShopper]
	AS 
	SELECT [m].[Id] AS MemberTableId, [m].[FirstName], [m].[LastName], [m].[PhoneNumber], 
		[a].[Id] AS AddressTableId, [a].[MemberId] AS AddressTableMemberId, [a].[StreetAddress], [a].[City], [a].[State], [a].[ZipCode]
	FROM dbo.MemberShopper m
	LEFT JOIN dbo.MemberAddress a ON m.Id = a.MemberId
