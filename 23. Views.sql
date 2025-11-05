use sakila;
select first_name, film_id from actor  join film_actor where actor.actor_id=film_actor.film_id;

-- complex query view
create view v_actor as
select first_name, film_id from actor join film_actor where actor.actor_id=film_actor.filmfilm_id;

select * from v_actor;

-- view for specific column (Security)
create view v_first as
select first_name from actor;

select * from v_first;

-- CTAS (create table as select)
create table vijay001 as
select * from actor where actor_id between 2 and 5;

create view v_vijay
as select actor_id, first_name from vijay001;

select * from v_vijay; 

create view v_vijay		-- updatable
as select actor_id , first_name from vijay001;

select * from v_vijay;
SET SQL_SAFE_UPDATES = 0;
update v_vijay set first_name='xyz';

select * from vijay001;


-- Intreviw Question
-- What is difference betwwen Materialized View and Non-Materialized View

-- Materialized View
-- Stores the actual data (physical storage)
-- Faster performance (reads stored result)
-- Needs manual or scheduled refresh to get updated data
-- Uses more storage space
-- Good for large & complex queries / data warehouses

-- Non-Materialized View (Normal View)
-- Stores only query, not the data (virtual table)
-- Always shows real-time data
-- Performance may be slower (fetches data every time)
-- No extra storage required
-- Good for live transactional systems
