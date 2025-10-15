create database regexdb;
use regexdb;

create table test(id int);
insert into test values(10),(11),(10), (null);
select count(*), count(id) from test;

create table test2(id int not null);
insert into test2 values(10),(11),(10);
insert into test2 values(null),(12); -- this will give error


create table test3(id int unique);
insert into test3 values(10),(11),(10);		-- duplicate

create table test4(id int, gender varchar(20));
insert into test4 values(10);
select * from test4;

create table test5(id int, gender varchar(20) default 'male');		-- default
insert into test5(id) values(10);
select * from test5;

create table test6(id int check (id>5), gender varchar(20) default 'male');			-- default
insert into test6(id) values(10);
insert into test6(id) values(3);		-- this will give error
select * from test6;

create table test7(id int check (id>5), gender varchar(20) check (gender in ('male','female') ) );  -- check
insert into test7(id, gender) values(10,'male');
insert into test7(id, gender) values(11,'transgender');
-- this will give error
select * from test7;


create table test8(id int  check (id>5), gender varchar(20),
constraint db_test_gender_chk check (gender in ('male','female') ) );  -- check

insert into test8(id, gender) values(10, 'male');
insert into test8(id, gender) values(11, 'transgender');


create table product(id int primary key, name varchar(50));
insert into product values(1, 'vijay');
insert into product values(2, 'rahul');
insert into product values(1, 'amit');   -- duplicate primary key -> error
insert into product(name) values('sumit');   -- null primary key -> error
select * from product;


create table orders(orders_id int, price int, pid int);
insert into orders values(1981,200,101), (1982,250,102), (1983,275,101), (1984,500,108);
select * from orders;


create table orders2(order_id int, price int, pid int,
 foreign key (pid) references product(pid));
insert into orders2 values(1981,200,101), (1982,250,102), (1983,275,101);
insert into orders2 values(1984,500,108);
select * from orders2;
