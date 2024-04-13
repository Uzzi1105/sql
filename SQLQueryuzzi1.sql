--CREATE TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int)



--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley',30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson',32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')


--INSERT INTO EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)



--//SELECT STATEMENT
--** Top, Distinct, Count, As, Max, Min, Avg
--*/


--SELECT * FROM EmployeeDemographics

--SELECT Firstname FROM EmployeeDemographics

--SELECT Firstname, LastName FROM EmployeeDemographics


--SELECT TOP 5  * FROM EmployeeDemographics                               FOR FINDING TOP


--SELECT DISTINCT (Gender)FROM EmployeeDemographics                         USED TO FIND DISTINCT VALUES

--SELECT COUNT(LastName)FROM EmployeeDemographics                           USED TO COUNT VALUES     IN THIS RESULTANT COLUMN WILL NOT HAVE A NAME


--SELECT COUNT(LastName) AS LastNameCount FROM EmployeeDemographics           IF WANT TO GIVE THE RESULTANT COLUMN A NAME THAN USE 'AS' THAN NAME YOU WANT TO GIVE
                                                                             -- 'AS' is used to give name to the resultant column same for every other function like max min etc

--SELECT*FROM EmployeeSalary


--SELECT max (Salary) FROM EmployeeSalary

--SELECT min(Salary) FROM EmployeeSalary

--SELECT avg (Salary) FROM EmployeeSalary



--SELECT*                                                  USED WHEN YOU HAVE TO FIND TABLE FROM OTHER DATABASE than use FROM DATABASENAME TABLENAME
--FROM  SQLTUTORIAL.dbo.EmployeeSalary



--WHERE STATEMENT =, !=,<>, <, >, And, Or, Like, Null, Not Null, In


--SELECT * FROM EmployeeDemographics                         only data of jim will be shown
--where FirstName = 'Jim'


--SELECT * FROM EmployeeDemographics                           for not equal to we use != or <>. its result will be all data except jim
--where FirstName <> 'Jim'


--SELECT * FROM EmployeeDemographics
--WHERE Age>30

--SELECT * FROM EmployeeDemographics
--WHERE Age>=30


--SELECT * FROM EmployeeDemographics
--WHERE Age<32

--SELECT * FROM EmployeeDemographics
--WHERE Age<=32


--SELECT * FROM EmployeeDemographics
--WHERE Age<=32 AND Gender = 'Male'


--SELECT * FROM EmployeeDemographics
--WHERE Age<=32 OR Gender = 'Male'


--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE 'S%'


--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE '%S%'


--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE 'S%o%'


--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE 'S%c%ott%'


--SELECT * FROM EmployeeDemographics
--WHERE FirstName is NULL

--SELECT * FROM EmployeeDemographics
--WHERE FirstName is NOT NULL


--SELECT * FROM EmployeeDemographics                            to get result of more than one we use IN 
--WHERE FirstName IN ('Jim', 'Michael')


--group by, order by


--SELECT DISTINCT (Gender)
--from EmployeeDemographics




--SELECT Gender
--from EmployeeDemographics
--GROUP BY Gender


--SELECT Gender, COUNT (Gender)
--from EmployeeDemographics
--GROUP BY Gender


--SELECT Gender, Age, COUNT (Gender)
--from EmployeeDemographics
--GROUP BY Gender, Age


--SELECT Gender, COUNT (Gender)
--from EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender



--SELECT Gender, COUNT (Gender) AS CountGender
--from EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender
--ORDER BY CountGender ASC



--SELECT Gender, COUNT (Gender) AS CountGender
--from EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender
--ORDER BY CountGender DESC


--SELECT Gender, COUNT (Gender) AS CountGender
--from EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender
--ORDER BY Gender DESC

--SELECT * FROM EmployeeDemographics
--ORDER BY Age DESC


--SELECT * FROM EmployeeDemographics
--ORDER BY Age asc, Gender DESC



--SELECT * FROM EmployeeSalary
----ORDER BY 4 asc, 5 DESC



--delete from EmployeeSalary
--WHERE Salary = 43000;


--INSERT INTO EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(null, 'Holly', 'Flax', null, 'NULL'),
--(1013, 'Darryl', 'Philbin', null, 'Male')

