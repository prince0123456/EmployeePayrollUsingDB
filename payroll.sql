---Creating database---
CREATE DATABASE PayrollService;

---Creating Table---
CREATE TABLE EmployeePayroll
(
ID INT IDENTITY(1,1) PRIMARY KEY,
NAME VARCHAR(200),
SALARY FLOAT,
STARTDATE DATE
);

---Inserting Values into table---
INSERT INTO EmployeePayroll VALUES('Vijay',25000,'2020-03-04'),
('Rohit',80000,'2020-07-06'),
('Geetha',74000,'2020-05-26'),
('Rohit',80000,'2020-02-05'),
('Rohit',80000,'2021-08-13');

---DELETE FROM EmployeePayroll WHERE NAME='Rohit'---
---SELECT *FROM EmployeePayroll---
---INSERT INTO EmployeePayroll VALUES('Rohit',80000,'2020-02-05'),---
---('Sparsha',40000,'2021-08-13'),---
---('Nidhi',60000,'2022-01-01');---
---SELECT *FROM EmployeePayroll---
---Geting data from table---
SELECT *FROM EmployeePayroll;

---Reading employee from table---
SELECT *FROM EmployeePayroll WHERE NAME='Rohit'
SELECT *FROM EmployeePayroll WHERE STARTDATE BETWEEN '2000-02-01' AND '2023-01-01';



---Adding New coulumn to the table called gender---
ALTER TABLE EmployeePayroll ADD GENDER CHAR(1);
UPDATE EmployeePayroll SET GENDER='M' WHERE NAME='Rohit'
UPDATE EmployeePayroll SET GENDER='M' WHERE NAME='VijaY'
UPDATE EmployeePayroll SET GENDER='F' WHERE NAME='NidhI'
UPDATE EmployeePayroll SET GENDER='F' WHERE NAME='Geetha'
UPDATE EmployeePayroll SET GENDER='F' WHERE NAME='Sparsha'
SELECT *FROM EmployeePayroll;

---Finding sum,average,max,min---
select sum(SALARY) from EmployeePayRoll 
select sum(SALARY) as Totalsalary from EmployeePayRoll 
select sum(SALARY) from EmployeePayRoll group by GENDER;
select sum(SALARY) as Totalsalary,GENDER from EmployeePayRoll group by GENDER;
select max(SALARY) as Totalsalary,GENDER from EmployeePayRoll group by GENDER;
select * from EmployeePayRoll where SALARY=(select Max(SALARY) as totalsalary from employeepayroll where GENDER='F' )
select * from EmployeePayRoll where SALARY=(select Max(SALARY) as totalsalary from employeepayroll where GENDER='M' )
select * from EmployeePayRoll where SALARY in (select Max(SALARY) as totalsalary from employeepayroll group by GENDER)
select name,SALARY,GENDER from EmployeePayRoll where SALARY in (select Max(SALARY) as totalsalary from employeepayroll group by GENDER)
select name,SALARY,GENDER from EmployeePayRoll where SALARY in (select Min(SALARY) as totalsalary from employeepayroll group by GENDER)
select avg(SALARY) as Totalsalary, GENDER from EmployeePayRoll group by GENDER
select avg(SALARY) as Totalsalary from EmployeePayRoll;

---Extending table---
alter table EmployeePayroll add Phone bigint
alter table EmployeePayroll add Address varchar(250) Not Null default 'Banglore'
alter table EmployeePayroll add Department varchar(200) 

---Renaming Coulumn---
Exec sp_rename 'EmployeePayroll.Salary','BasicPay','COLUMN';
alter table EmployeePayroll add Deductions float,TaxablePay float,IncomeTax float,NetPay float;


---Inserting terrissa part---
Insert Into EmployeePayroll values('Terissa',29546,'2001-02-03','F',783424,'Banglore','Sales',546,29000,2300,26700),
('Terissa',29546,'2001-02-03','F',783424,'Banglore','Marketing',546,29000,2300,26700);

---ER Diagram---
CREATE DATABASE Payroll_Service2
USE Payroll_Service2

--CompanyTable--
Create Table Company
(
CompanyId int primary key identity(1,1),
CompanyName varchar(255)
)
Insert Into Company Values('TCS')
Insert Into Company Values('Wipro')
Insert Into Company Values('Infosys')
select * from Company

--EmployeeTable--
Create Table Employee
(
EmployeeId int primary key identity(101,1),
CompanyId int references Company(CompanyId),
EmployeeName varchar(255),
Gender char(1),
PhoneNo bigint,
EmployeeAddress varchar(255),
StartDate DATE,
)
Insert Into Employee values(1,'Oggy','M',987654321,'Delhi','2021/12/08')
Insert Into Employee values(2,'Terrisa','F',123456789,'Noida','2021/08/12')
Insert Into Employee values(3,'Jack','M',741852963,'Banglore','2021/03/10')
select * from Employee

--DepartmentTable--
Create Table Department
(
DeptId int primary key identity(1001,1),
DeptName varchar(255)
)
Insert Into Department values('Sales')
Insert Into Department values('HR')
Insert Into Department values('Finance')
select * from Department