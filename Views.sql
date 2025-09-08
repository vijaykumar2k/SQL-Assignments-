/*
Operator
Group by with Aggreate
Alias
Case
Joins (Self Join, Inner Join)
-- Left Join
-- Cross Join/ Cartesion

Table1				Table2
id name				cid aname

table1.id=table2.id

subquery: single row
multi row subquery

correlated

with CTE

in vs exist statement

*/

-- VIEWS -- (VIRTUAL TABLE)
-- TABLE DATA STORE PHYSICALLY

use sakila;
create view temp as(
select first_name, count(*) from actor where actor_id>10
group by first_name order by count(*) desc);

select * from temp;

create view temp2 as
(select first_name, last_name from actor);

select * from temp2;

-- CTAS
create table factors as
(select actor_id, first_name, last_name from actor where actor_id<7);


select * from factors;

create view temp3 as
(select first_name, last_name from actor);

insert into temp3 values("Vijay", "Kumar");

select * from temp3;


create view temp4 as
(select first_name, last_name from factors);

insert into temp4 values("Vijay", "Kumar");

select * from temp4;


create temporary table xyz as						-- temporary table are for session
(select actor_id, first_name, last_name from actor where actor_id<7);

select * from xyz;
select * from actor;

-- Interview Question -- 
-- CTE vs VIEWS vs Temporary Table

-- CTE → Temporary result set only within a single query.
-- VIEW → Saved query stored in the database, reusable anytime.
-- Temporary Table → A table stored temporarily in the database, 
				-- 	 can be used multiple times in a session.
                
