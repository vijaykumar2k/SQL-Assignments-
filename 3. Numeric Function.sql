use sakila;

select first_name, concat("A", first_name), char_length(first_name),
substr(first_name, 2,1) from actor;

-- Trim Function
select char_length( trim('	hey	') );

select char_length( rtrim('		hey	') );


select first_name, replace(first_name,'E','#' ) from actor;

select first_name, lpad(first_name, 5,'@') from actor;

-- Numeric Function
-- Round
select  round(2.5);

select  round(11.2	, 1);			-- only the decimal part

select  round(11.62	, 1);			-- only the decimal part

select  round(11.687	, 2);			-- only the decimal part

select  round(7.627	, 	1);			-- only the decimal part

-- 2<5		=> 0
select  round(2.627	, 	-1);			-- only the integer round off

select  round(246.627	, 	-2);			-- only the integer round off

select  round(546.627	, 	-1);			-- only the integer round off


-- truncate 
 select  round(6546.637	, 	2),truncate(6546.637	,	2);
 
 -- other function
 
select mod(10,2), floor(6.9999999), ceil(4.00002);

-- Most Important Function
-- date functions
-- date pr kaam krne k liye

select current_date(), current_time(), current_timestamp(), now();

-- adddate
select now(), adddate( now(),	40);

select now(), adddate(	now(),	interval 2 month );

select now(), adddate(	now(),	interval -2 day );			-- year

select now(),addtime(	now(),	'02:00:00');

-- year and month
select now(), year( now() ),	last_day( now());

-- extract
select now(), extract( quarter from now());

select now(), date_format( now(), 'Year is %Y, my month is %M');

-- adddate, now,current_time, extract,  year, month, date_format

use sakila;
select payment_date, year(payment_date), extract( month from payment_date),
date_format( payment_date, 'Hour of shopping is %H'),
datediff( payment_date, now() ) from payment;
