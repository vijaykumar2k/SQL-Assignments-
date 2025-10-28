-- DDL and DML Statements
-- DDL : Data Defination Language
-- Language : Data Defination, Table

-- Create
use regex;

create table t4(id int);	-- create statement -- ddl operation

-- drop
drop table t4;		-- data and table structure both are deleted (we can't undo)

create table t5(id int);

desc t5;
-- DDL (Table structure is changed)
alter table t5 add column name varchar(20);

desc t5;

-- DQL (select, group by, joins, subquery)
alter table t5 drop column id;

select * from t5;
alter table t5 add column eid int primary key;	-- DDL
desc t5;

-- DML (insert, values, group by, delete, merge)
insert into t5 values ('yash',11),('aman',12);
select * from t5;

update t5 set name='vijay';
select * from t5;

SET sql_safe_updates = 0;
update t5 set name='vijay';		-- without condition (all rows are update) 
select * from t5;

update t5 set name='regex' where eid=11;	-- upgrade on condition (use this method)
select * from t5;

-- Delete
-- delete from t5;
delete from t5 where eid=12;	#this can undone (we can undo it)
select * from t5;

-- Truncate (DDL)		-- drop structure + recreate the structure
truncate t5;
select * from t5;

-- DDL (create, drop, alter, truncate)
-- DML : insert, update, delete, merge(mysql support nhi krta)

create table t7 (email varchar(50));
alter table t7 add column rollno int first;
desc t7;
