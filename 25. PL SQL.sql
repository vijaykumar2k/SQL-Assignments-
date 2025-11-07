-- PL/SQL 
-- it is stand for Procedural SQL 
-- it is an extention of original SQL
-- we can apply more advance logical query 


-- Features
-- Block structure
-- Integration with SQL
-- Procedural capabilities
-- Cursors support
-- Exception handling
-- Modular programming
-- High security
-- Better performance
-- Portability
-- Supports triggers


-- Procedures
-- mysql stored procedure is a set of pre-compiled sql statements stored within the database
-- Improving performance by reducing network traffic and enhancing security by controlling access to data


-- PL/SQL are 3 blocks:
-- 1). Declartion Block :
-- 2). Executable Block ( begin end )
-- 3). Exception Block 

-- Set server output on

use sakila;
DELIMITER $$

CREATE PROCEDURE GetCustomers1()
BEGIN
	SELECT * FROM sakila.actor;    
END$$
DELIMITER ;

call getcustomers1();		-- procedure


-- Summary
-- 1. A stored procedure is a wrapper of a set of SQL 
-- statements stored in the MySQL database server.

-- 2. The advantages of stored procedures include reduced network traffic, 
-- enhanced code reusability, improved security through controlled access, 
-- streamlined implementation of business logic, 
-- and the ability to grant specific privileges to applications
-- without exposing underlying database structures.

-- 3. The disadvantages of stored procedures include increased memory
-- usage for each connection, challenges in debugging due to a lack of dedicated tools, and 
-- the necessity for a specialized skill set, which not all application developers may possess,
-- leading to potential difficulties in both development and maintenance processes.


use sakila;
DELIMITER #

CREATE PROCEDURE GetCustomers2()
BEGIN
	SELECT * FROM sakila.actor where aactor_id=1;    
END#
DELIMITER ;

call 


-- Introduction to MySQL stored procedure parameters 
-- 1. IN parameters 
-- IN is the default mode. When defining an IN parameter in a stored procedure,
-- the calling program must pass an argument to the stored procedure.
 
-- 2. OUT parameters 
-- The value of an OUT parameter can be modified within the stored procedure,
-- and its updated value is then passed back to the calling program.

-- 3. INOUT parameters 
-- An INOUT  parameter is a combination of IN and OUT parameters.
-- This means that the calling program may pass the argument,
-- and the stored procedure can modify the INOUT parameter and
-- pass the new value back to the calling program.

-- IN

DELIMITER //

CREATE PROCEDURE Getp2( IN eid int)
BEGIN
	SELECT * FROM sakila.actor where actor_id=eid;    
END//
DELIMITER ;

call GetP2(5);

-- OUT

DELIMITER //

CREATE PROCEDURE GetP3( IN eid int, OUT ename varchar(20))
BEGIN
	SELECT first_name into ename FROM sakila.actor where actor_id=eid;    
END //
DELIMITER ;

call GetP3(5, @ename);
select @ename;

call GetP3(7, @ename);
select @ename;

select * from sakila.actor where first_name=@ename;



-- INOUT

DELIMITER //

CREATE PROCEDURE GetP5( INOUT var int)
BEGIN
	SELECT count(*) into var FROM sakila.actor where actor_id<var and actor_id>2;    
END //
DELIMITER ; 

-- created variable
set @var=9;
call GetP5(@var);
select @var;