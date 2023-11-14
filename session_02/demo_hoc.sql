create database session_02_demo;
use session_02_demo;

drop table category;


-- ràng buộc not null
create table category(
id int,
name varchar(50) not null,
status bit(1)
);
insert into category(id,status) values(1,1);

-- ràng buộc default
create table category(
id int,
name varchar(50) not null,
status bit(1) default(1)
);
insert into category(id,name) values(1,'Áo');

-- ràng buộc unique và primary key và auto_increment
create table category(
id int primary key auto_increment,
name varchar(50) not null unique,
status bit(1) default(1)
);
insert into category(id,name) values(1,'Áo');

-- ràng buộc khóa ngoại foreign key
create table product(
id int primary key auto_increment,
name varchar(50) not null unique,
price float not null,
image varchar(255),
category_id int not null,
foreign key(category_id)references category(id)
);
insert into product(name,price,image,category_id)values('sơ mi',10,'anh.jpg',1);

-- ràng buộc check
create table product(
id int primary key auto_increment,
name varchar(50) not null unique,
price float not null check(price>0),
image varchar(255),
catagory_id int not null,
foreign key(category_id)references catagory(id)
);
insert into product(name,price,image,category_id)values('sơ mi',-10,'anh.jpg',1);

-- thao tác trên bảng
-- Tọa bảng
-- xóa bảng
-- chỉnh sửa bảng alter table
   -- chèn thêm
alter table product add column note text;
   -- chèn vào vị trí
alter table product add column note text after id; 
alter table product add column note text first;
-- xóa cột
alter table product drop column note;
-- chỉnh sửa kiểu dữ liệu
alter table product modify note int;
-- thêm mới ràng buộc
alter table product add check(note>100);
alter table product add constraint foreign key (category_id)references category(id);

-- xóa 
delete from category where id;