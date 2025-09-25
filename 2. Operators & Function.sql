use sakila;
select * from actor;
select actor_id from actor;
select actor_id, actor_id+4 from actor;

select * from actor where actor_id=4;

select * from actor where actor_id>4 and first_name='JOE';

select * from actor where actor_id between 5 and 9;

select * from actor where actor_id=4 or actor_id=10;

select * from actor where actor_id in (4,10);


-- Like Operator (Pattern ke according data filter)

select * from actor where first_name='N';

-- % (Wildcard Character) : Zero or more character
select * from actor where first_name like 'S%';

select * from actor where first_name like '%S';

select * from actor where first_name like 'S%T';

select * from actor where first_name like '%S%';

-- ( _ ) : exactly 1 character

select * from actor where first_name like 'E_';
select * from actor where first_name like 'A__%';

select * from actor where first_name like '_A%';


-- Q. Get the actor id first name where the last two word should be TE
-- Q. where the latter LL should be present in the middle
-- Q. get the 1st and last name where the last name column the fissrt word is berry first word B last word R
-- Q. get the user information where the first name you have minum four character 
-- Q. get all the column where the actor id is from 2 to 19 and the first name S shoulde be in the middle and H should be the last character  


SELECT actor_id, first_name FROM actor WHERE first_name LIKE '%TE';

SELECT actor_id, first_name FROM actor WHERE first_name LIKE '%LL%';

select first_name, last_name from actor where last_name like 'b%r_';

select * from actor where first_name like '____%';

select * from actor where actor_id between 2 and 90 and first_name like '_%S%A_';