--SELECT*FROM EmployeeDemographics

--INSERT INTO EmployeeSalary VALUES
--(1010, 'NULL', 47000),
--(null, 'Salesman', 43000)



 --innerjoin full/left/right outer joins


--SELECT* FROM SQLTutorial.dbo.EmployeeDemographics

--SELECT* FROM SQLTutorial.dbo.EmployeeSalary

--  SELECT* FROM SQLTutorial.dbo.EmployeeDemographics
--  INNER JOIN SQLTutorial.dbo.EmployeeSalary
--        ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



   --SELECT*
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



	  
   --SELECT*
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --left OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



   ----SELECT*
   ----FROM SQLTutorial.dbo.EmployeeDemographics
   ----right OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   ----   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


   
   --SELECT EmployeeID, FirstName, LastName, JobTitle, Salary
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --right OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

   
   --SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --INNER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


   
   --SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --Right OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


   
   --SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --Right OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

   
   --SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --left OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

   
   
   --SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --left OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

   
   --SELECT*
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --full OUTER JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


	  
   --SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --inner JOIN SQLTutorial.dbo.EmployeeSalary
   --   ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

   
	  
--   SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--   FROM SQLTutorial.dbo.EmployeeDemographics
--   inner JOIN SQLTutorial.dbo.EmployeeSalary
--      ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName <> 'Michael'
--ORDER BY Salary DESC


	  
--   SELECT Jobtitle, Salary
--   FROM SQLTutorial.dbo.EmployeeDemographics
--   inner JOIN SQLTutorial.dbo.EmployeeSalary
--      ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE Jobtitle = 'Salesman'



	  
--   SELECT Jobtitle, AVG(Salary)
--   FROM SQLTutorial.dbo.EmployeeDemographics
--   inner JOIN SQLTutorial.dbo.EmployeeSalary
--      ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE Jobtitle = 'Salesman'
--GROUP BY Jobtitle

--topic union, union all



--CREATE TABLE WareHouseEmployeeDemographics
--(EmployeeID INT, FirstName varchar(50),LastName varchar(50),Age int, Gender varchar (50)
--)


