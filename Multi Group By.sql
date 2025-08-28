-- Multi Group By
select customer_id,amount, count(amount) from payment group by customer_id;
  
select customer_id,month(payment_Date), count(amount) from payment
	group by customer_id, month(payment_Date);

select customer_id,month(payment_Date), count(amount) from payment
	group by customer_id, month(payment_Date);
    

use sakila;
select * from payment;

select count(payment_id) from payment where staff_id=1 and amount=4.99;
select count(payment_id) from payment where staff_id=1 and amount=0.99;


use sakila;
show tables;
select * from sales;

select product_name, avg(quantity) as avg_quantity from sales group by product_name;

select region, count(distinct product_name) as distinct_products from sales group by region;

select region, product_name, count(product_name) as transcation from sales;

select region from sales group by region having count(distinct product_name)>2;

select sum(quantity) as total_quantity as avg_price from sales where product_name = Mobile;

select year(date) , sum(quantity * price) as total_revenue from sales group by year(date);

select year(date) as year, month(date)as month, sum(quantity * price) as revenue from sales group by year(date), month(date);



use sakila;
show tables;
select * from address;
select count(address_id), count(address2), count(*) from address;

select address2 , address2+50 from address;
