-- DQL (Data Query Language)
select 'Vijay' as student_name;
show tables;
use sakila;
-- select col1, col2 from tbn (table name);
describe customer;
select customer_id, first_name, email from customer;
select * from customer;


-- Arthmatic Operators -- + - * / // % **
select 12+3 as addition;
select 12-3 as substraction;
select 12*3 as multiplication;
select 12%3 as modules;
select 12/3 as division;
-- select 12//3 as div1;       -- it is not allowed
-- select 2**3 as power;       -- it is not allowed

select customer_id+1, first_name,email from customer;

-- Logical Operator 
-- AND OR NOT -- It helps us to perform on boolean values
-- For and Operator
-- C1| C2| AND | OR | NOT

select * from customer where customer_id=1;
select * from customer;
select * from customer where store_id=1 and active =0;
select * from customer where store_id=1 or active =0;
select * from customer where not (store_id=2 or store_id=1);

show tables;
select * from film_actor;
select * from film_actor where film_id=3 or film_id=47;
select * from film_actor where actor_id=1 and film_id=23;