--INSERT INTO WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', null, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')


   --SELECT*
   --FROM SQLTutorial.dbo.EmployeeDemographics


   --SELECT*
   --FROM SQLTutorial.dbo.WarehouseEmployeeDemographics

   

   --SELECT*
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --FULL OUTER JOIN SQLTutorial.dbo.WarehouseEmployeeDemographics
   --    ON EmployeeDemographics.EmployeeID = WarehouseEmployeeDemographics.EmployeeID



	   
   --SELECT*
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --UNION
   --SELECT*
   --FROM SQLTutorial.dbo.WarehouseEmployeeDemographics


   
   --SELECT*
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --UNION ALL
   --SELECT*
   --FROM SQLTutorial.dbo.WarehouseEmployeeDemographics
   --ORDER BY EmployeeID


   --SELECT EmployeeID, FirstName, Age
   --FROM SQLTutorial.dbo.EmployeeDemographics
   --UNION 
   --SELECT EmployeeID, JobTitle, Salary
   --FROM SQLTutorial.dbo.EmployeeSalary
   --ORDER BY EmployeeID

   --topic case statement

   --SELECT FirstName, LastName, Age
   --from SQLTutorial.dbo.EmployeeDemographics
   --WHERE Age is not null


   
   --SELECT FirstName, LastName, Age,
   --CASE
   --    WHEN Age > 30 THEN 'Old'
	  -- ELSE 'Young'
   --END
   --from SQLTutorial.dbo.EmployeeDemographics
   --WHERE Age is not null
   --ORDER BY Age

   --SELECT FirstName, LastName, Age,
   --CASE
   --    WHEN Age > 30 THEN 'Old'
	  -- WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	  -- ELSE 'Baby'
   --END
   --from SQLTutorial.dbo.EmployeeDemographics
   --WHERE Age is not null


   
   --SELECT FirstName, LastName, Age,
   --CASE
   --    WHEN Age > 30 THEN 'Old'
	  -- WHEN Age = 38 THEN 'Stanley'
	  -- ELSE 'Baby'
   --END
   --from SQLTutorial.dbo.EmployeeDemographics
   --WHERE Age is not null

   
   --SELECT FirstName, LastName, Age,
   --CASE
   --    WHEN Age = 38 THEN 'Stanley'
   --    WHEN Age > 30 THEN 'Old'
	  -- ELSE 'Baby'
   --END
   --from SQLTutorial.dbo.EmployeeDemographics
   --WHERE Age is not null



  --SELECT *
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID 


  
  --SELECT   FirstName, LastName, JobTitle, Salary
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID


  
  --SELECT   FirstName, LastName, JobTitle, Salary,
  --CASE
  --    WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	 -- WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	 -- WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	 -- ELSE Salary + (Salary * .03)
	 -- END AS SalaryAfterRaise
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID


  
  --topic Having clause
  
  --SELECT *  
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID


  
  --SELECT JobTitle, COUNT(JobTitle)
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID
  --GROUP BY JobTitle


  
  --SELECT JobTitle, COUNT(JobTitle)
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID
  --WHERE COUNT(JobTitle) > 1
  --GROUP BY JobTitle


  
  --SELECT JobTitle, COUNT(JobTitle)
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID
  --HAVING COUNT(JobTitle) > 1
  --GROUP BY JobTitle


  
  --SELECT JobTitle, COUNT(JobTitle)
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID
  --GROUP BY JobTitle
  -- HAVING COUNT(JobTitle) > 1


   
  --SELECT JobTitle, AVG(Salary)
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID
  --GROUP BY JobTitle
  --order by avg(Salary)


  
  --SELECT JobTitle, AVG(Salary)
  --FROM SQLTutorial.dbo.EmployeeDemographics
  --JOIN SQLTutorial.dbo.EmployeeSalary
  --    ON EmployeeDemographics.EmployeeID =EmployeeSalary.EmployeeID
  --GROUP BY JobTitle
  --HAVING AVG(Salary) > 45000
  --ORDER BY AVG(Salary)


  -- UPDATIND AND DELETING TABLE

  --SELECT*
  --FROM SQLTutorial.dbo.EmployeeDemographics
  
  --UPDATE SQLTutorial.dbo.EmployeeDemographics
  --SET EmployeeID = 1012
  --WHERE FirstName = 'Holly' AND LastName = 'Flax'


  
  --UPDATE SQLTutorial.dbo.EmployeeDemographics
  --SET Age = 31, Gender = 'Female'
  --WHERE FirstName = 'Holly' AND LastName = 'Flax'


  --DELETE FROM SQLTutorial.dbo.EmployeeDemographics
  --WHERE EmployeeID = 1005


  ----TOPIC ALIAS
  --SELECT FirstName AS Fname
  --FROM [SQLTutorial].[dbo].[EmployeeDemographics]  

  
  --SELECT FirstName + ' ' + LastName
  --FROM [SQLTutorial].[dbo].[EmployeeDemographics]


  --SELECT FirstName + ' ' + LastName AS FullName
  --FROM [SQLTutorial].[dbo].[EmployeeDemographics]

  
  --SELECT FirstName AS Fname
  --FROM [SQLTutorial].[dbo].[EmployeeDemographics]

  
  --SELECT AVG(Age) AS AvgAge
  --FROM [SQLTutorial].[dbo].[EmployeeDemographics]


  
  --SELECT Demo.EmployeeID,  Sal.Salary
  --FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo
  --join [SQLTutorial].[dbo].[EmployeeSalary] AS Sal
  --   ON Demo.EmployeeID = Sal.EmplopyeeID

	 -- SELECT Sal.EmployeeID
  --    from [SQLTutorial].[dbo].[EmployeeSalary] AS Sal

	  
  --SELECT Demo.EmployeeID,  Sal.Salary
  --FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo
  --join [SQLTutorial].[dbo].[EmployeeSalary] AS Sal
  ----   ON Demo.EmployeeID = Sal.EmployeeID



  --SELECT a.EmployeeID, a.FirstName, a.FirstName, b.JobTitle, c.Age
  --FROM [SQLTutorial].[dbo].EmployeeDemographics a
  --LEFT JOIN [SQLTutorial].[dbo].EmployeeSalary b
  --   ON a.EmployeeID = b.EmployeeID
  -- LEFT JOIN [SQLTutorial].[dbo].WareHouseEmployeeDemographics c
  --   ON a.EmployeeID = c.EmployeeID



 --SELECT Demo.EmployeeID, Demo.FirstName, Demo.FirstName, Sal.JobTitle, Ware.Age
 -- FROM [SQLTutorial].[dbo].EmployeeDemographics Demo
 -- LEFT JOIN [SQLTutorial].[dbo].EmployeeSalary Sal
 --    ON Demo.EmployeeID = Sal.EmployeeID
 --  LEFT JOIN [SQLTutorial].[dbo].WareHouseEmployeeDemographics Ware
 --    ON Demo.EmployeeID = Ware.EmployeeID



