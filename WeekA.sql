use ships;
go

create trigger t1
on BATTLES
after delete
as
delete
from OUTCOMES
where OUTCOMES.BATTLE in (select NAME
						  from deleted);
go

begin tran

select * from BATTLES;
select * from OUTCOMES;

delete from BATTLES where NAME = 'Guadalcanal';

select * from OUTCOMES;
rollback

drop trigger t1;
go

create trigger t2
on outcomes
after insert
as
	if exists (select *
			   from OUTCOMES o
			   join SHIPS on ship = name
			   join BATTLES b on b.NAME = BATTLE
			   where launched > year(b.DATE))
	begin
		raiserror('launched > battle.date', 16, 10)
		rollback;
	end;

insert into outcomes(ship, battle, result) 
values('Iowa', 'North Atlantic', 'sunk');

select * from outcomes
where ship='Iowa';

drop trigger t2;
go



-- 1. Да се направи така, че при добавяне
-- на нов клас автоматично да се добавя и
-- нов кораб със същото име и с година на
-- пускане на вода = null.
create trigger t3
on classes
after insert
as
	insert into SHIPS(NAME, CLASS)
	select CLASS, CLASS
	from inserted;
go

insert into classes
values('Test', 'bb', 'Bulgaria', 14, 20, 80000);
select * from ships where name = 'Test';

drop trigger t3;
go

-- 2. При изтриване на кораб автоматично да се изтрива и неговият клас, ако
-- няма повече кораби от този клас.
-- Забележка: ако преди това е имало класове без кораби - да не се пипат!
-- Забележка: клас без кораби може да се получи и при update
create trigger t4
on SHIPS
after delete, update
as
	delete
	from CLASSES
	where CLASS in (select CLASS 
						from deleted
						where class not in (select CLASS 
											from SHIPS));
go

delete from ships
where name = 'Test';

select * 
from classes
where class = 'Test';

drop trigger t4;
go


-- 3. Да се направи така, че ако при 
-- добавяне или обновяване на кораб
-- годината му на пускане е по-голяма от 
-- текущата година, то годината му да бъде
-- променена на null. (това е задача 3-А от 12.exerciseTriggers.pdf)

-- в MSSQL няма BEFORE тригери, затова ще търсим друг начин
create trigger t5
on SHIPS
after insert, update
as
	update SHIPS
	set LAUNCHED = null
	where name in (select name
				   from inserted
				   where LAUNCHED > YEAR(getdate()));
go

insert into ships values('Test','Iowa',2250);

select * from ships where name='Test';

delete from ships where name='Test';

drop trigger t5;
go

