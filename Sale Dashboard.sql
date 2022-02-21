
/****** Info of SalesOrderDetail  ******/
SELECT	sod.[SalesOrderID] ,sod.[ProductID]
		,pp.[Name], sod.[OrderQty], sod.[UnitPrice]
		,sod.[UnitPriceDiscount] ,sod.[LineTotal] , sod.[ModifiedDate]
FROM [AdventureWorks2019].[Sales].[SalesOrderDetail] AS sod
LEFT JOIN [Production].[Product] AS pp 
ON sod.[ProductID] = pp.[ProductID]
GO

/****** Info of SalesOrderHeader ******/
SELECT soh.[SalesOrderID] ,soh.[OrderDate],soh.[OnlineOrderFlag]
		,soh.[SalesPersonID],soh.[TerritoryID],soh.[SubTotal]
		,p.[BusinessEntityID]
		,Isnull(p.[FirstName],' ') +' '+ Isnull(p.[MiddleName],' ')+' '+ Isnull(p.[LastName],' ') AS FullName 
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] AS soh
LEFT JOIN [AdventureWorks2019].[Person].[Person] AS p
ON soh.[SalesPersonID] = p.[BusinessEntityID]
ORDER BY soh.[SalesOrderID] 
GO 

/****** Info of SalesTerritory  ******/
SELECT [TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
FROM [AdventureWorks2019].[Sales].[SalesTerritory]
GO