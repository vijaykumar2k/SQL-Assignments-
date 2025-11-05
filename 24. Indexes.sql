-- Indexs

-- What is an Index in MySQL?
-- An Index in MySQL is a database object that improves the speed of
--  data retrieval (SELECT queries) 
-- by helping MySQL find rows faster, just like an index in a book.

-- Types 
-- Clustered Index

use sakila;
create table students(
student_id int,
name varchar(50),
age int
);

insert into students (student_id, name, age)values
(3, 'Alice', 20),
(1, 'Bob', 22),
(5, 'Charlie', 19),
(2, 'David', 21),
(4, 'Eve', 23);

select * from students;

explain select * from students where student_id=2;
alter table students add primary key(student_id);



-- Non - Clustered Index
create table students1(
student_id int,
name varchar(50),
age int
);

insert into students1 (student_id, name, age)values
(3, 'Alice', 20),
(1, 'Bob', 22),
(5, 'Charlie', 19),
(2, 'David', 21),
(4, 'Eve', 23);

select * from students1;

explain select * from students1 where student_id=2;		-- use of index
explain select * from students1 where name="Bob";		-- no index use

create  index idx_student on students1(student_id);  ; -- index created (non - clustered index)
show indexes from students1;

-- Composite Index

create table students2(
student_id int,
name varchar(50),
age int
);

insert into students2 (student_id, name, age)values
(3, 'Alice', 20),
(1, 'Bob', 22),
(5, 'Charlie', 19),
(3, 'David', 21),
(4, 'Eve', 23);

select * from students2;

explain select * from students2 where student_id=2;		-- use of index
explain select * from students2 where student_id=3 and name='Alice';		-- no index use

explain select * from students2 where name='Alice';		-- No index use
create  index idx_student_c on students2(student_id, name);  ; -- Composite index created (non - clustered index)
show indexes from students2;


-- Partial Index
create table students3(
student_id int,
name varchar(50),
age int
);

insert into students3 (student_id, name, age)values
(3, 'Alice', 20),
(1, 'Altlanta', 22),
(5, 'Alien', 19),
(3, 'David', 21),
(4, 'Eve', 23);

select * from students3;

explain select * from students3 where name like 'Al%';
create index idx_student_c on students(name (3) );		-- partial index
explain select * from students2 where name like 'Alice';
