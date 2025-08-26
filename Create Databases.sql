create database teacher;
use student;

create table student(
student_id int primary key,
first_name varchar(50) null,
age int null,
phone_number varchar(10) null,
prices decimal(10,2) null,
discount decimal(10,2) null,
date_of_birth date null
);

insert into student(
	student_id,
    first_name,
    age,
    phone_number,
    prices,
    discount,
    date_of_birth
) values
(1, 'John', 30, '9638527410', 100.00, 10.00, '2003-02-01'),
(2, 'Vijay', 80, '9635647410', 300.00, 18.00, '2005-03-06'),
(3, 'Ajay', 30, '9638647410', 500.00, 16.00, '2008-03-08'),
(4, 'Rohan', 20, '9638637410', 600.00, 18.00, '2004-05-07');

select * from student;

create table product(
product_id int primary key,
product_name varchar(50) null,
price decimal(10,2) null,
quantity decimal null,
discount decimal(10,2) null
);

insert into product(
	product_id,
    product_name,
    price,
    quantity,
    discount
) values

(001, 'Buggati', 4000000, 3, 10),
(051, 'Farari', 2000000, 8, 20),
(631, 'BMW', 300000, 2, 05),
(100, 'URUS', 8900000, 6, 01);

select *from product;