-- round date
-- string, numeric, date
-- single ror function ( scaler functions)
-- function har row  => output

-- Multi Row Function (Aggregate Function)
use sakila;
select amount, round(amount) from payment; 

select sum(amount), sum(round(amount)) from payment;

select sum(amount), count(amount) from payment;

select count(amount) from payment where amount>5;

select count(payment_id) from payment where payment_id<555;

select count(address_id), count(address2), count(*) from address;
select * from address;

select * from payment;

select max(amount), min(amount), sum(amount), count(amount), avg(amount) from payment;

select distinct amount, payment_id from payment;

select distinct amount, customer_id from payment;

select count(distinct amount), count(amount) from payment;

-- get the payment id and amount for year 2005
-- get the uniqe coustomer who have done the payment in the month of june
-- get the max amount the avg amount and the diff btw mx and avg amount where the amount paymnet is greater then 2$ for the year 2006


select payment_id , amount from payment where year(payment_date)=2005;
select distinct customer_id from payment where month(payment_date) = 6;

select max(amount),avg(amount), max(amount)-avg(amount)
from payment where amount > 2
and year(payment_date) = 2006;
