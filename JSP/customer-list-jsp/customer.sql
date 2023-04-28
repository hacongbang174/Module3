create database c1_customer;
create table customer (
id int auto_increment,
fullName varchar(45),
birthDay date,
address varchar(255),
img varchar(255),
primary key (id)
);
insert into customer(id,fullName,birthDay,address,img)
values (1,"Châu Văn Nghĩa",'1992-09-15',"Huế","https://ca.slack-edge.com/TEZB2M9GC-U04LYLD68MB-b00a37c63258-512"),
(2,"Phước Đạt",'1998-01-01',"Huế","https://ca.slack-edge.com/TEZB2M9GC-U04M1JP9W1Y-381385424977-512"),
(3,"Quốc Pháp",'1997-01-01',"Huế","https://ca.slack-edge.com/TEZB2M9GC-U04M1F8N5PV-10802e5c0e5b-512"),
(4,"Thư Lê",'1997-01-01',"Huế","https://ca.slack-edge.com/TEZB2M9GC-U01R48QT22H-1c3c3b9b8c58-512"),
(5,"Đặng Văn Quang",'1992-01-01',"Huế","https://ca.slack-edge.com/TEZB2M9GC-U034SS5MUP7-214a76271ee3-512");
	