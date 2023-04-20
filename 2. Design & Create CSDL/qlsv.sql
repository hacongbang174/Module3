create database quanlysinhvien;
use quanlysinhvien;
create table class (
ClassID int auto_increment primary key not null,
ClassName varchar(60) not null,
StartDate datetime not null,
ClassStatus bit
);
create table Student (
StudentID int auto_increment primary key not null,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
StudentStatus bit,
ClassID int not null,
FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
create table Subject (
SubID int auto_increment primary key not null,
SubName varchar(30) not null,
Credit Tinyint not null default(1) check(Credit >= 1),
SubjectStatus bit default(1)
);
create table Mark (
MarkID int auto_increment primary key not null,
SubID int not null,
StudentID int not null,
Mark float default(0) check( 0 <= Mark <= 100),
ExamTimes tinyint default(1),
Unique(StudentID, SubID),
FOREIGN KEY (SubId) REFERENCES Subject (SubId),
FOREIGN KEY (StudentID) REFERENCES Student (StudentID)
);


