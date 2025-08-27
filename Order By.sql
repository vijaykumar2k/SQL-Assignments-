use sakila;
select * from customer;

-- Agregate Function min max sum count avg
select max(address_id) as max from customer;
select min(address_id) as max from customer;
select sum(active) as total from customer;
select count(*) as total_records from customer;
select avg(address_id) as average from customer;
select abs(-190) as result;
select ascii('A') as char1;
select abs(1) as result;
select ceil(12.1) as result;
select floor(12.1) as result;
select round(12.9) as result;


-- String Functions
select * from customer;
select concat('Vijay',' Kumar') as name;
select first_name,last_name,concat(first_name,' ',last_name) as fullname from customer;
select left('Vijay', 4) as filter;
select first_name,left(first_name,2) as filter from customer;
select first_name,left(first_name,2) as left_filter , right(first_name,2) as right_filter from customer;
select locate('a','Vijay') as position;
select first_name,locate('a',first_name) as position from customer;
select substr('Vijay',1,3) as filter;
select first_name,substr(first_name,locate("A",first_name)+1,2) as filter from customer;
select trim(' Vijay ') as removed_space;
select ltrim(' Vijay') as remove_space;
select rtrim('    Vijay ') as remove_space;
select replace('ababab','b','_') as replace_b;
select reverse("abcd") as reverse_str;


-- Order by
-- select * from customer
-- order by address_id desc
-- order by active asc;

select * from customer
order by customer_id desc
limit 1 offset 1;

-- select max(customer_id) from customer limit 5;
