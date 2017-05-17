USE MOVIES;

insert into MOVIESTAR(NAME, GENDER, BIRTHDATE)
values('Nicole Kidman', 'F', '1967-06-20');

select *
from MOVIESTAR
where name like 'Nicole Kidman';

delete 
from MOVIESTAR
where ADDRESS is null;

begin tran
select * from MOVIEEXEC;
delete 
from MOVIEEXEC
where NETWORTH < 100000000;

select * from MOVIEEXEC;
rollback

use pc;

insert into product(maker, model, type)
values('C', 1100, 'PC');

insert into pc(code, model, speed, ram, hd, cd, price)
values(12, '1100', 2400, 2048, 500, '52x',299);

select * from pc;

delete from product
where model = '1100';

delete from pc where model = '1100';

select * from laptop;

insert into laptop(code, model, speed, ram, hd, price, screen)
select code + 100, model , speed, ram, hd, price + 500, 15
from pc;

select * from laptop;

insert into product (model, maker, type)
select distinct model, 'Z', 'Laptop'
from pc;

begin tran

select * from product;

delete from product
where model in (select model
				from product
				where type = 'Laptop' and maker not in (select distinct maker
														from product
														where type = 'printer'));
select * from product;

rollback

begin tran

select * from product;

update product
set maker = 'A'
where maker = 'B';

select * from product;

rollback

begin tran
select * from pc;
update pc
set price = price/2, hd = hd + 20;
select * from pc;
rollback

begin tran
select * from laptop;

update laptop
set screen = screen + 1
where model in (select model
				from product
				where maker = 'B' and type = 'Laptop');
select * from laptop;
rollback

use ships;

select * from ships;

select * from CLASSES;

insert into CLASSES
values('Nelson', 'bb', 'Gr.Britain', 9, 16, 34000);

insert into SHIPS
values('Rodney', 'Nelson', 1927);

insert into SHIPS
values('Nelson', 'Nelson', 1927);

begin tran

select * from ships;

delete from SHIPS
where NAME in (select SHIP
				from OUTCOMES
				where result = 'sunk');

select * from ships;
rollback

begin tran

select * from CLASSES;

update CLASSES
set bore = bore * 2.5, DISPLACEMENT = DISPLACEMENT/1.1;

select * from CLASSES;
rollback

begin tran

select * from CLASSES;

delete from CLASSES
where CLASS in (select CLASS
				from SHIPS
				group by class
				having count(1) <= 3);

select * from CLASSES;
rollback

begin tran
select * from CLASSES;

update CLASSES
set bore = (select bore 
			from CLASSES 
			where CLASS = 'Bismarck'),
	DISPLACEMENT = (select DISPLACEMENT	
					from CLASSES
					where CLASS = 'Bismarck')
where CLASS = 'Iowa';

select * from CLASSES;
rollback