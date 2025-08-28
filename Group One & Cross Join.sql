-- Group One

select distinct product_name from sales;
select * from sales;
select product_name,sum(price_per_unit) from sales
-- select product_name,count(quantity) from sales
group by product_name
having count(quantity)>=3;

select product_name,count(quantity) from sales
where region != 'North'
group by product_name
having product_name='mobile';

-- Joins

select * from customer; 
select * from payment;
--  select * from t1;
--  select * from t2;
--  -- joins
--  select * from t1;
--  select * from t2;
-- select tablename1.colname, table2name.colname from lefttable name
-- nameof join righttable name on left_table.col=righttable.col;
CREATE TABLE t1 (
    id INT,
    name VARCHAR(50)
);

CREATE TABLE t2 (
    id INT,
    salary INT
);

-- select * from t1
-- inner join t2 on t1.id=t2.id;


-- select * from customer;
-- select * from payment;
-- select customer.first_name,sum(payment.amount) from customer
-- inner join payment on customer.customer_id=payment.customer_id
-- group by customer.first_name;

select * from t1;
select * from t2;
select * from customer;
select * from payment;
-- select customer.first_name,(payment.amount) from customer
-- inner join payment on customer.customer_id=payment.customer_id;

-- SELECT * FROM t1 LEFT JOIN t2 ON t1.id = t2.id;


select * from customer;
select * from rental;

select * from customer.first_name,rental.rental_date,payment.amount from customer
left join rental on customer.customer_id=rental.customer_id
left join payment on rental.rental_id=payment.rental_id;

-- find all field there inventary iteams

select film.film_id, film.title, inventory.inventory_id, rental.rental_id from film
left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id order by film.film_id;

-- Cross Join


-- select count(*) as total from t1
-- cross join t2

-- select * from customer;
-- select * from store;
-- select c.first_name,s.store_id from customer c
-- cross join store s
-- where s.store_id=1;

select a.actor_id, a.first_name, a.last_name, l.language_id, l.name as language_name
from actor as a
cross join language as l;
