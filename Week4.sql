use pc;

select avg (speed)
from pc;

select maker, avg(screen)
from product p 
join laptop l on l.model =p.model
group by maker;

select avg(speed)
from laptop
where price > 1000;

select maker, avg(price)
from product p 
join pc l on l.model =p.model
where maker = 'A'
group by maker;

select avg(price)
from (	select price
		from product p 
		join pc on pc.model = p.model
		where maker = 'B'
		union all
		select price
		from product p 
		join laptop on laptop.model = p.model
		where maker = 'B'
) allPrices;

select speed, avg(price)
from pc
group by speed;


select maker
from product
where type='PC'
group by maker
having count(1) >= 3;

select distinct maker
from product
join pc p on product.model = p.model
where price = (select max(price) from pc);

select speed, avg(price)
from pc
where speed > 600
group by speed;

select avg(p.hd)
from product
join pc p on product.model = p.model
where maker in (select maker
					from product
					where type = 'Printer');

select screen, max(price) - min(price)
from laptop l1
group by screen;

use ships;

select COUNT(1)
from CLASSES;

select avg(numguns)
from SHIPS
join CLASSES cl on cl.CLASS = ships.CLASS
where LAUNCHED is not null;

select class, min(launched), max(launched)
from ships
group by class;

select class, count(name)
from OUTCOMES
join SHIPS s on SHIP = s.NAME
where result = 'sunk' and CLASS in (	select CLASS
										from SHIPS
										group by CLASS
										having count(1) > 4)
group by CLASS;



