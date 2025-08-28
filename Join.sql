use sakila;

create table product(id int, pname varchar(20), amount int);
insert into product values(10, "laptop",199), (11, "TV",200), (12,"Watch", 300);

create table orders(oid int, location varchar(20), productid int);
insert into orders values(10, "jaipur", 10),(889, "pune", 11), (890, "himachal", 15), (891,"j&k",10);

select * from product;
select * from orders;

-- select col, col2..... from table join table2 conditions

select prod.id, prod.pname, prod.amount, ord.productid, ord.oid, ord.location from product as prod
join orders as ord where prod.id=ord.productid;

 
select o.oid, o.location, p.pname from orders as o join product as p
where o.productid=p.id;

select o.oid, o.location, p.pname from orders as o join product as p
on o.productid=p.id;

select o.oid, o.location, p.pname from orders as o inner join product as p
where o.productid=p.id;

use sakila;
select * from Actor;
select * from film_Actor;
desc film_Actor;


use sakila;
select * from film_actor;
select count(film_id), count(distinct film_id) from film_Actor;

desc film;
desc film_Actor;

select f.film_id, f.title, f.release_year, fa.actor_id from film as f
join film_actor as fa
	where f.film_id=fa.film_id;
