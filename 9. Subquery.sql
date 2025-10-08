-- Subquery subquery is the first thing then be exicuted
-- Advantages of Subqueries
-- 1. Readbility And Modularity
-- 2. Flexibility
-- 3. Allternative to Joins

use sakila;

select * from actor;
select first_name from actor where actor_id=5;

select * from actor where first_name='ED';

select * from actor where first_name=(select first_name from actor where actor_id=5);

select amount from payment where payment_id=14;

select * from payment where amount=7.99;

select * from payment where amount =(select amount from payment where payment_id=14);

select * from payment;

-- get the payment id amount and payment date where the amount of rental id 1476 k equal ho

select amount from payment where rental_id = 1476;

select * from payment where amount = (select amount from payment where rental_id = 1476);


-- get the payment id ammount and payment date where the month of the table is equals to the month payment id 4


select month(payment_date) from payment where payment_id = 4;

select * from payment where month (payment_id) = 6;

select * from payment where
month(payment_date) =(select month(payment_date) from payment where payment_id = 4);


select * from payment;

-- >  ,> ,<, <=, !=
-- scaler subquery [when a subquery return only 1 row]

-- get the payment id and amount from the table where the amount is equals to the max amount from the table 

select max(amount) from payment;

select payment_id, amount from payment where amount=11.99;

select payment_id, amount from payment where amount=(select max(amount) from payment);