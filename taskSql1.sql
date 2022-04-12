create database mart135
use mart135
create table Groups(
Id INT PRIMARY KEY IDENTITY,
No nvarchar(30) not null


)

create table Students(
Id INT PRIMARY KEY IDENTITY,
Name nvarchar(30) not null,
Surname nvarchar(30) not null,
GrupsId int foreign key references Groups(Id)




)

create table Subjects(

Id INT PRIMARY KEY IDENTITY,
Name nvarchar(30) not null,





)
create table Exams(
Id INT PRIMARY KEY IDENTITY,
Date datetime2 DEFAULT(GETUTCDATE()),
SubjectsId int foreign key references Subjects(Id)




)
create table StudentExams(
Id INT PRIMARY KEY IDENTITY,
Result TINYINT,
StudentsId int foreign key references Students(Id),
ExamsId int foreign key references Exams(Id),





)
insert into Groups
values
('no1'),
('no2')
insert into Students
values
('Mustafa','Qasimzade',1),
('Eli', 'Isazade',2)
insert into Subjects
values
('Fizika'),
('Biologya')

insert into Exams
values
('2022-10-20',1),
('2022-10-21',2),
('2022-10-21',null)

insert into StudentExams
values
('1','2','3'),
('1','2','3')
select Students.Id,  Name ,Surname, Groups.No from Students 
join Groups on GrupsId=Groups.Id
select Students.Id,  Students.Name ,Students.Surname,StudentExams.StudentsId from Students 
join StudentExams on StudentsId=Students.Id
select * from Subjects
where (select count(Id) from Exams where SubjectsId=Subjects.Id)=null
select StudentExams.Id , StudentExams.ExamsId,StudentExams.StudentsId,Students.Surname,Students.Id from StudentExams
join Students on StudentExams.StudentsId=Students.Id
select   Students.Name ,Students.Surname,Groups.No
from Students 
join Groups 
on Students.GrupsId=Groups.Id
join StudentExams 
on Students.Id=StudentExams.StudentsId
join Exams 
on Exams.Id=StudentExams.ExamsId









