-- tạo database
create database a0_demo;

-- chọn đến database
use a0_demo;

-- xóa database
drop database a0_demo;

-- tạo bảng
create table STUDENT(
studentId int primary key ,
studentName varchar(50),
age int,
address text,
gender bit
);
drop table STUDENT;

-- lấy dữ liệu (*) là toàn bộ các trường
select * from student;