use sakila;
-- Data Function

select now();	-- '2025-07-25 12:13:12'  'yyyy-mm-dd hh-mm-ss'
select sysdate();
select curdate();
select year('2025-07-25 12:13:12');	-- year month hours minutes second day
select month(now());
select day('2025-07-25 12:13:12');
select date('2025-07-25 12:13:12');
select extract(month from now());	-- year month hours second
select extract(year from now());
select first_name,extract(year from create_date) from customer;
select utc_timestamp();
select utc_date();
select utc_time();

select time(create_date) from customer;
select date(create_date) from customer;
select * from customer;
select dayofyear('2006-02-14 22:04:36');
select dayname('2006-02-14 22:04:36');
select dayname(now()) as today_is;
select monthname(crteate_date) as month_name from customer;
select monthname(payment_date) as month_name from payment;
select week('2006-02-14 22:04:36');
select weekofyear('2006-02-14 22:04:36');
select weekday(now());
select dayname(now());
select monthname(now());


-- Arthmatic on Datetime
select adddate(now(),2);
select adddate(now(), interval 10 month);		-- Interval, Value, TimePeriod(Year Month Date)
select adddate(now(),interval 2 year);
select adddate(now(),interval 10 day);

select * from payment;
select subdate(now(),2);
select subdate(now(),interval 2 month);
select datediff(now(),'2006-02-14 22:04:36');
select makedate('2025',2);

-- IF ELSE 

select * from payment;
select min(amount) from payment;  -- max>>11.99 0 to 5 is small 6 to 8 id highy
select staff_id,amount,if(amount<5,'low','high') as category from payment;
select staff_id,amount,case
when amount<=5 then 'low'
when amount>=6 and amount<=8 then 'medium'
else 'highy'
end as category from payment;

use sakila;
create table sales (
    sale_id int primary key,
    product_name varchar(100),
    region varchar(100),
    quantity int,
    price_per_unit decimal(10,2),
    sale_date date
);
insert into sales (sale_id, product_name, region, quantity,price_per_unit,sale_date ) values
(1, 'Mobile', 'North', 10, 200.00, '2023-01-15'),
(2, 'Laptop', 'South', 5, 800.00, '2023-01-20'),
(3, 'Tablet', 'North', 7, 300.00, '2023-02-10'),
(4, 'Mobile', 'East', 12, 190.00, '2023-03-12'),
(5, 'Laptop', 'East', 3, 850.00, '2023-04-18'),
(6, 'Mobile', 'West', 8, 210.00, '2023-05-22'),
(7, 'Tablet', 'South', 6, 320.00, '2023-06-05'),
(8, 'Laptop', 'North', 4, 780.00, '2023-06-20'),
(9, 'Mobile', 'South', 9, 195.00, '2023-07-10'),
(10, 'Tablet', 'West', 5, 310.00, '2023-07-25');




-- Group By

select * from sales;
select product_name,region from sales
group by product_name;
-- Mobile	1000.00
-- Laptop	2430.00
-- Tablet	610.00
select product_name,sum(price_per_unit) from sales
where price_per_unit>300
group by product_name;

 
select product_name, sum(price_per_unit) from sales
group by product_name
having product_name != 'Mobile';