-- topic Partition BY


--SELECT*
--FROM SQLTutorial..EmployeeDemographics


--SELECT*
--FROM SQLTutorial..EmployeeSalary



--SELECT*
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--   ON dem.EmployeeID = sal.EmployeeID


--SELECT FirstName, LastName, Gender, Salary,
--  COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--   ON dem.EmployeeID = sal.EmployeeID



--SELECT FirstName, LastName, Gender, Salary,COUNT(Gender)
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--   ON dem.EmployeeID = sal.EmployeeID
--GROUP BY FirstName, LastName, Gender, Salary



--SELECT Gender, COUNT(Gender)
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--   ON dem.EmployeeID = sal.EmployeeID
--GROUP BY Gender


--TOPIC CTEs

--WITH CTE_Employee as
--(SELECT FirstName, LastName, Gender, Salary
-- , COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
-- , AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
--FROM SQLTutorial..EmployeeDemographics emp
--JOIN SQLTutorial..EmployeeSalary sal
--   ON emp.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000'
--)
--SELECT*
--FROM CTE_Employee



--WITH CTE_Employee as
--(SELECT FirstName, LastName, Gender, Salary
-- , COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
-- , AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
--FROM SQLTutorial..EmployeeDemographics emp
--JOIN SQLTutorial..EmployeeSalary sal
--   ON emp.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000'
--)
--SELECT FirstName, AvgSalary
--FROM CTE_Employee



--TOPIC Temp Table

--CREATE TABLE #temp_Employee(
--EmployeeID INT,
--JobTitle varchar(100),
--Salary int )
 
 --SELECT *FROM #temp_Employee

 --INSERT INTO #temp_Employee VALUES
 --('1001', 'HR', '45000')


 --INSERT INTO #temp_Employee 
 --SELECT *
 --FROM SQLTutorial..EmployeeSalary




 --CREATE TABLE #Temp_Employee2
 --(JobTitle varchar (50),
 --EmployeePerJob int,
 --AvgAge int,
 --AvgSalary int)


 --INSERT INTO #Temp_Employee2
 --SELECT JobTITLE, COUNT(JobTitle), AVG(Age), AVG (Salary)
 --FROM SQLTutorial..EmployeeDemographics emp
 --JOIN SQLTutorial..EmployeeSalary sal
 --  ON emp.EmployeeID = sal.EmployeeID
 --GROUP BY JobTitle

 --SELECT * FROM #Temp_Employee2


 -- CREATE TABLE #Temp_Employee2
 --(JobTitle varchar (50),
 --EmployeePerJob int,
 --AvgAge int,
 --AvgSalary int)


 --INSERT INTO #Temp_Employee2
 --SELECT JobTITLE, COUNT(JobTitle), AVG(Age), AVG (Salary)
 --FROM SQLTutorial..EmployeeDemographics emp
 --JOIN SQLTutorial..EmployeeSalary sal
 --  ON emp.EmployeeID = sal.EmployeeID
 --GROUP BY JobTitle

 --SELECT * FROM #Temp_Employee2


 --DROP TABLE IF EXISTS #Temp_Employee2
 --  CREATE TABLE #Temp_Employee2
 --(JobTitle varchar (50),
 --EmployeePerJob int,
 --AvgAge int,
 --AvgSalary int)


 --INSERT INTO #Temp_Employee2
 --SELECT JobTITLE, COUNT(JobTitle), AVG(Age), AVG (Salary)
 --FROM SQLTutorial..EmployeeDemographics emp
 --JOIN SQLTutorial..EmployeeSalary sal
 --  ON emp.EmployeeID = sal.EmployeeID
 --GROUP BY JobTitle

 ----SELECT * FROM #Temp_Employee2

 
 --TOPIC STRING FUNCTIONS - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower


 --DROP TABLE EmployeeErrors;

 
