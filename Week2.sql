use movies;

select STARNAME
from STARSIN
join MOVIESTAR on NAME = STARNAME
where MOVIETITLE = 'Terms of Endearment' and GENDER = 'M';

select distinct MOVIETITLE
from STARSIN
join MOVIE on TITLE = MOVIETITLE
where STUDIONAME = 'MGM' and MOVIEYEAR = 1995;

select m1.TITLE
from MOVIE as m1, MOVIE as m2
where m1.LENGTH > m2.LENGTH and m2.TITLE = 'Star Wars';


use pc;

select maker, speed
from laptop
join product on laptop.model = product.model
where hd > 9;

select product.model, price
from product
join laptop on laptop.model = product.model
where maker = 'B'

union 

select product.model, price
from product
join printer on printer.model = product.model
where maker = 'B'

union

select product.model, price
from product
join pc on pc.model = product.model
where maker = 'B'

order by price desc


select distinct p1.model, p2.model
from pc p1
join pc p2 on p1.speed = p2.speed and p1.ram = p2.ram
where p1.model < p2.model;


use ships;

select name
from SHIPS
join CLASSES as c on c.CLASS = ships.CLASS
where DISPLACEMENT > 35000;

select SHIP, DISPLACEMENT, NUMGUNS 
from outcomes
join SHIPS on SHIPS.name = SHIP
join CLASSES on CLASSES.CLASS = SHIPS.CLASS
where BATTLE = 'Guadalcanal';

select COUNTRY
from CLASSES
where TYPE = 'bb'

intersect

select COUNTRY
from CLASSES
where TYPE = 'bc'


select o1.SHIP
from OUTCOMES o1
join BATTLES b1 on b1.NAME = o1.BATTLE
join OUTCOMES o2 on o1.SHIP = o2.SHIP
join BATTLES b2 on b2.NAME = o2.BATTLE
where o1.RESULT = 'damaged' and b1.DATE < b2.DATE