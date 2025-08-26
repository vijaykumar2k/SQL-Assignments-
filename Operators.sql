use sakila;
show tables;

select * from customer;


-- 	Operators
-- Arthmetic Operator
-- Logical Operator
-- Relational Operator

select * from customer where customer_id<5;
select * from customer where customer_id !=5;

select * from customer where customer_id<5 and address_id<=20;
select * from customer where customer_id !=5 and address_id<=10;

-- Betweeen
select * from customer where address_id between 5 and 20;

-- IN
select 7 in (1,2,5,7) as result;
select * from customer where address_id in (20,30);

-- NOT IN

select 5 not in (2,3,5,6) as result;
select 6 not in (2,4,45,78);
select * from customer where customer_id not in (1,2,3,4);

select * from customer where customer_id between 10 and 20;
select * FROM customer where customer_id between 1 and 10 and customer_id not in (5, 7);

-------------------------------------------------------------------------------

-- Like
select  * from customer where first_name like 'a%';
select  * from customer where first_name like '%a';
select  * from customer where first_name like '_a';

select * from actor;
select * from actor where first_name like '_D';
select * from actor where first_name like 'E_';
select * from customer where first_name like '__A%';
select * from customer where first_name like '%A%A%';
select * from customer where first_name like '%a%';
select * from customer where first_name like '%aa%';
select * from customer where first_name like 'aa_c%';

select * from customer
limit 5 offset 2;

-- Aggregate function -- sum mul min max avg pow
select count(address_id) from customer;
-- select length(first_name) from customer;
-- select sum(first_name) from customer;
-- select length(first_name) from customer;
-- select count(*) from customer;