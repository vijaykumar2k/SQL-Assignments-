select * from product;

select * from orders;

-- Update orders set productid=101 where orderid=955;

select product.pid, product.pname, product.price, orders.city from product
join orders where product.pid=orders.productid;

select product.pid, product.pname, product.price, orders.city from product
inner join orders where product.pid=orders.productid;

select product.pid, product.pname, product.price, orders.city from product
inner join orders on product.pid=orders.productid;

select product.pid, product.pname, product.price, orders.productid, 
orders.city from product
left join orders on product.pid=orders.productid;

select product.pid, product.pname, product.price, orders.productid, 
orders.city from product
right join orders on product.pid=orders.productid;

use sakila;
select * from actor;

desc actor;
select count(actor_id), count(distinct actor_id) from actor;

select * from film_actor;

select actor.actor_id, actor.first_name, film_actor.actor_id,
 film_actor.film_id from actor
		join film_actor where actor.actor_id=film_actor.actor_id and actor.actor_id=1;
        
        
        
create database regex;

use regex;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Helen'),
(9, 'Ian'),
(10, 'Jack');


INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 1, 'English'),
(105, 5, 'Biology'),
(106, 7, 'History'),
(107, 10, 'Math');

use regex;
select * from student;

select * from enrollment;

select s.studentid, s.studentname, e.enrollmentid from student as s
join enrollment as e where s.studentid=e.studentid;


select s.studentid, s.studentname, e.enrollmentid from student as s
left join enrollment as e on s.studentid=e.studentid;
