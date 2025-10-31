-- DCL
-- Data Control Language
-- Grant, Revoke

use testing;
create user 'ram' identified by 'ram';


select * from mysql.user;

show grants for 'ram'; 	-- will show privleges

-- Grant Statement
grant all privileges on regex.* to 'ram';

REVOKE all privileges on regex.* FROM 'ram';

-- Only SELECT & INSERT
GRANT SELECT, INSERT ON testing.* TO 'ram';

SHOW GRANTS FOR 'ram';

-- Remove only INSERT permission
REVOKE INSERT ON testing.* FROM 'ram';

SHOW GRANTS FOR 'ram';

GRANT SELECT, UPDATE ON testing.employee TO 'ram';

GRANT ALL PRIVILEGES ON testing.* TO 'ram' WITH GRANT OPTION;

CREATE ROLE 'manager';

GRANT SELECT, INSERT, UPDATE ON testing.* TO 'manager';

GRANT 'manager' TO 'ram';
-- role ko active karna padega
SET DEFAULT ROLE 'manager' TO 'ram';


SHOW GRANTS FOR 'manager';
SHOW GRANTS FOR 'ram';

REVOKE 'manager' FROM 'ram';
