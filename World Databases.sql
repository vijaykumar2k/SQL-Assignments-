-- if(condition): elif
use world;
select code, name, if( name="Aruba","Terror Country","Hello"),
indepyer from country;

select code, name,
	if( name="Aruba","Terror Country", if(name= "Angola","Terroist","Tourism")), 
    indepyer from country;


-- case
--  	when condition then expression
--     when condition then express2
--     else expression
-- end


-- select name,indepyear, ifnull(indepyer,0) from country;

-- select count(indepyer), count(ifnull(indepyer,o)) from country;

-- select name, continent, nullif( length(nam), length(continent)) from country;

-- select name, population,
-- 	case
-- 		when population>200000