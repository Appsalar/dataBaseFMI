use movies;

begin tran

alter table movie
add constraint u_len unique(length);

alter table movie
add constraint u_studio_len unique(studioname, length);

insert into movie(title, year, length, incolor, studioName, producerc#)
values('Fail', 2012, 111, 'N', 'Fox', 123);

select * from movie;

alter table movie
drop constraint u_studio_len;

create database deleteme
go
use deleteme
go

create table student(
	fn int primary key check(fn between 0 and 99999),
	name varchar(100) not null,
	egn char(10) unique not null,
	email varchar(100) unique not null,
	birthdate date not null,
	datein date not null,
	constraint least_18_year_check check(datediff(year, birthdate, datein) >= 18)
);

insert into student
values(81888, 'Ivan Ivanov', '9001012222', 'ivan@gmail.com', '1990-01-01', '2009-01-10');

select * from student;

alter table student
add constraint valid_email check(email like '%_@%_.%_');

create table courses(
	id int identity primary key,
	name varchar(50)not null
);

insert into courses(name)
values('oop');

insert into courses(name)
values('database');

insert into courses(name)
values('sdp');

insert into courses(name)
values('dis');

select * from courses;

create table studentsin(
	courseid int references courses(id), --on delete cascade
	student_id int references student(fn), 
	primary key(courseid, student_id)
);

insert into studentsin values(1, 81888);

alter table studentsin
add foreign key (courseid)  references courses(id)
on delete cascade;

select * from studentsin;

delete from courses where name = 'oop';

select * from courses;

use master 
go
drop database deleteme;