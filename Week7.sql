create database test
go
use test;
go

create table Product(
	maker char(1),
	model char(4),
	type varchar(7)
);

create table Printer(
	code char(1) default 'n',
	model char(4),
	color varchar(10),
	price decimal(5, 2)
);

create table Classes(
	class varchar(50),
	type char(2)
);

insert into Printer(code, model)
values('y', 'kek');

select * from Printer;

insert into Classes
values('migger', 'mu');

alter table Classes add bore float;

select * from Classes;

insert into Printer(code, model, price)
values('y', 'kek', 25);

alter table Printer drop column price;

drop table Printer;

drop table Classes;

drop table Product;

SELECT * FROM information_schema.tables;

use movies
go
drop database test
go

