/*
Operators
Function, String, date, numeric, (scaler function)
group by (operation on same set of rows)
	sum, avg, count
    
where and having

normalization:
- 1 nf
- 2 nf => partial dependency
	(non - key at attribute partially on key value)
    1. a. 50
    1. a. 60
    
1. a						1. 50
							1. 60

join
- extract
join. where condition=condition
inner join	on
inner join.	using


left join
right join


natural 
	cross join
    
cross => cartesian join (bekar join)

self join 
employeeid, name, mangerid

table join table2 join table3
where table1.condition=table2.condition and table2.conditon=table3.condition

table join table2. on. condition
join table3. on condition

-- subquery
-- price original (max price)

-- inner query return 1 row
>,< <=,>= 

multi row subquery
in = any
>any,	<any

>all,	<all

exists

where subquery are the independent
subquery is a only run one time then results are outer query
corrrelated query is types of subquery where subquery is dependent subquery 
subquery is executed evry single time based on outer query

constrints
the rules and regulation that will be aplly column
not null
unique
default
check

A Primary Key is a unique identifier for each record in a table.
It cannot contain NULL values.
Each table can have only one primary key.

Foreign Key: A foreign key is a field in one table that refers to the 
primary key in another table. It is used to link two tables and maintain data integrity.


*/

use regexdb;
select * from orders;

