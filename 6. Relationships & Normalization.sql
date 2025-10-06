-- Reltionships

-- Super Key, Candidate Key, Primary Key, Composite Key, Foreign Key, 



-- Super Key : A Super Key is any combination of columns in a table that can uniquely identify each row. 
	-- Candidate Key : A Candidate Key is a minimal super key that uniquely identifies a row in a table. One of the candidate keys is chosen as the primary key.
		-- Primary Key : Primary key unique identifier we identity each row in atable uniqe and it canit be null
		    -- Foreign Key : Links two tables together by referencing the Primary Key of another table. It enforces referential integrity.

-- Normalization : Normalization is the process oo organizing data in a database to reduce redundancy 

-- Normalization of Types :

-- 1NF :	each columns contain atomic values
		 -- No repeating groups or arrays in a column
         -- Each record is unique.

-- 2NF :	Already in 1NF
		 -- Every non-key attribute is fully functionally dependent on the primary key
		 -- Removes partial dependency

-- 3NF :	Already in 2NF
		 -- No transitive dependency (non-key column depends on another non-key column)

-- BCNF:	Stronger version of 3NF.
		 -- Every determinant must be a candidate key.
         -- Removes anomalies not handled by 3NF.

create database regex;

use regex;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102),
(998,'bhutan', 110);

-- pid is primary key
select * from product;

-- orderid is primary key, Productid is foreign key that refer to primary key of product table (pid)
select * from orders;

select prd.pid, pname from product as prd;

select ord.productid, ord.city from orders as ord;

select prd.pid, prd.pname, ord.productid, ord.city
from product as prd join orders as ord
where prd.pid=ord.productid;


-- Joins --
 
select product.pid, product.pname, product.price,  orders.city from product
join orders where product.pid=orders.productid and pname = 'iphone';


-- Inner Join : INNER JOIN selects records that have matching values in both tables.


