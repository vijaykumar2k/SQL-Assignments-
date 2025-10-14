create database corrdb;
use corrdb;

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Chair', 'Furniture', 150.00),
(4, 'Desk', 'Furniture', 300.00),
(5, 'Monitor', 'Electronics', 250.00);

-- Insert data into sales
INSERT INTO sales (sale_id, product_id, quantity, sale_date) VALUES
(1, 1, 3, '2025-09-10'),
(2, 2, 5, '2025-09-11'),
(3, 1, 2, '2025-09-15'),
(4, 3, 7, '2025-09-18');

select * from products;
select * from sales;

-- Get all products that have been sold more than 3 times in any single sale transaction

select distinct p.product_name from products p
join sales s on p.product_id = s.product_id
where s.quantity > 3;

select product_id, product_name from products as p_out
where p_out.product_id in
		(select product_id from sales as s_in where s_in.product_id=p_out.product_id and quantity>3);


-- Second Highest Salary (Price)
select * from products order by price desc limit 1,3;

select max(price) from products;

-- Second Highest Price
select max(price) from products where price< (select max(price) from products);

-- Informatopm
select * from products where price=
(select max(price) from products where price< (select max(price) from products) );

-- Second Lowest Price
select min(price) from products where price> (select min(price) from products);

select * from products where price=
(select min(price) from products where price> (select min(price) from products) );


-- Get all the information from the table where products price > the price of product_id 3 
-- get all the information from the product table where the category is same as of product id 2
-- get all the information from the product table where the categoty is same as that of product id 2 and 3
-- get all the information from the product table where the of thr product is > among all the prices of the products under the furnituree category
-- get the product id product name and the total qantity sold in a year


select * from products
where price > (select price from products where product_id = 3);

select * from products
where category = (select category from products where product_id = 2);

select * from products where category in
	(select category from products where product_id in (2, 3));

select * from products where price > all 
	(select price from products where category = 'Furniture');
