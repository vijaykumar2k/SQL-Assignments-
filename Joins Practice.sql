--  inner join 
--  table join table2 where clause
--  join, group, join with group by
--  self join,outer join (left join)

use sakila;

select a.actor_id, a.first_name, fa.film_id from actor as a
	join film_actor as fa where a.actor_id=fa.actor_id;
    
select a.actor_id, a.first_name, fa.film_id from actor as a
	inner join film_actor as fa on a.actor_id=fa.actor_id;
    
select a.actor_id, a.first_name, fa.film_id from actor as a
	inner join film_actor as fa using (actor_id);
    
select * from film_Actor;
select a.first_name, count(fa.film_id) from actor as a
	join film_actor as fa where a.actor_id=fa.actor_id
    group by a.first_name;
    
    
select * from actor;
select * from film_actor;
select * from film;


select act.actor_id, act.first_name, factor.film_id, film.title from actor as act
join film_actor as factor 
    join film
    where act.actor_id=factor.actor_id and factor.film_id=film.film_id;
    
use world;
select * from country;
select * from city;



-- Get the city name and district where the district does not contain the word "Noord".

-- Get the total number of cities present in each country having a population less than 1.5 lakhs.

-- Get the district names which have more than two cities.

-- Find the city name, country code, and country name where the country population is greater than 50,000.

-- Get the district and the total population for each country.

-- Get the total number of countries present in each continent having independence year after 1920.

-- Get the average surface area, total population, average life expectancy, and the total number of continents available for each region



select name, district from city where district not like 'noord';

select countrycode, count(*) as total_cities from city where population < 150000
group by countrycode;

select district from city group by district having count(*)>2; 

select city.name, city.countrycode, country.name as country_name from city join country;


