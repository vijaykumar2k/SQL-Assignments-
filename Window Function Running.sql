use winfunction;

select * from employeeSales;

insert into employeeSales values(12, 'Alice', 'Developer', '2025-06-10',5000.00);

select *, sum(saleamount) over( partition by employeename) from employeeSales;


-- Running Sum
select *, sum(saleamount) over(order by saleamount) from employeesales;

-- Running sum in each department
select *, sum(saleamount) over( partition by department order by saleamount) from employeesales;

select * from employeesales where sleammount = (select max(saleamount) from employeesales);

-- Second Highest
select max(saleamount) from employeesales where saleamount <
	(select  max(saleamount) from employeesales);
    
-- 3rd Highest
select max(saleamount) from employeesales where saleamount <
	(select max(saleamount) from employeesales where saleamount <
    (select max(saleamount) from employeesales) );
    
    
    
-- Window Function
-- row_number

select *, row_number() over() from employeesales;

select *, row_number() over( partition by department) from employeesales;

select *, rank() over(order by saleamount) from employeesales;

-- rank is windows function which is each row and value 
-- if the 900 - 950 - 950 - 1000

select *, rank() over(order by saleamount) from employeesales;
