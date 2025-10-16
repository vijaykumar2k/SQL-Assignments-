-- Data Types
-- numeric. => tinyint, smallint, mediumint, int, bigint

use regexdb;
create table vijay1(id tinyint);			# id tinyint unsigned
insert into vijay1 values(10), (-9);
insert into vijay1 values(127);		-- -128 to 127 	(1byte) 2**8
select * from vijay1;

-- smallint.	2 byte


# Float
create table vijay2(id float, id2 double);			# id tiny. int unsigned
insert into vijay2 values(10.12345678, 10.123456789);
select * from vijay2;

# Double
create table vijay3(id2 double(5,2) );			# id tiny. int unsigned
insert into vijay3 values(10.123456789);
insert into vijay3 values(710.123456789);
insert into vijay3 values(1067.123456789);		# give me error
select * from vijay3;

# text/string data type.
create table vijay4(gender char(5) );			# id tiny. int unsigned
insert into vijay4 values( 'abc' );
insert into vijay4 values( 'abcde' );
insert into vijay4 values( 'abcdeffgfdgb' );			-- error
select * from vijay4;

# char_length(gender)
create table vijay5( gender char(5) );			# id tiny. int unsigned
insert into vijay5 values( 'abc' );
insert into vijay5 values( 'abcde' );
insert into vijay5 values( 'abcdeffgfdgb' );			-- error
insert into vijay5 values( 'abc          ' );
select gender, char_length(gender) from vijay5;


# Varchar (Variable Character)
create table vijay6( gender varchar (5) );			# id tiny. int unsigned
insert into vijay6 values( 'abc' );
insert into vijay6 values( 'abc         ' );
select gender, char_length(gender) from vijay6;


# Date Time Table

CREATE TABLE Event (
    id INT,
    event_name VARCHAR(50),
    event_date DATE,
    start_time TIME,
    created_at DATETIME,
    updated_at TIMESTAMP
);

INSERT INTO Event VALUES
(1, 'Conference', '2025-10-16', '10:00:00', '2025-10-10 09:00:00', CURRENT_TIMESTAMP);

select * from event;


