-- DataType
-- int (4 byte) 2**32
use regex1;
create table vijay1(id bigint unsigned);
insert into vijay1 values(1844674407370955161);

select * from vijay1;

-- tiny int (1 byte)
-- small int (2 byte) 	medium byte (3 byte)
-- big int (2**64)

-- drop table vijay1;

-- CHAR

create table vijay2(name char(10));
insert into vijay2 values('abc');
insert into vijay2 values('abc		');	-- char, last white space truncate
insert into vijay2 values('a	bc');
select name, char_length(name) from vijay2;

select length('hey abc'), char_length('hey abc');
-- length => byte
-- char_length => Total

-- VARCHAR

create table vijay3(name varchar(10)	);
insert into vijay3 values('abc');
insert into vijay3 values('abc		');	-- char, truncate upto the size of column
insert into vijay3 values('a	bc');
select name, char_length(name) from vijay3;


-- DATE

create table vijay4(dob date);
insert into vijay4 values(curdate() );
insert into vijay4 values('2026-01-30');	-- yyyy-mm-dd
insert into vijay4 values('2021-13-30');		-- incorrect
insert into vijay4 values( now() );
select * from vijay4;


create table vijay5(dob  timestamp );
insert into vijay5 values(now());
select * from vijay5;

-- create table vijay1( do --);
-- insert into vijay1 values ( curdate());

create table vijay6(salary float );
insert into vijay6 values(10.2),(20.123456789);
select * from vijay6;


create table vijay7(salary double (5,2) );
insert into vijay7 values(10.2);
insert into vijay7 values(10.234);		-- 4 is truncate
insert into vijay7 values(103.21);
insert into vijay7 values(103.54352 );
select * from vijay7;


