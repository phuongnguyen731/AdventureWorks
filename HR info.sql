/****** Extract Rate in the last Modify Date ******/
SELECT [BusinessEntityID]
      ,[Rate]
	  ,[PayFrequency]
      ,[ModifiedDate]
FROM 
	 (SELECT [BusinessEntityID]
      ,[RateChangeDate]
      ,[Rate]
      ,[PayFrequency]
      ,[ModifiedDate]
	  , rank() OVER(PARTITION BY [BusinessEntityID] ORDER BY [ModifiedDate] DESC) AS Rn
FROM [AdventureWorks2019].[HumanResources].[EmployeePayHistory]) AS T
WHERE T.Rn = 1
GO 

/****** Employees Info  ******/
WITH EmployeeDepartmentHist AS
	(
	SELECT [BusinessEntityID]
      ,[DepartmentID]
	  ,[StartDate]
      ,[EndDate]  
	FROM [HumanResources].[EmployeeDepartmentHistory]
	WHERE [EndDate] IS NULL
	) 
SELECT edh.[BusinessEntityID], edh.[DepartmentID]
		,e.[OrganizationLevel] ,d.[Name] ,d.[GroupName], e.[JobTitle],e.[BirthDate],e.[MaritalStatus],e.[Gender], e.[ModifiedDate]
FROM [HumanResources].[Employee] AS e 
JOIN EmployeeDepartmentHist AS edh ON e.[BusinessEntityID]  = edh.[BusinessEntityID]
JOIN [HumanResources].[Department] AS d ON edh.[DepartmentID] = d.[DepartmentID]
ORDER BY edh.[DepartmentID], e.[OrganizationLevel]
GO 


