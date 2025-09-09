create database winfunction;

use winfunction;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;

-- Windows Function - Windows Function are also called as Analytical function use to perform calculation on multiple row in realtion to current row
-- in aggrigate function the output of multiple rows are given in single rows but here in Windows Function each row is given with the calculated data (windows of row) 

select avg(saleamount) from employeeSales;			-- 1891.666667

select department, avg(saleamount) from employeeSales group by department;

-- Over - The OVER clause is used with aggregate or analytical (window) functions to define how the function is applied across rows.

select *,
avg(saleamount) over(),
max(saleamount) over(),
min(saleamount) over() from employeeSales;


-- Partition by  is a keyword used inside the over
-- Partition by is divide or seprate the simmilar values like group by

select *, avg(saleamount) over(),
avg(saleamount) over(partition by department)
from employeeSales;

select *, avg(saleamount) over(),
avg(saleamount) over(partition by saledate)
from employeeSales;

select *, avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department, employeename)
from employeeSales;

select *, avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department, saledate)
from employeeSales;


select *, avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department, EmployeeId)
from employeeSales;


select *, avg(saleamount) over(partition by department),
avg(saleamount) over(partition by department)
from employeeSales;

select *, avg(saleamount) over(partition by department),
avg(saleamount) over(partition by saledate)
from employeeSales;


-- Order By - order by is used to perfrom inside the over clouse used to specify the order of gross in each partition
-- order by is used in running, sum, avg question 



select * from employeeSales;

select *,
sum(saleamount) over( order by department) from employeeSales;			-- not use partition by 

select *,
sum(saleamount) over( partition by department order by saleamount) from employeeSales;

select *,
sum(saleamount) over( partition by department order by saleamount desc) from employeeSales;

-- -------------------------------------------- 
use sakila;
select * from payment;

select *,
sum(amount) over( partition by payment_date order by amount) from payment;



