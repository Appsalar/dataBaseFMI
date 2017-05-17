use movies;

select ADDRESS
from STUDIO
where NAME like 'MGM';

select BIRTHDATE
from MOVIESTAR
where NAME = 'Sandra Bullock';

select STARNAME 
from STARSIN
where MOVIETITLE like '%Empire%';

select * 
from MOVIEEXEC
where NETWORTH > 10e7;

select NAME
from MOVIESTAR
where GENDER = 'M' or ADDRESS like '%Malibu%';


use pc;


select model, speed as Mhz, hd as GB 
from PC
where PRICE < 1200;

select model, price / 1.1 as priceInEURO
from laptop
order by price;

select model, ram, screen
from laptop
where price > 1000;

select *
from printer
where color = 'y';

select model, speed, hd
from pc
where price < 2000 and (cd = '12x' or cd = '16x');

select code , model, speed + ram + 10 * screen as rating
from laptop
order by rating desc, code;


use ships;


select CLASS, COUNTRY
from CLASSES
where NUMGUNS < 10;

select NAME
from SHIPS
where LAUNCHED < 1918;

select NAME
from SHIPS
where NAME like 'R%';

select NAME
from SHIPS
where NAME like '% %' and not NAME like '% % %';



