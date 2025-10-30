-- Recursive CTE in SQL

-- A Recursive CTE is a Common Table Expression that refers to itself — it repeats execution until a condition is met.
-- It’s useful for hierarchical data, number generation, or tree structures (like employee–manager).

-- create a series of number form 1 to 10.

-- 1
-- 2
-- 3
with recursive cte as(
select 1 as num 	-- base case
union
select num+1 from cte
	where num<10)	-- end case

select * from cte;

use regex;
show tables;

select * from employees ;
select * from employees as eout where salary > (select avg(salary) from employees as ein
where ein.deptid=eout.deptid);

with xyz as(
select deptid, avg(salary) as avgSalary from employees group by deptid)

select * from employees join xyz where employees.deptid=xyz.deptid
and employees.salary> xyz.avgSalary;