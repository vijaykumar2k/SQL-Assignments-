use regex;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- VP of Sales
(3, 'Carol', 1),          -- VP of Engineering
(4, 'David', 2),          -- Sales Manager 1
(5, 'Eve', 2),            -- Sales Manager 2
(6, 'Frank', 3),          -- Engineering Manager 1
(7, 'Grace', 3),          -- Engineering Manager 2
(8, 'Heidi', 4),          -- Salesperson under David
(9, 'Ivan', 4),           -- Salesperson under David
(10, 'Judy', 5),          -- Salesperson under Eve
(11, 'Mallory', 6),       -- Engineer under Frank
(12, 'Niaj', 6),          -- Engineer under Frank
(13, 'Olivia', 7),        -- Engineer under Grace
(14, 'Peggy', 7),         -- Engineer under Grace
(15, 'Trent', 3);         -- Tech Lead under Carol (no direct reports)


select * from employees;
use regex;

select emp.employee_id, emp.name, emp.manager_id, manager.employee_id,
manager.name as mgrname from employees as emp
join employees as manager
where emp.manager_id=manager.employee_id;


-- Cross join or cartesian join
-- each row of 1st table is combined with row of another table(m*n)
select p.pid, p.price, o.product, o.city from product as p
cross join orders as o;


-- natural join - is kind of join which word on common column 
select p.pid, p.price, o.product, o.city from product as p
natural join orders as o;

-- changing column name here
alter table orders rename column productid to pid;
select * from orders;

-- common column so workinhg as inner join
select p.pid, p.price, o.product, o.city from product as p
natural join orders as o;

-- no common column so working as cross join
select p.pid, p.price, o.product, o.city from product as p
natural join orders as o;


-- join actor and film-actor (actor_id)
-- join fim_actor and film (film_id)

use sakila;
select a.actor_id, a.first_name,fa.actor_id, fa.film_id, flm.film_id as film, flm.title from actor a
join film_actor as fa join film as flm
where a.actor_id=fa.actor_id and fa.film_id=film.film_id
order by first_name;