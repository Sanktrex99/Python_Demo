DROP TABLE EmployeeUK;
CREATE TABLE EmployeeUK (
Employeeid INT, 
FirstName VARCHAR(20),
LastName VARCHAR(20),
Gender VARCHAR(10),
Department VARCHAR(20));
INSERT INTO EmployeeUK VALUES(1, 'Pranaya', 'Rout', 'Male', 'IT');
INSERT INTO EmployeeUK VALUES(2, 'Priyanka', 'Dewangan', 'Female', 'IT');
INSERT INTO EmployeeUK VALUES(3, 'Preety', 'Tiwary', 'Female', 'HR'); 
INSERT INTO EmployeeUK VALUES(4, 'Subrat', 'Sahoo', 'Male', 'HR'); 
INSERT INTO EmployeeUK VALUES(5, 'Anurag', 'Mohanty', 'Male', 'IT'); 
INSERT INTO EmployeeUK VALUES(6, 'Rajesh', 'Pradhan', 'Male', 'HR'); 
INSERT INTO EmployeeUK VALUES(7, 'Hina', 'Sharma', 'Female', 'IT');


DROP TABLE EmployeeUSA;
CREATE TABLE EmployeeUSA (
Employeeid INT, 
FirstName VARCHAR(20), 
LastName VARCHAR(20),
Gender VARCHAR(10), 
Department VARCHAR(20));
INSERT INTO EmployeeUSA VALUES(1, 'James', 'Pattrick', 'Male', 'IT'); 
INSERT INTO EmployeeUSA VALUES(2, 'Priyanka', 'Dewangan', 'Female', 'IT'); 
INSERT INTO EmployeeUSA VALUES(3, 'Sara', 'Taylor', 'Female', 'HR');
INSERT INTO EmployeeUSA VALUES(4, 'Subrat', 'Sahoo', 'Male', 'HR'); 
INSERT INTO EmployeeUSA VALUES(5, 'Sushanta', 'Jena', 'Male', 'HR'); 
INSERT INTO EmployeeUSA VALUES(6, 'Mahesh', 'Sindhey', 'Female', 'HR');
INSERT INTO EmployeeUSA VALUES(7, 'Hina', 'Sharma', 'Female', 'IT');

SELECT * FROM EmployeeUK ORDER BY FirstName ASC;
SELECT * FROM EmployeeUSA ORDER BY FirstName ASC;


WITH OUTER2
AS (
SELECT * FROM EmployeeUSA
UNION ALL 
SELECT * FROM EmployeeUK
)
SELECT * FROM OUTER2 ORDER BY FirstName;

DROP TABLE Employees;
CREATE TABLE Employees (
ID INT PRIMARY KEY,
FullName VARCHAR2(20),
Department VARCHAR(20),
Salary INT);
INSERT INTO Employees Values (1001, 'Sambit', 'IT', 15000); 
INSERT INTO Employees Values (1002, 'Santosh', 'IT', 35000); 
INSERT INTO Employees Values (1003, 'Manoj', 'HR', 15000); 
INSERT INTO Employees Values (1004, 'Rakesh', 'Payroll', 35000); 
INSERT INTO Employees Values (1005, 'Hina', 'IT', 42000); 
INSERT INTO Employees Values (1006, 'Bikash', 'HR', 15000);
INSERT INTO Employees Values (1007, 'Priya', 'HR', 67000); 
INSERT INTO Employees Values (1008, 'Preety', 'Payroll', 67000); 
INSERT INTO Employees Values (1009, 'Priyanka', 'Payroll', 55000); 
INSERT INTO Employees Values (1010, 'Anurag', 'Payroll', 15000);
INSERT INTO Employees Values (1011, 'Rishav', 'HR', 55000);


SELECT * FROM Employees;

SELECT Department, 
COUNT(*) AS "Total_Employees", 
SUM(Salary) AS "Total_Salary", 
ROUND(AVG(SALARY), 2) AS "Average_Salary", 
MIN(SALARY) AS "Minimum_Salary",
MAX(SALARY) AS "Maximum_Salary"
FROM Employees
GROUP BY Department
ORDER BY 3 DESC;