--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

--SELECT* FROM EmployeeErrors

--using trim, ltrim, rtrim

--SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
--FROM EmployeeErrors


--SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
--FROM EmployeeErrors


--SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
--FROM EmployeeErrors


--REPLACE

--SELECT LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
--from EmployeeErrors


--SUBSTRING

--SELECT SUBSTRING (FirstName,1,3)
-- from EmployeeErrors

 
--SELECT SUBSTRING (FirstName,3,3)
-- from EmployeeErrors


--Alex and Alexander same person


--SELECT err.FirstName, dem.FirstName
-- from EmployeeErrors err
-- JOIN EmployeeDemographics dem
--     ON err.FirstName = dem.FirstName



--Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3) 
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	



--Select err.FirstName, Substring(err.FirstName,1,3), dem.FirstName, Substring(dem.FirstName,1,3) 
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)

-- do it on gender last name age DOB



--UPPER and lower


--SELECT FirstName, LOWER(FirstName)
--from EmployeeErrors




--SELECT FirstName, UPPER(FirstName)
--from EmployeeErrors



------STORED PROCEDURES


----CREATE PROCEDURE TEST
----AS
----SELECT*
----FROM EmployeeDemographics


----EXEC TEST



----CREATE PROCEDURE Temp_Employee
----AS
----DROP TABLE IF EXISTS #temp_employee
----Create table #temp_employee (
----JobTitle varchar(100),
----EmployeesPerJob int ,
----AvgAge int,
----AvgSalary int
----)


----Insert into #temp_employee
----SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
----FROM SQLTutorial..EmployeeDemographics emp
----JOIN SQLTutorial..EmployeeSalary sal
----	ON emp.EmployeeID = sal.EmployeeID
----group by JobTitle

----Select * 
----From #temp_employee


----EXEC Temp_Employee





----CREATE PROCEDURE TEST
----AS
----SELECT*
----FROM EmployeeDemographics


----EXEC TEST



------CREATE PROCEDURE Temp_Employee
------AS
------DROP TABLE IF EXISTS #temp_employee
------Create table #temp_employee (
------JobTitle varchar(100),
------EmployeesPerJob int ,
------AvgAge int,
------AvgSalary int
------)


------Insert into #temp_employee
------SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
------FROM SQLTutorial..EmployeeDemographics emp
------JOIN SQLTutorial..EmployeeSalary sal
------	ON emp.EmployeeID = sal.EmployeeID
------group by JobTitle

------Select * 
------From #temp_employee


------EXEC Temp_Employee


------ALTER

----CREATE PROCEDURE Temp_Employee
----AS
----DROP TABLE IF EXISTS #temp_employee
----Create table #temp_employee (
----JobTitle varchar(100),
----EmployeesPerJob int ,
----AvgAge int,
----AvgSalary int
----)


----Insert into #temp_employee
----SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
----FROM SQLTutorial..EmployeeDemographics emp
----JOIN SQLTutorial..EmployeeSalary sal
----	ON emp.EmployeeID = sal.EmployeeID
----group by JobTitle

----Select * 
----From #temp_employee


----EXEC Temp_Employee @JobTitle = 'Salesman'



----SUBQUERIES (in the select, From, and Where Statement)


--Select *
--From EmployeeSalary


----subquery in select


--Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) AS ALLAvgSalary
--From EmployeeSalary




-- How to do it with Partition By

--Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
--From EmployeeSalary


-- Why Group By doesn't work

--Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
--From EmployeeSalary
--Group By EmployeeID, Salary
--order by EmployeeID



-- Subquery in From

--Select a.EmployeeID, AllAvgSalary
--From 
--	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
--	 From EmployeeSalary) a
--Order by a.EmployeeID



-- Subquery in Where


--Select EmployeeID, JobTitle, Salary
--From EmployeeSalary
--where EmployeeID in (
--	Select EmployeeID 
--	From EmployeeDemographics
--	where Age > 30)



  


