use sakila;
DELIMITER //

create procedure p3(in var int)
begin
	select actor_id from sakila.actor where actor_id<var;
    
end //


use sakila;
DELIMITER //

create procedure p4(in var int)
begin
		-- select actor_id from sakila.actor where actor_id<var
    set var=var+1;
    select * from actor where actor_id=var;
    
end //


use sakila;
DELIMITER //

create procedure p5(in var int)
begin
	
    vijay: LOOP
    -- select actor_id from sakila.actor where actor_id<var
    set var=var+1;
    select * from actor where actor_id=var;
    
    IF VAR=14 THEN
		LEAVE VIJAY;
	END IF;
        
	END LOOP;
    
end //




use sakila;
DELIMITER //

create procedure p6(in var int)
begin
	
    vijay: LOOP
    set var=var+1;
    SELECT @var;
    
    IF VAR=14 THEN
		LEAVE VIJAY;
	END IF;
        
	END LOOP;
    
end //




-- MySQL Cursor
-- cursor is a pointer refrence for the memory location where the output of sql quries saves. 

-- two types of cursor
-- 1). Implicity Cursors
-- > FOUND , NOTFOUND , ROWCOUNT , ISOPEN
 
-- 2). Explicity Cursors 

use sakila;
DELIMITER //

create procedure p7(in var int)
begin
	
    vijay: LOOP
    set var=var+1;
    select * from actor where actor_id=5 ;
    
    IF VAR=14 THEN
		LEAVE VIJAY;
	END IF;
        
	END LOOP;
    
end //


DELIMITER $$

-- procedure is created
CREATE PROCEDURE create_email_list (
    IN eid INT,
    OUT email_list TEXT
)
BEGIN
	-- variable to access value from cursor to plsql
    DECLARE done BOOL DEFAULT FALSE;
    DECLARE email_address VARCHAR(100) DEFAULT "";
    
    -- Declare a cursor to select first names from the actor table
    DECLARE cur CURSOR FOR SELECT first_name FROM sakila.actor WHERE actor_id < eid;

    DECLARE CONTINUE HANDLER 
    FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cur;
    
    SET email_list = '';
	
    process_email: LOOP
		-- cur will first row and we insert it into the email_address variable (vijay)
        FETCH cur INTO email_address;
        
        IF done = true THEN 
            LEAVE process_email;
        END IF;
		
        -- Concatenate the name into the list with a semicolon separator
        SET email_list = CONCAT(email_address, ';', email_list);
		-- aman-aditya-vijay-yash-abhishek
    END LOOP;
    
    -- Close the cursor
	CLOSE cur;

END $$

DELIMITER ;







DELIMITER $$

CREATE PROCEDURE create_payment (
    OUT amount_list TEXT
)
BEGIN
    DECLARE amount DECIMAL(5,2);
    DECLARE done BOOL DEFAULT FALSE;

    DECLARE cur CURSOR FOR 
        SELECT amount FROM sakila.payment WHERE payment_id < 10;

    DECLARE CONTINUE HANDLER FOR NOT FOUND 
        SET done = TRUE;

    -- initialize OUT param
    SET amount_list = '';

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO amount;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- concatenate the amount into the list
        IF amount_list = '' THEN
            SET amount_list = CAST(amount AS CHAR);
        ELSE
            SET amount_list = CONCAT(amount_list, '-', amount);
        END IF;

        -- stop early if amount equals 5.99
        IF amount = 5.99 THEN
            LEAVE read_loop;
        END IF;
    END LOOP;

    CLOSE cur;

END $$

DELIMITER ;
