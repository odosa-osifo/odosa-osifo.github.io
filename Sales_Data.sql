---1	Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
SELECT UPPER(EmpFname) AS EmpName FROM [dbo].['Employee Info$'] 

---2	Write a query to fetch the number of employees working in the department ‘HR’.
SELECT COUNT(EmpID) AS 'HR COUNT' FROM [dbo].['Employee Info$'] WHERE Department = 'HR'

---3	Write a query to get the current date.
SELECT CAST(GETDATE() AS DATE) AS 'Current Date'

---4	Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
SELECT LEFT(EmpLname, 4)  AS EmpLname_First_4 FROM [dbo].['Employee Info$']

---5	Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT LEFT(Address, CHARINDEX('(', Address) - 1) AS PlaceName FROM [dbo].['Employee Info$']

---6	Write a query to create a new table that consists of data and structure copied from the other table.
 USE [January_2026_Cohort]
GO

CREATE TABLE [Employee Position]
(EmpID INT,
EmpPosition VARCHAR (100),
DateofJoining DATE,
Salary DECIMAL(6,2))

ALTER TABLE [Employee Position]
ALTER COLUMN Salary DECIMAL(10,2)

INSERT INTO [Employee Position]

VALUES(1, 'Manager',	'2022-05-01',	500000),
	(2,   'Executive'	,'2022-05-02',	75000),
	(3,	  'Manager'	,'2022-05-01',	90000),
	(4,   'Lead' ,	'2022-05-02',  85000),
	(5,	 'Executive','2022-05-01',300000)

	
---7	Write q query to find all the employees whose salary is between 50000 to 100000.
SELECT * FROM [Employee Position] WHERE Salary >=50000 AND Salary <= 100000
SELECT * FROM [Employee Position] WHERE Salary BETWEEN 50000 AND 100000

---8	Write a query to find the names of employees that begin with ‘S’
SELECT * FROM [dbo].['Employee Info$'] WHERE EmpFname LIKE 'S%'

---9	Write a query to fetch top N records.
SELECT TOP 3* FROM [dbo].[Employee Position] 
SELECT TOP 3* FROM [dbo].[Employee Position] ORDER BY Salary DESC

---10	Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
SELECT CONCAT(EmpFname,' ', EmpLname) AS 'Full Name'  FROM [dbo].['Employee Info$']

---11	Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1995 and are grouped according to gender
 SELECT Gender, COUNT(EmpID) AS '02/05/1970 - 31/12/1995' FROM  [dbo].['Employee Info$']
 WHERE DOB BETWEEN '1970-05-02' AND '1995-12-31' GROUP BY Gender

---12	Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
SELECT * FROM [dbo].['Employee Info$'] ORDER BY EmpLname DESC , Department ASC

---13	Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
SELECT * FROM [dbo].['Employee Info$'] WHERE EmpLname LIKE '____A'

---14	Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
SELECT * FROM [dbo].['Employee Info$'] WHERE EmpFname != 'Sanjay' AND EmpFname!= 'Sonia'

---15	Write a query to fetch details of employees with the address as “DELHI(DEL)”
SELECT * FROM [dbo].['Employee Info$'] WHERE Address = 'DELHI(DEL)'

---16	Write a query to fetch all employees who also hold the managerial position.
SELECT * FROM [dbo].[Employee Position] WHERE EmpPosition = 'Manager'

---17	Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order
SELECT  COUNT(DISTINCT(Department)) AS 'Department-wise-count' FROM [dbo].['Employee Info$'] ORDER BY 'department-wise-count' ASC

---18	Write a query to fetch Male employees in HR department
SELECT EmpFname, EmpLname, Gender, Department FROM [dbo].['Employee Info$'] WHERE Gender = 'M' AND Department = 'HR'

---19	Write an SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table
SELECT * FROM [dbo].['Employee Info$'] EI
INNER JOIN [dbo].['Employee position$'] EP ON EI.EmpID = EP.EmpID
WHERE EP.DateOfJoining IS NOT NULL

---20	Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table
SELECT  DISTINCT TOP 2 Salary AS 'Min Salary' 
FROM [dbo].['Employee position$'] ORDER BY Salary ASC 

SELECT  DISTINCT TOP 2 Salary AS 'Max Salary' 
FROM [dbo].['Employee position$'] ORDER BY Salary DESC 

--- Work Place Safety Data

---1	How many incidents occurred at each plant?
SELECT [Plant], COUNT(*) AS 'Incident Count' FROM [dbo].['Workplace Safety Data$']
GROUP BY [Plant] ORDER BY 'Incident Count' DESC

