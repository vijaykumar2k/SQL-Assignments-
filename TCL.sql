-- TCL (Transaction Control Language)

-- Transaction : Set of logical statement , consistent 
-- Manage Kia Jaye

-- Transaction ( Start/ Stop - End )
-- Transaction ( Commit )
-- Normalization / Alter

select @@autocommit; 
use regex1;
show tables;
select * from courses;
insert into courses values(778,'abc',"Math");

select * from courses;


/*
Transactioon Start:
-- Start Transaction ( Statement)
Or
-- Autocommit is Disabled

DML Operation ( This Operation will temporory when Transaction start )

Transaction Stop:
-- Commit,  Rollback
-- DDl Statement
-- DCl Statement

*/


select @@autocommit;
insert into courses values( 900, 'Vijay', "Vijay Kumar");
update courses set coursename="regex";
select * from courses;

rollback;

insert into courses values (900, 'Vijay', "Vijay Kumar");
select * from courses;
commit;
rollback;


select @@autocommit;
set @@autocommit=1;
start transaction;
insert into courses values (911, "Vijay", "Vijay Kumar1");
create table vijay123(id int);				-- transaction is saved here
select * from courses;


start transaction;
insert into courses values(912, "a", "ab" );
insert into courses values(913, "b", "bd" );
update courses set courses="regex" where courseid=913;
rollback;
select * from courses;



start transaction;
insert into courses values(912, "a", "ab" );
insert into courses values(913, "b", "bd" );
savepoint courses_insert_chk;
update courses set courses="regex" where courseid=913;
rollback to courses_insert_chk;
select * from courses;


-- -----------------------------------------------------------------------

-- DCL (Data Control Language)
-- Authantication And Authorization 

select * from mysql.user;
create user test  identified by 'test123';

create database ecommerce;
use ecommerce;
create table customer( id int, cname varchar(20));
insert into customer values ( 1, "abhi"), (2, "naina");
select * from customer;

grant all privileges on ecommerce.* to vikn;
show grants for vikn;
revoke all privileges on ecommerce.* from vikn;



