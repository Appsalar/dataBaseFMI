use movies;

select TITLE, YEAR, STUDIONAME, ADDRESS
from MOVIE
join STUDIO on STUDIONAME = STUDIO.NAME
where LENGTH > 120;

select distinct STUDIONAME, STARNAME
from STARSIN
join MOVIE on TITLE = MOVIETITLE and YEAR = MOVIEYEAR
order by STUDIONAME;

select distinct NAME
from starsin
join MOVIE on TITLE = MOVIETITLE
join MOVIEEXEC on CERT# = PRODUCERC#
where STARNAME = 'Harrison Ford';

select distinct STARNAME
from STARSIN
join MOVIE on TITLE = MOVIETITLE
join MOVIESTAR on name = STARNAME
where STUDIONAME = 'MGM' and GENDER = 'F';

select NAME, TITLE
from MOVIEEXEC
join MOVIE on CERT# = PRODUCERC#
where CERT# = (	select PRODUCERC#
				from MOVIE
				where TITLE = 'Star Wars');

select NAME
from MOVIESTAR
left join STARSIN on NAME = STARNAME
where STARNAME is null;


use pc;


select maker, product.model, type
from product
left join (select model from laptop
			union
			select model from pc
			union 
			select model from printer) t
	on product.model = t.model
where t.model is null;


use ships;


select NAME, COUNTRY, NUMGUNS, LAUNCHED
from SHIPS s
join CLASSES c on c.CLASS = s.CLASS;

select SHIP
from BATTLES
join OUTCOMES on NAME = BATTLE
where YEAR(DATE) = 1942;

select name, COUNTRY
from CLASSES c 
join SHIPS s on c.CLASS = s.CLASS
left join OUTCOMES on NAME = SHIP
where BATTLE is null;

select NAME, LAUNCHED
from SHIPS
where name = CLASS;

select distinct COUNTRY
from CLASSES c 
join SHIPS s on s.CLASS = c.CLASS
left join OUTCOMES on NAME = SHIP
where RESULT = 'sunk';

select c.CLASS
from CLASSES c
left join SHIPS s on c.CLASS = s.CLASS and LAUNCHED > 1921
where NAME is null;

select class
from classes
where class not in (select class from ships where launched > 1921);

select CLASS, COUNTRY, bore * 2.54 as bore_sm
from CLASSES
where NUMGUNS in (6, 8, 10)







