-- table creation DDL (Data Definition Language), DML (Data Manipulation Language)
use sakila;
-- object -- int, float, double, string [varchar , char]

create table StudentAccess( id int, sname varchar(10));  -- ddl
insert into StudentAccess values (9, 'abc');	-- dml	(method 1) X
insert into StudentAccess(id, sname) values (19, 'abc');	-- method 2
 
 
 -- problem
 insert into StudentAccess values (11);
 
 -- solution
 insert into StudentAccess(id) values (22);
 insert into StudentAccess(sname) values ("vijay");
 select * from StudentAccess;
 
 -- DML (update)
 update StudentAccess set sname ='Raj';
 update StudentAccess set sname ='Abhi' where id=19;
 select * from StudentAccess;
 
 
 delete from StudentAccess where id between 20 and 22;
 
 
 /*
 case
 
 MERGE INTO TargetTable AS T
USING SourceTable AS S
ON T.ID = S.ID
WHEN MATCHED THEN
	UPDATE SET T.Column1 = S.Column2 = S.Column2
WHEN NOT MATCHED BY TARGET THEN
	INSERT ( ID, Column1, Column2 ) VALUES (S.ID, S.Column1, S.Column2)
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;
*/

truncate table StudentAccess;		-- truncate will help you retiain  

-- intreview Question
-- Q. What is the differnce b/w DELETE, DROP and TRUNCATE

	-- DELETE
-- 1. Delete is a Data Manipulation Language
-- 2. Delete the data, base on condition
-- 3. We can roll back opertion
-- 4. Table structure is same 
 
	-- DROP
-- 1. Drop Data Definition Language
-- 2. No condition are applied
-- 3. We cant rollback
-- 4. Table structured is deleted

	-- TRUNCATE
-- 1. Truncate Data Definition Language
-- 2. No condition are applied
-- 3. We cant rollback
-- 4. Table structure is recreated



-- Data Types
use sakila;

create table test18(id tinyint);
insert into test18 values(10);
insert into test18 values(-128);

insert into test18 values(-129);  -- size is smaller  1 byte 2^8 256  ( -128 to 127)

select * from test18;

create table test19(id tinyint unsigned);	-- all number positive ( 255 )
insert into test19 values(10);
insert into test19 values(-128);

-- small int, medium int, int , big int