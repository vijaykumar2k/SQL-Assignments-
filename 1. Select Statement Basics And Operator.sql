show databases;		-- will show all databases in mysql

use sakila;			-- use sakila as a database

-- show table to see all table 
show tables;

-- select statement (DQL)     *access all column
select * from actor;

describe actor;		-- will give table info (column, datatype, relationships and more)

select actor_id, first_name from Actor;			-- select statement table it can be any case format

select actor_id, first_name, 
actor_ID, last_name 
from actor;

-- Don't create new column in original data
select actor_id, first_name, Last_name, actor_id*5 from actor;

select * from actor where actor_id=5;

select  * from actor where first_name='NICK';			-- DATA SHOULD BE CASE SENSITIVE

select actor_id, last_name, first_name from actor where LAST_NAME='DAVIS';

-- not equal to
select * from actor where actor_id!=5;
select * from actor where actor_id<>5;

select * from actor where first_name='NICK' and actor_id=44;
select * from actor where first_name='NICK' or actor_id=46;
select * from actor where first_name='NICK' or actor_id!=46;

-- Condition with same
select * from actor where actor_id>=2 and actor_id<=6;
select * from actor where actor_id<2 and actor_id<6; 

select * from actor where actor_id not between 2 and 6;			-- lower to higher (not higher to lower) 

select * from actor where actor_id=2 or actor_id=8 or actor_id=19;
select * from actor where actor_id in (2,8,19);

select * from actor where first_name in ('NICK', 'ED', 'DAVIS');



-- from the actor table get the first name actor whos the last name guiness

SELECT first_name FROM actor WHERE last_name = 'GUINESS';

-- gate the actor id in the fist name where the actor id is from value 3 to 18 or the name should not be ED

SELECT actor_id, first_name FROM actor
WHERE (actor_id BETWEEN 3 AND 18) OR first_name <> 'ED';

-- get the last name actor id and first name where first name is either nick or grace

SELECT last_name, actor_id, first_name
FROM actor WHERE first_name IN ('NICK', 'GRACE');

-- get all the columns where actor id is from 2 to 6 or actor id > 5

SELECT * FROM actor WHERE (actor_id BETWEEN 2 AND 6) OR actor_id > 5;
