-- TCL (Transaction Control Language)
-- Transaction - Logical Statement
-- Control / Manage

create database testing;
use testing;
create table xyz(id int, name varchar(20));
insert into xyz values(11, 'aman'), (12, 'user');
select * from xyz;


-- Transaction
/*
transaction start
ddl, dml
transaction end

1) autocommit => disable / write / (start transaction)
2) 
3) end (commit; rollback; ddl statement dcl statement)
*/

start transaction;
insert into xyz values(99, 'vijay');
select * from xyz;
commit;


start transaction;
SET SQL_SAFE_UPDATES = 0;		-- Safe mode disable
delete from xyz;
select * from xyz;
rollback;						-- revert the transaction


start transaction;
insert into xyz values(1912912, 'asdfghjkl');
select * from xyz;


create table yash123(id int);

start transaction;
update xyz set name="xyzzzz";
savepoint vijay_savepoint;
insert into xyz values(123122312390, 'treadfjasdf');
rollback to vijay_savepoint;
select * from xyz;

use testing;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    ManagerID INT NULL,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Alice', NULL),      -- Top-level manager (CEO)
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 1),       -- Reports to Alice
(4, 'David', 2),         -- Reports to Bob
(5, 'Eva', 2),           -- Reports to Bob
(6, 'Frank', 3);         -- Reports to Charlie

select * from employees;


with recursive cte as(
select emp.employeeid, emp.employeename, emp.employeename as managerchain
from employees as emp
where emp.managerid is null)

select * from cte;

-- Alice -> bob

WITH RECURSIVE cte AS (
    -- Base / anchor part (top-level managers)
    SELECT 
        emp.employeeid,
        emp.employeename,
        emp.employeename AS managerchain
    FROM employees AS emp
    WHERE emp.managerid IS NULL
    
    UNION ALL
    
    -- Recursive part (employees under managers)
    SELECT 
        emp.employeeid,
        emp.employeename,
        CONCAT(mgr.managerchain, ' -> ', emp.employeename) AS managerchain
    FROM employees AS emp
    JOIN cte AS mgr 
        ON emp.managerid = mgr.employeeid
)
SELECT * FROM cte;


