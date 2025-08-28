use regex1;

-- DataType
-- int (4 byte) 2**32

create table vijay1(id bigint unsigned);
insert into vijay1 values(1844674407370955161);

select * from vijay1;

-- tiny int (1 byte)
-- small int (2 byte) 	medium byte (3 byte)
-- big int (2**64)

-- drop table vijay1;

-- CHAR

create table vijay1(name char(10));
insert into vijay1 values('abc');
insert into vijay1 values('abc		');	-- char, last white space truncate
insert into vijay1 values('a	bc');
select name, char_length(name) from vijay1;

select length('hey abc'), char_length('hey abc');
-- length => byte
-- char_length => Total

-- VARCHAR

create table vijay1(name varchar(10)	);
insert into vijay1 values('abc');
insert into vijay1 values('abc		');	-- char, truncate upto the size of column
insert into vijay1 values('a	bc');
select name, char_length(name) from vijay1;


-- DATE

create table vijay1(dob date);
insert into vijay1 values(curdate() );
insert into vijay1 values('2026-01-30');	-- yyyy-mm-dd
insert into vijay1 values('2021-13-30');		-- incorrect
insert into vijay1 values( now() );
select * from vijay1;
