create database window_test;

use window_test;

CREATE TABLE employee_sales (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

-- 2. Insert at least 20 sample records
INSERT INTO employee_sales (emp_name, department, sale_amount, sale_date) VALUES
('Alice', 'Electronics', 1200.00, '2025-01-10'),
('Bob', 'Electronics', 950.00, '2025-01-12'),
('Charlie', 'Furniture', 2100.00, '2025-01-15'),
('David', 'Furniture', 1800.00, '2025-01-18'),
('Ella', 'Clothing', 400.00, '2025-01-20'),
('Frank', 'Clothing', 750.00, '2025-01-22'),
('Grace', 'Clothing', 600.00, '2025-01-23'),
('Henry', 'Electronics', 1300.00, '2025-01-24'),
('Isabella', 'Furniture', 2500.00, '2025-01-25'),
('Jack', 'Clothing', 900.00, '2025-01-26'),
('Karen', 'Electronics', 1450.00, '2025-01-28'),
('Leo', 'Furniture', 1900.00, '2025-01-29'),
('Mona', 'Clothing', 500.00, '2025-01-30'),
('Nate', 'Electronics', 1600.00, '2025-02-01'),
('Olivia', 'Clothing', 800.00, '2025-02-02'),
('Peter', 'Furniture', 1700.00, '2025-02-03'),
('Quinn', 'Electronics', 1250.00, '2025-02-04'),
('Rose', 'Clothing', 1000.00, '2025-02-05'),
('Steve', 'Furniture', 2200.00, '2025-02-06'),
('Tina', 'Electronics', 1800.00, '2025-02-07');


select * from employee_sales;



select *, sum(sale_amount) over(partition by  department) from employee_sales;

select *, sum(sale_amount) over(order by  emp_name) from employee_sales;

select *, sum(sale_amount) over(order by  department) from employee_sales;

select *,
sum(sale_amount) over(partition by department order by sale_amount) from employee_sales;

-- Anyalatical Windows Function
-- row_number

select *,
sum(sale_amount) over(partition by department order by sale_amount),
row_number() over(partition by department) from employee_sales;

-- rank
select *, row_number() over(partition by department),
rank() over(order by sale_date) from employee_sales;

select *, row_number() over(partition by department),
rank() over(order by sale_amount) from employee_sales;

update employee_sales set sale_amount=500 where emp_id=7;

select *, row_number() over(partition by department),
rank() over(order by sale_amount) from employee_sales;

select *, row_number() over(partition by department),
rank() over(partition by department order by sale_amount) from employee_sales;

-- dense_rank
select *, row_number() over(partition by department),
rank() over(partition by department order by sale_amount),
dense_rank() over(partition by department order by sale_amount) from employee_sales;




select max(sale_amount) from employee_sales where sale_amount < 
(select max(sale_amount) from employee_sales);

select *, rank() over(order by sale_amount desc) from employee_sales;

select *, dense_rank() over(order by sale_amount desc) from employee_sales;

select * from (select *, dense_rank() over(order by sale_amount desc)
as totalRank from employee_sales) as abc where totalRank=6;

-- Expression (name on temprorary basic)
-- Common table expression
with abc as(
select * from employee_sales where emp_id>3 and sale_amount>200)

select * from abc;

with abc as(
select  *, dense_rank() over (order by sale_amount desc) as totalRank from employee_sales
)
 select * from abc where totalRank=2;


use sakila;
select * from actor;
select * from film_actor;

-- CTE = Showing Temprorary Result 

with film_cte as
(select * from film_actor where actor_id=1
)
select actor.actor_id, film_id from actor join film_cte on actor.actor_id=film_cte.actor_id;



-- Set Operation

select * from actor where actor_id<=3
union
select * from actor where actor_id between 3 and 6;

select * from actor where actor_id<=3
union all
select * from actor where actor_id between 3 and 6;

select actor_id, first_name, last_update from actor where actor_id<=3
union all
select first_name, last_update, actor_id from actor where actor_id between 3 and 6;


