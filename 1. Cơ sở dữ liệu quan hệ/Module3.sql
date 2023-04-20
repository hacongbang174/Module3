-- create database student_management
-- create table student_management.Class (
-- id INT,
-- name varchar(255));
alter table student_management.Class
Modify id int primary key;
create table student_management.Teacher (
id INT,
PRIMARY KEY (id),
name varchar(255),
age int,
country varchar(255));
