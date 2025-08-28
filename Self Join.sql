-- SELF JOIN



CREATE TABLE employees (
  employee_id   BIGINT                PRIMARY KEY,
  employee_name VARCHAR(100) NOT NULL,
  manager_id    BIGINT                NULL,
  manager_name  VARCHAR(100)           NULL,

  FOREIGN KEY (manager_id)
    REFERENCES employees(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE e1 (
    id INT,
    name VARCHAR(50)
);

CREATE TABLE e2 (
    id INT,
    salary INT
);



use sakila;
show tables;

select * from employees; 
select * from employees e1
left join employees e2 on e1.employees_id=e2.manager_id;


select * from customer;
select * from customer c1
inner join customer c2 on c1.address_id=c2.address_id and c1.customer_id<c2.customer_id;


-- FULL JOIN



select * from t1
left join t2 on t1.id=t2.id
union all
select * from t1
right join t2 on t1.id=t2.id;


use sakila;
select * from customer;
show tables;
select min(address_id) from customer;
-- Finding the cusstomer name who is having minimum address id
select first_name from customer where address_id =(select min(address_id) from customeer);
-- Find the customer name who is haing highest address id
select first_name from customer where address_id =(select min(address_id) from customeer);


select first_name from customer where address_id = ((select max(adddress_id) from customer) -1 );

select *from sales;
select region, sum(quntity) as total from sales
group by region
having total =(select max(sum) from sales);
