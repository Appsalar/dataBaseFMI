use movies;


select *
from (select * from STARSIN) p
where p.MOVIETITLE is not null;

use ships;
go

create view BritishShips
as
select s.name, c.CLASS, c.TYPE, c.BORE, c.NUMGUNS, c.DISPLACEMENT, s.LAUNCHED
from ships s
join CLASSES c on s.CLASS = c.CLASS
where c.COUNTRY = 'Gt.Britain';
go


select * from CLASSES;
select * from BritishShips;


select NUMGUNS, DISPLACEMENT
from BritishShips
where LAUNCHED < 1919;


create view SunkShips
as
select SHIP, BATTLE
from OUTCOMES
where result = 'sunk';
go

create view ClassesWithAtLeast9Guns
as
select * 
from CLASSES
where NUMGUNS >= 9
with check option;
go



select * from ClassesWithAtLeast9Guns;

update ClassesWithAtLeast9Guns
set NUMGUNS = 9
where CLASS = 'Iowa';

drop view ClassesWithAtLeast9Guns
go

create view ClassesWithAtLeast9Guns
as
select * 
from CLASSES
where NUMGUNS >= 9
with check option;
go

drop view ClassesWithAtLeast9Guns;
drop view SunkShips;