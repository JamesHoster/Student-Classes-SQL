IF OBJECT_ID('CollegeDB') is not null begin
Drop Database CollegeDB

Create Database CollegeDB
use CollegeDB
go


create table Students(
ID int not null Identity primary key,
FName varchar(25) not null,
LName varchar(25) not null,
SSN int not null,
address varchar(50) not null,
City varchar(25) not null,
state varChar(15) not null,
Zip int not null,
Phone bigint not null
);
go

create table Classes(
ID int not null Identity Primary key,
Title varchar(25) not null,
Number int not null,
Department varchar(25) not null,
--StudentID int not null references dbo.Students(ID),
--constraint FK_StudentID2 FOREIGN KEY (StudentID) references Students(ID)
);
--CONSTRAINT FK_DeptID2 FOREIGN KEY (DeptID) REFERENCES Dept(ID) --Explicitly name a constraint

go

create table Scores(
ID int not null Identity Primary key,
Type varchar(20) not null,
Description varchar(100) not null,
DateAssigned datetime not null,
DateDue datetime not null,
DateSubmitted datetime not null,
PointsEarned int not null,
PointsTotal int not null
--ClassesID int not null references dbo.Classes(ID),
--Constraint FK_ClassesID2 Foreign key (ClassesID) references Classes(ID)
);
go

create table Student_Classes(
ID int not null Identity Primary key,
StudentID int not null references dbo.Students(ID),
Constraint FK_StudentID2 FOREIGN KEY (StudentID) references Students(ID),
ClassID int not null references dbo.Classes(ID),
Constraint FK_ClassID2 FOREIGN KEY (ClassID) references Classes(ID),
ScoreID int not null references dbo.Scores(ID),
Constraint FK_ScoreID2 FOREIGN KEY (ScoreID) references Scores(ID)
);
go

insert into Students (FName, LName, SSN, address, city, State, Zip, Phone)
			Values   ('Randy', 'Quaid', 112325756, '123 Nuggets Ln', 'Lincoln', 'Nebraska', 21232, 8675309212),
					 ('Alfonzo' , 'Buspeidi', 232465678, '276 Neverlane', 'Tucson', 'Arizona', 55667, 9840003256),
					 ('Alicia', 'Nazzim', 849039857, '666 Badger Lane', 'Detroit', 'Michigan', 37283, 7772341254);

insert into Classes (Title, Number, Department)
			Values  ('Algebra', 134, 'Math'),
					('Creative Writing', 221, 'English'),
					('Physics', 176, 'Science');

insert into Scores (Type, Description, DateAssigned, DateDue, DateSubmitted, PointsEarned, PointsTotal)
			Values ('Quiz 1', 'Randys Quiz', '2019-03-04', '2019-03-04', '2019-03-04', 25, 50),
				   ('Quiz 1', 'Alfonzos Quiz', '2019-03-04', '2019-03-04', '2019-03-04', 30, 50),
				   ('Quiz 1', 'Alicias Quiz', ' 2019-03-04', '2019-03-04', '2019-03-04', 40, 50),
				   ('Lab 1', 'Randys Lab', '2019-03-14', '2019-03-22', '2019-03-19', 75, 100),
				   ('Lab 1', 'Alfonzos Lab', '2019-03-14', '2019-03-22', ' 2019-03-20', 50, 100),
				   ('Lab 1', 'Alicias Lab', '2019-03-14', '2019-03-22', '2019-03-21', 90, 100),
				   ('HW 1', 'Randys HW', '2019-04-01', '2019-04-08', '2019-04-07', 8, 10),
				   ('HW 1', 'Alfonzos HW', '2019-04-01', '2019-04-08', '2019-04-06', 9, 10),
				   ('HW 1', 'Alicias HW', '2019-04-01', '2019-04-08', '2019-04-03', 10, 10);

Insert into Student_Classes (StudentID, ClassID, ScoreID)
					  Values(1, 1, 1),
							(1, 2, 7),
							(1, 3, 4),
							(2, 1, 2),
							(2, 2, 8),
							(2, 3, 5),
							(3, 1, 3),
							(3, 2, 9),
							(3, 3, 6);

Select *
From Student_Classes SC
inner join Students S on SC.StudentID = s.ID
inner Join Classes C on SC.ClassID = C.ID
inner join Scores Re on SC.ScoreID = RE.ID



select * from Student_Classes 

select * from students
select * from classes
select * from Scores