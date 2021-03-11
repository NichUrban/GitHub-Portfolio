CREATE VIEW [dbo].[FullEmployeeShopper]
	AS 
	SELECT [e].[Id] AS EmployeeTableId, [e].[FirstName], [e].[LastName], [e].[PhoneNumber], 
		[a].[Id] AS AddressTableId, [a].[EmployeeId] AS AddressTableEmployeeId, [a].[StreetAddress], [a].[City], [a].[State], [a].[ZipCode]
	FROM dbo.EmployeeShopper e
	LEFT JOIN dbo.EmployeeAddress a ON e.Id = a.EmployeeId
