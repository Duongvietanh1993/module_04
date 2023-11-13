create database session_01;
use session_01;

create table users(
id int primary key,
uesr_name varchar(50),
email varchar(50),
address text,
password varchar(255)
);

create table product(
id int primary key,
product_name varchar(50),
stock int,
description text,
image text
);

select * from users;
select * from product;

drop table user;