--PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Salary DESC) OVER (PARTITION BY DepartmentId) AS MedianCont

SELECT Right(Upper(FirstName), 2), LEFT(LOWER(LastName), 3) AS Shortened, MiddleName, reverse(CONCAT(FirstName, ' ', LastName)) AS ABOMINATION FROM [Employees]

SELECT * FROM [Projects]

SELECT FORMAT(StartDate, 'MM-yyyy-dd-hh-mm-ss') AS NVM FROM [Projects]

SELECT [FirstName], [LastName] FROM [Employees] WHERE [FirstName] LIKE 'Sa%'

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

SELECT [EmployeeID], [FirstName], [LastName]