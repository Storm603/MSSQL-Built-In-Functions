--PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Salary DESC) OVER (PARTITION BY DepartmentId) AS MedianCont

SELECT Right(Upper(FirstName), 2), LEFT(LOWER(LastName), 3) AS Shortened, MiddleName, reverse(CONCAT(FirstName, ' ', LastName)) AS ABOMINATION FROM [Employees]

SELECT * FROM [Projects]

SELECT [FirstName], [LastName] FROM [Employees] WHERE CHARINDEX('ei', [LastName], 1) <> 0

SELECT FORMAT(StartDate, 'MM-yyyy-dd-hh-mm-ss') AS NVM FROM [Projects]

SELECT [FirstName], [LastName] FROM [Employees] WHERE [FirstName] LIKE 'Sa%'

SELECT [FirstName] FROM [Employees] WHERE [DepartmentID] IN (3, 10) AND YEAR(HireDate) BETWEEN 1995 AND 2005

SELECT * FROM [Employees]

SELECT [FirstName], [LastName] FROM [Employees] WHERE [JobTitle] NOT LIKE '%engineer%'

select [Name] FROM [Towns] WHERE LEN([Name]) BETWEEN 5 AND 6 ORDER BY [Name]

SELECT [TownID], [Name] FROM [Towns] WHERE [Name] LIKE '[MKBE]%' ORDER BY [Name]
SELECT [TownID], [Name] FROM [Towns] WHERE [Name] NOT LIKE '[RBD]%' ORDER BY [Name]

CREATE VIEW [V_EmployeesHiredAfter2000] AS (SELECT [FirstName], [LastName] FROM [Employees] WHERE Year(HireDate) > 2000)
 
select * from [V_EmployeesHiredAfter2000]

select [FirstName], [LastName] FROM [Employees]	where LEN(LastName) = 5

SELECT [EmployeeID], [FirstName], [LastName], [Salary], DENSE_RANK() OVER (PARTITION BY e.Salary ORDER BY EmployeeID) AS [Rank] 
FROM [Employees] as e WHERE Salary BETWEEN 10000 AND 50000 ORDER BY Salary DESC


SELECT * FROM (
SELECT [EmployeeID], [FirstName], [LastName], [Salary], DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM [Employees] where Salary between 10000 and 50000) AS [RankingTable] WHERE [Rank] = 2  ORDER BY [Salary] DESC

SELECT * FROM [Employees] WHERE EmployeeID = 71

USE [Geography]

SELECT [CountryName] AS [County Name], [ISOCode] AS [ISO Code] FROM [Countries] WHERE LOWER([CountryName]) LIKE '%a%a%a%' ORDER BY [ISO Code]

--13th task 

SELECT * FROM [Peaks]
SELECT * FROM [Rivers]

SELECT [PeakName], [RiverName], LOWER(CONCAT(p.PeakName, SUBSTRING(r.RiverName, 2, LEN(r.RiverName) - 1))) AS [Mix] 
FROM [Peaks] AS p JOIN [Rivers] AS r ON right(LOWER(p.PeakName), 1) = LEFT(LOWER(r.RiverName), 1) ORDER BY [Mix]

SELECT * FROM Peaks, Rivers

USE [Diablo]

SELECT * FROM [Games]

SELECT TOP 50 [Name], FORMAT([Start], 'yyyy-MM-dd') AS [Start] FROM [Games] WHERE YEAR([Start]) IN (2011, 2012) order by [Start], [Name]

SELECT * FROM [Users]

SELECT [Username], SUBSTRING(Email, CHARINDEX('@', [Email]) + 1, LEN(Email) - CHARINDEX('@', [Email]) + 1) AS [Email Provider] FROM [Users] ORDER BY [Email Provider], [Username]

SELECT [Username], [IpAddress] from [Users] WHERE [IpAddress] LIKE '___.1%.%.___' ORDER BY [Username]

SELECT * FROM [Games]




SELECT * FROM (
SELECT [EmployeeID], [FirstName], [LastName], [Salary], DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM [Employees] where Salary between 10000 and 50000) AS [RankingTable] WHERE [Rank] = 2  ORDER BY [Salary] DESC


SELECT [Name] AS [Game],
CASE
	WHEN DATEPART(HH, [Start]) >= 0 AND DATEPART(HH, [Start]) < 12 THEN 'Morning'
	WHEN DATEPART(HH, [Start]) >= 12 AND DATEPART(HH, [Start]) < 18 THEN 'Afternoon'
	ELSE 'Evening'
	END AS [Part of the Day],
CASE
	WHEN [Duration] <= 3 THEN 'Extra Short'
	WHEN [Duration] BETWEEN 4 AND 6 THEN 'Short'
	WHEN [Duration] > 6 THEN 'Long'
	ELSE 'Extra Long'
	END AS [Duration] 
FROM [Games] as g 
ORDER BY [Name], [Duration], [Part of the Day]

USE [Orders]

SELECT * FROM [Orders]

SELECT [ProductName], [OrderDate], CAST(CAST(OrderDate as INT) + 3 AS datetime) AS [Pay Due]
, DATEADD(month, 1, [OrderDate]) as [Deliver Due] FROM [Orders]

CREATE TABLE [People](
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] VARCHAR(40),
	[Birthdate] DATETIME2
)

INSERT INTO [People] VALUES
	('Victor', '2000-12-07 00:00:00.000'),
	('Steven', '1992-09-10 00:00:00.000'),
	('Stephen', '1910-09-19 00:00:00.000'),
	('John', '2010-01-06 00:00:00.000')

INSERT INTO [People] VALUES
	('Victor2', '2022-04-14 19:10:00.000')

INSERT INTO [People] VALUES
	('Victor3', '2021-04-14 19:10:00.000')

INSERT INTO [People] VALUES
	('Victor4', '2021-06-14 19:10:00.000')

SELECT * FROM [People]

SELECT [Name]
, Floor(DATEDIFF(YEAR, Birthdate, GETDATE())) AS [Age in Years]
, DATEDIFF(MONTH, Birthdate, GETDATE()) AS [Age in Months] 
, DATEDIFF(DAY, Birthdate, GETDATE()) AS [Age in Days]
, DATEDIFF(minute, birthdate, GETDATE()) AS [Age in Minutes]
FROM [People]
 
