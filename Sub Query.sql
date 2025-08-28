-- subquery
-- query(subquery)

use world;
select * from country;
select population from city where name='Kabul';

select name, population from city where population>1780000;


select population from city where name='Batna';

select name, population from city where population>183377;

-- subquery
select name, population from city where population>(select population from city where name='Batna');

select name, population from city where population>(select population from city where name='Amsterdam');


-- Get the name of the city where the district is same as of the district for 'Amsterdam'.


select name district from city where name='Amsterdam';
select name, district from city where district='Noord-Holland';

select name, district from city where district=(select district from city where name='Amterdam');

-- Get the country code and the country name of all countries that are on the same continent as Albania.

select Continent from country where Name = 'Albania';
select Code, name from country where Continent = 'Europe';

select Code, name from country where Continent = (select Continent from country where Name = 'Albania');

-- Get the continent and country name of all countries that have the same life expectancy as the country Cook Islands.

select LifeExpectancy from country where Name = 'Cook Islands';
select Continent, name from country where LifeExpectancy = 71.1;

select Continent, name from country where LifeExpectancy =(select LifeExpectancy from country where Name = 'Cook Islands');

-- Get the country code, continent, and GNP value of all countries where the region is different from the region of the country Benin.

select Region from country where Name = 'Benin';
select Code, Continent, GNP from country where Region <> 'Western Africa';

select Code, Continent, GNP from country where Region <> (select Region from country where Name = 'Benin');

-- i need to gate the country name and the population for all countries avilavle in continent the name as europe

select name, population, continent from country 
	where name in (select name from country where continent = 'Europe');

-- i need to gate the country name and the country code where the life expatnacy match with the life expatncy of the country name as bhamas

select lifeexpectancy from country where name = 'France';

select name, code from country where lifeexpectancy = (select lifeexpectancy from country where name = 'France');
-- ---------------------------------------------------------------------------------------------------------------------------------------------

use sakila;
select * from payment;

select payment_id, customer_id, amount from payment
where amount in (select amount from payment where payment_id=2 or payment_id=3);

select payment_id, customer_id, amount from payment
where amount =any (select amount from payment where payment_id=2 or payment_id=3);




-- any = greater then the minimum value of subquery

select payment_id, customer_id, amount from payment
where amount <=any (select amount from payment where payment_id=2 or payment_id=3 or payment_id=5);

select payment_id, customer_id, amount from payment
where amount >=any (select amount from payment where payment_id=2 or payment_id=3 or payment_id=5);


-- all
select payment_id, customer_id, amount from payment
where amount <all (select amount from payment where payment_id=2 or payment_id=3 or payment_id=5);

select payment_id, customer_id, amount from payment
where amount >all (select amount from payment where payment_id=2 or payment_id=3 or payment_id=5);




select * from world.country;
-- get the name of country whose population is bigger then population all the countrirs from the continent of north america 
select name,Population from world.country where population >all(select name from world.country 
where Continent='North America');

-- get the country code the name of the country whose life expatancy is same as for the countries from europe
select LifeExpectancy from world.country where continent="Europe";
select code,name,LifeExpectancy from world.country where LifeExpectancy =any(select LifeExpectancy from world.country where continent="Europe");

-- get the name of continent             who have got there independance near by the indepandance year of the counties from asia 
select IndepYear from world.country where continent="asia";
select name,continent from world.country where IndepYear>any(select IndepYear from world.country where continent="asia");





select * from world.country order by name;

select * from world.country order by continent;

select * from world.country order by region desc, surfacearea asc;

select name, population,(select population from world.country where name="Anguilla") from world.country;