---2	What is the total incident cost per department?
SELECT [Department],SUM([Incident Cost]) AS 'Total Incident Cost' 
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Department]

---3	Which incident type resulted in the highest total days lost?
SELECT [Incident Type], SUM([Days Lost]) AS 'Total Days Lost' 
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY 'Total Days Lost' DESC

---4	What is the distribution of incident types by shift?
SELECT [Incident Type],[Shift],COUNT(*) AS 'Incident Count' 
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type],[Shift]
ORDER BY [Incident Type],[Shift] DESC

---5	What is the average incident cost for each injury location?
SELECT [Injury Location], AVG([Incident Cost]) AS 'Average Incident Cost' FROM [dbo].['Workplace Safety Data$']
GROUP BY [Injury Location]
ORDER BY 'Average Incident Cost' DESC

---6	Which age group has the highest number of incidents?
SELECT TOP(2) [Age Group],COUNT([Incident Type]) AS 'Count of incident Type' 
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Age Group]
ORDER BY 'Count of incident Type' DESC

---7	How many incidents were reported as 'Lost Time' by each plant?
SELECT [Plant], COUNT(*) AS 'Count of lost time' FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Lost Time'
GROUP BY [Plant]
ORDER BY 'Count of lost time' DESC

---8	Which department had the highest number of 'Crush & Pinch' incidents?
SELECT TOP(1) [Department], COUNT(*) AS 'Count of crush & Pinch' FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Crush & Pinch'
GROUP BY [Department]
ORDER BY 'Count of crush & Pinch' DESC

---9	Which plants reported the most "Near Miss" incidents?
SELECT [Plant],COUNT(*) AS 'Count of Near Misses' FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Near Miss'
GROUP BY [Plant]
ORDER BY 'Count of Near Misses' DESC


---10	What is the total number of incidents by year and month?
SELECT YEAR([Date]) AS 'Incident_year',
---MONTH([Date]) AS 'Incident_month',
DATENAME(MONTH, [Date]) AS 'Incident_month',
COUNT(*) AS 'Count_of_Incidents' FROM [dbo].['Workplace Safety Data$']
GROUP BY YEAR([Date]),DATENAME(MONTH, [Date])
ORDER BY YEAR([Date]) , DATENAME(MONTH, [Date]) DESC


---11	Which gender has the most reported incidents?
SELECT [Gender],  COUNT([Report Type]) AS 'Count'
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Gender]
ORDER BY 'Count' DESC


---12	What is the total cost of incidents per year?
SELECT YEAR([Date]) AS 'Year', SUM([Incident Cost]) AS 'Sum of Incident Cost'
FROM [dbo].['Workplace Safety Data$']
GROUP  BY YEAR([Date])
ORDER BY  YEAR([Date]) DESC

---13	Which incident resulted in the highest cost?
SELECT [Incident Type], MAX([Incident Cost]) AS 'Maximum Incident Cost'
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]

---14	What is the total cost of incidents for each report type?
SELECT [Report Type], SUM([Incident Cost]) AS 'Total Incident Cost'
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Report Type]
ORDER BY 'Total Incident Cost' DESC

---15	Which departments had incidents with more than 2 days lost?
SELECT [Department] FROM [dbo].['Workplace Safety Data$']
WHERE [Days Lost] > 2



---16	What is the average number of days lost per incident type?
SELECT [Incident Type],ROUND(AVG([Days Lost]),3) AS 'Average Days Lost'
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]

---17	What is the distribution of incidents by shift (Day, Afternoon, Night)?
SELECT [Incident Type],[Shift], COUNT(*) AS 'Count'
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type],[Shift]
ORDER BY [Incident Type],[Shift] DESC

---18	Which months have the highest number of incidents?
SELECT DATENAME(MONTH,[Date]) AS 'Month', COUNT([Incident Type]) AS 'Count' 
FROM [dbo].['Workplace Safety Data$']
GROUP BY DATENAME(MONTH,[Date])
ORDER BY 'Count' DESC

---19	What is the total cost of "Vehicle" related incidents?
SELECT SUM([Incident Cost]) AS 'Sum of Vehicle related incidents' 
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Vehicle'

---20	Which age group is most affected by "Falling Object" incidents?
SELECT [Age Group], COUNT(*) AS 'Count'
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Falling Object'
GROUP BY [Age Group]
ORDER BY 'Count' DESC
