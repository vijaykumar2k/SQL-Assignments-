-- DDL Statement with Constraints
-- Constraints
-- Rules apply to table -- accurate -- invalid restrict


-- Not Null Constraint
use regex1;

create table test1(id int, salary int not null);
insert into test1 values(10,900);
insert into test1 values(11,null); -- error here


select * from test1;

-- -------------------------------------------------
-- Default Constraint

create table test2(id int default 0, salary int not null);
insert into test2 values(10,900);
insert into test2(salary) values(1881);

select * from test2;

-- ---------------------------------------------
-- Unique Constraint

create table test3(id int , salary int default 100 unique);
insert into test3 values(10,900);
insert into test3 values(11,900); 	-- error here
insert into test3(id) values(1999991);

select * from test3; 

-- -----------------------------------------------------
-- Primary Constraint

create table test4(id int primary key , salary int);
insert into test4 values(10,900);
insert into test4 values(10,90012); -- error here
insert into test3(id) values(null);	-- error here

select * from test4;

-- ------------------------------------------
create table courses1 (course_id int primary key, cname varchar(20));
insert into courses1 values(10, 'DSA'),(11, 'PYTHON');
select * from courses1;


-- Creating Foregin Key Here
create table StudentInfo (sid int primary key,sname varchar(20),
    courseid int,
    foreign key (courseid) references courses1(course_id)
);

insert into StudentInfo values(1, 'Vijay',10);
insert into StudentInfo values(2, 'Aman',11);
insert into StudentInfo values(3, 'Roy',13);

select * from StudentInfo;