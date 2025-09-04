use regex1;

select * from employees;

select * from departments;

select deptid, avg(salary) from employees where deptid=2;
select * from employees where deptid=2 and salary>60000;

select * from employees;
-- Method 1 [Correleted Query]
select empid, empname, salary, deptid from employees as oute
where salary >
	(select avg(salary) from employees as inn where inn.deptid=oute.deptid);
    
    
-- Method 2 [Common Table Experssion CTE]

with xyz as
(
select deptid, avg(salary) as dsalary from employees group by deptid
)
select e.empname, e.salary, xyz.dsalary
 from xyz join employees as e where e.deptid=xyz.deptid and e.salary>xyz.dsalary;
 
 
 
 
 use sakila;
 select * from actor;



