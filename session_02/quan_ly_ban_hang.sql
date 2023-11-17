create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table category(
id int primary key auto_increment,
name varchar(50) unique,
status tinyint(1) default(1)
);

create table product(
id int primary key auto_increment,
name varchar(50),
category_id int,
foreign key(category_id) references category(id),
price float check(price>0),
sale_price float,
 constraint check (sale_price<price)
);

create table customer(
id int primary key auto_increment,
name varchar(100),
email varchar(100),
birthday date,
gender tinyint(1)default(1)
);

create table orders(
id int primary key auto_increment,
customer_id int,
foreign key(customer_id)references customer(id),
created date default(current_date()),
status tinyint(1)default(1)
);

create table order_detail(
orders_id int,
foreign key(orders_id)references orders(id),
product_id int,
foreign key(product_id)references product(id),
primary key(orders_id,product_id),
quantity int,
price float
);

-- tạo customer
insert into customer(name,email,birthday,gender)values('Thịnh','thinh@gmail.com','2023-11-11',1);
insert into customer(name,email,birthday,gender)values('Huy','Huy@gmail.com','2023-11-1',1);
insert into customer(name,email,birthday,gender)values('Đức','Đức@gmail.com','2023-11-1',1);
insert into customer(name,email,birthday,gender)values('Tùng','Tùng@gmail.com','2023-11-1',1);
insert into customer(name,email,birthday,gender)values('Việt','Việt@gmail.com','2023-11-1',1);

-- tạo category
insert into category(name)values('IPHONE');
insert into category(name)values('IPAD');
insert into category(name)values('MACBOOK');
insert into category(name)values('APPLE WATCH');
insert into category(name)values('AIR PODS');

-- tạo product

insert into product(name,category_id,price,sale_price)values('Iphone15',1,30000000,25000000);
insert into product(name,category_id,price,sale_price)values('Macbook Pro',3,45000000,35000000);
insert into product(name,category_id,price,sale_price)values('Ipad Air',2,35000000,25000000);
insert into product(name,category_id,price,sale_price)values('AirPods Max',5,10000000,9000000);
insert into product(name,category_id,price,sale_price)values('Apple Watch s9',4,18000000,15000000);

-- tạo order_detail
insert into order_detail(orders_id,product_id,quantity,price)values(1,1,2,25000000);
insert into order_detail(orders_id,product_id,quantity,price)values(1,2,2,25000000);
insert into order_detail(orders_id,product_id,quantity,price)values(3,3,2,25000000);
insert into order_detail(orders_id,product_id,quantity,price)values(4,4,2,25000000);
insert into order_detail(orders_id,product_id,quantity,price)values(5,5,2,25000000);

-- tạo order
insert into orders(customer_id)values(1);
insert into orders(customer_id)values(2);
insert into orders(customer_id)values(3);
insert into orders(customer_id)values(4);
insert into orders(customer_id)values(5);

-- thêm cột vào orders
alter table orders add column note varchar(100);

-- hiển thị ra có trạng thái là 1
select * from category where status=1;

-- hiển thị sản phẩm có giá khuyến mãi
select * from product where sale_price;

-- hiển thị sản phẩm percent_price
select id,name,sale_price,((1-(sale_price)/price)*100) as 'percent_price' from product;

-- cập nhật giá sản phẩm theo id=1
UPDATE product
SET price = 50000000
WHERE id = 1;

-- xóa sản phẩm theo id=1
delete from product 
where id=1;

-- join order
select o.id,c.name,o.created,o.status
from orders o
left join customer c
on c.id = o.customer_id;

select o.id,c.name,o.created,o.status,sum(od.quantity) as 'Tổng sản phẩm', SUM(od.price * od.quantity) AS 'Tổng tiền'
from orders o
join customer c
on c.id = o.customer_id
join order_detail od
on o.id= od.orders_id
GROUP BY o.id,c.name,o.created,o.status
having o.status =1;

-- join đơn hàng
select o.id,p.name,od.quantity,p.price,(p.price*od.quantity) total_price
from order_detail od
join orders o
on od.orders_id = o.id
join product p
on od.product_id=p.id;

-- join đơn hàng orders_id=1
select o.id,p.name,od.quantity,p.price,(p.price*od.quantity) total_price
from order_detail od
join orders o
on od.orders_id = o.id
join product p
on od.product_id=p.id where orders_id=1;


SELECT o.id, SUM(p.price * od.quantity) AS total_order_value
FROM order_detail od
JOIN orders o 
ON od.orders_id = o.id
JOIN product p 
ON od.product_id = p.id
WHERE o.id = 1
GROUP BY o.id;

-- lấy tất cả bản ghi product(id,name,price,categoty_name) order by xắp xếp
select product.id,product.name,product.price,category.name as categoty_name
from product
join category
on category.id = product.category_id order by price desc;

-- đếm số sản phẩm
select count(*) from product;

-- đếm tông tiền
select sum(price) from product;

-- lấy ra danh sách danh mục gồm (id,name,total_product)

select c.*, count(*) as total_product
from category as c
join product as p
on c.id=p.category_id
group by c.id;

-- phân trang
select * from product limit 3;
-- hiển thị 2 sản phẩm trên 1 trang
select * from product limit 0,3;
select * from product limit 3,3;

-- hiển thị 2 sản phẩm trên 1 trang
   -- trang 1
select * from product limit 2 offset 0;
   -- trang 2
select * from product limit 2 offset 2;
   -- trang 3
select * from product limit 2 offset 4;


