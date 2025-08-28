-- #round truncat, mod, pwr (numeric function)

use sakila;
show tables;
select 10.5, round(10.4), round (10.34,1),round(42.58,-1), round(46.58,-1);

select round(76.52,-2);

select truncate(76.35,1), round(76.35,1), round(76.3,1), mod(13,3), pow(2,3);  -- ex = round(76.35,1); == decimal value ko round krna chata hu      

select floor(5.999999), ceil(2.001);

-- String function, number functions
-- Date Functions
-- get the data from the date

select curtime(), curdate(), current_timestamp(), now();

-- adddate, year, now(),  month, extract , date_format , datediff, (col, 3)
select now(), adddate( now(),20 ),  adddate( now(), interval 2 hour);

select now(), date_format( now(), 'Year is %Y Month is %M %H');

-- month, week
select now(), weekofyear( now() );

-- where clause, operator like , in , between
-- and or not
-- function, string function, number, date (scaler functions) 
-- aggregate functions (multi row functions) max , min average, sum


use sakila;

select count(amount) from payment where amount=2.99;

select count(amount) from payment where amount=0.99;

select amount from payment group by amount;  -- jis column pr group by kiya vahi coloum group by k sath use kr skte ho

select amount, count(amount), count(payment_id) from payment group by amount;

select staff_id,sum(amount) from payment group by staff_id;

select customer_id, sum(amount)from payment group by customer_id;

select customer_id, sum(amount) from payment where customer_id>3 group by customer_id;

select customer_id, sum(amount) from payment group by customer_id
having sum(amount)>100;
