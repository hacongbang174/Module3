-- create database student_management
alter table student_management.Class
Modify id int primary key;
create table student_management.Teacher (
id INT,
PRIMARY KEY (id),
name varchar(255),
age int,
country varchar(255));
