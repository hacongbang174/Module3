create database quanlybanhang;
create table customer (
cID int auto_increment,
cName varchar(255),
cAge int not null,
Primary key (cID)
);

create table `Order` (
oID int auto_increment,
cID int ,
oDate datetime not null,
oTotalPrice double not null,
Primary key (oID),
FOREIGN KEY (cID) REFERENCES customer(cID)
);

create table Product (
pID int auto_increment,
pName varchar(255),
pPrice double,
Primary key (pID)
);
create table orderdeltail (
oID int,
pID int,
odQTY int not null,
FOREIGN KEY (oID) REFERENCES `order`(oID),
FOREIGN KEY (pID) REFERENCES product(pID)
);