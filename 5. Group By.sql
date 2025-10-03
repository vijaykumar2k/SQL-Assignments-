-- Group By
use sakila;

select * from payment;

select count(payment_id) from payment where customer_id=2;

select count(payment_id) from payment where customer_id=7;

-- group by statment ( grouping similar values)

select customer_id from payment group by customer_id;

select distinct customer_id, count(payment_id) from payment group by customer_id;


-- sum, avg, max, min (Aggregate Function)
select count(customer_id) from payment where customer_id=3;

select customer_id, sum(amount) from payment group by customer_id;

select customer_id, sum(amount), count(customer_id) from payment group by customer_id;

select payment_id, count(*) from payment group by payment_id;

select customer_id, count(customer_id) from payment 
where customer_id >3 group by customer_id;


select customer_id, count(customer_id) from payment group by customer_id;

-- Filter on Aggregate Functions

select customer_id, count(customer_id) from payment
group by customer_id having count(customer_id)>30;

-- 
select amount, count(*), sum(amount) from payment group by amount;

SELECT AMOUNT, COUNT(*) FROM PAYMENT WHERE AMOUNT > 2 GROUP BY AMOUNT
HAVING COUNT(*) > 3000;

SELECT AMOUNT, COUNT(*) AS TOTALCOUNT, SUM(AMOUNT) FROM PAYMENT
 WHERE AMOUNT > 2 GROUP BY AMOUNT
HAVING TOTALCOUNT > 3000;

-- Q1. GET THE STAFF ID AND TOTAL NUMBER OF CUSTOMER SERVED 
-- get the total amount and no. of payment then for each month
-- get the amount and total no. of unique customer whta have done payment for each amount
-- get the no of transaction achieved for each amount for the year 2005 where the number of transactions should be greater than 15


select staff_id, count(customer_id) from payment group by staff_id;

select month(payment_date), sum(amount), count(*) as total_payments
 from payment group by month(payment_date);

select amount, count(distinct customer_id) from payment group by amount;

select count(*) as total_payments, amount from payment where year(payment_date)=2005
group by amount having total_payments > 15;