SELECT FullName, 
Department, 
Salary,
COUNT(*) AS "Total_Employees", 
SUM(Salary) AS "Total_Salary", 
ROUND(AVG(SALARY), 2) AS "Average_Salary", 
MIN(SALARY) AS "Minimum_Salary",
MAX(SALARY) AS "Maximum_Salary"
FROM Employees
GROUP BY Department, Salary, FullName
ORDER BY 3 DESC;


SELECT FullName, 
Department, 
Salary,
COUNT(*) AS "Total_Employees", 
SUM(Salary) AS "Total_Salary", 
ROUND(AVG(SALARY), 2) AS "Average_Salary", 
MIN(SALARY) AS "Minimum_Salary",
MAX(SALARY) AS "Maximum_Salary"
FROM Employees
GROUP BY Department, Salary, FullName
ORDER BY 3 DESC;


select * from
(
select FullName, Salary, Department, dense_rank() 
over(PARTITION BY DEPARTMENT order by Salary DESC ) r from Employees
) 
where r=3;

DROP TABLE Employees;
CREATE TABLE Employees (
ID INT PRIMARY KEY,
FullName VARCHAR2(20),
Department VARCHAR(20),
Salary int);
INSERT INTO Employees Values (1001, 'Sambit', 'IT', 15000); 
INSERT INTO Employees Values (1002, 'Santosh', 'IT', 35000); 
INSERT INTO Employees Values (1003, 'Manoj', 'HR', 15000); 
INSERT INTO Employees Values (1004, 'Rakesh', 'Payroll', 35000); 
INSERT INTO Employees Values (1005, 'Hina', 'IT', 42000);
INSERT INTO Employees Values (1006, 'Bikash', 'HR', 15000);
INSERT INTO Employees Values (1007, 'Priya', 'HR', 67000); 
INSERT INTO Employees Values (1008, 'Preety', 'Payroll', 67000); 
INSERT INTO Employees Values (1009, 'Priyanka', 'Payroll', 55000); 
INSERT INTO Employees Values (1010, 'Anurag', 'Payroll', 15000); 
INSERT INTO Employees Values (1011, 'Rishav', 'HR', 55000);

SELECT * FROM Employees;

SELECT * FROM 
   (SELECT FullName,Department, ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary ASC) R FROM Employees)
   WHERE R BETWEEN 1 and 6;


WITH cte_products AS (
    SELECT 
        row_number() OVER(
            ORDER BY SALARY
        ) row_num, 
        FullName, 
        Department
    FROM 
        Employees
)
SELECT * FROM cte_products
WHERE row_num > 0 and row_num <= 5;

DROP TABLE Employee;
CREATE TABLE Employee(
ID INT PRIMARY KEY, 
Code VARCHAR(20),
FullName VARCHAR(20), 
Department VARCHAR2(10),
Salary INT);
INSERT INTO Employee Values (1, 'EMP1001', 'Rakesh', 'IT', 15000);
INSERT INTO Employee Values (2, 'EMP1001', 'Rakesh', 'IT', 15000); 
INSERT INTO Employee Values (3, 'EMP1002', 'Priya', 'HR', 25000);
INSERT INTO Employee Values (4, 'EMP1002', 'Priya', 'HR', 25000);
INSERT INTO Employee Values (5, 'EMP1002', 'Priya', 'HR', 25000); 
INSERT INTO Employee Values (6, 'EMP1003', 'Anurag', 'HR', 35000);
INSERT INTO Employee Values (7, 'EMP1003', 'Anurag', 'HR', 35000);
INSERT INTO Employee Values (8, 'EMP1003', 'Anurag', 'HR', 35000);
INSERT INTO Employee Values (9, 'EMP1003', 'Anurag', 'HR', 35000);

SELECT * FROM Employee;



DELETE FROM Employee 
WHERE ID IN (SELECT ID  FROM (SELECT ID, Code, Rank() Over (Partition by Code Order by ID) r FROM Employee) o WHERE o.r >1 );


SELECT * FROM Employee;