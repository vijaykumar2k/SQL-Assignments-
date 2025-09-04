-- Set Operation - 	Set operations are used to combine the results of two or more SELECT queries.


-- UNION -	UNION combines results of two SELECT queries and removes duplicates
use sakila;

select * from actor where actor_id between 1 and 3
union
select * from actor where actor_id between 3 and 5;

-- UNION - UNION ALL combines results of two SELECT queries including duplicates
select * from actor where actor_id between 1 and 3
union all
select * from actor where actor_id between 3 and 5;

-- INTERSECT	--INTERSECT returns only the common rows from two SELECT queries.
select * from actor where actor_id between 1 and 3
INTERSECT
select * from actor where actor_id between 3 and 5;

-- EXCEPT - EXCEPT returns rows from the first query that are not in the second.
select * from actor where actor_id between 1 and 3
EXCEPT
select * from actor where actor_id between 3 and 5;


with recursive cte as
( select 1 as num
union
select num+1 from cte where num<6
)
select * from cte;


--  Factorial

with recursive cte as
( select 1 as i, 1 as factorial
union
select i+1, factorial*(i+1) from cte where i<6
)
select * from cte;



use regex1;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

select * from employees;

with recursive cte as
(select employee_id, name, manager_id, 1 as levels
from employees as e where manager_id is null
union
select etemp.employee_id, etemp.name, etemp.manger_id, levels+1
from employees as etemp join cte where etemp.manager_id=cte.employee_id)
select * from cte;