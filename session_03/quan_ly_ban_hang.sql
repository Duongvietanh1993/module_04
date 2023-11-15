create database QLBH;
use QLBH; 

create table customer(
c_id int primary key auto_increment,
c_name varchar(25) not null,
c_age tinyint
);
create table orders(
o_id int primary key auto_increment,
c_id int,
foreign key (c_id) references customer(c_id),
o_date date,
o_total_price int
);
create table product(
p_id int primary key auto_increment,
p_name varchar(50),
p_price int check (p_price>0)
);

create table order_detail(
o_id int,
foreign key (o_id) references orders(o_id),
p_id int,
foreign key (p_id) references product(p_id),
o_quantity int
);

INSERT INTO customer(c_name,c_age)
VALUES ( 'A', 10),
       ( 'B', 20),
       ( 'C', 50);
    
INSERT INTO orders(c_id,o_date)
VALUES ( '1', '2006-03-21'),
       ( '2', '2006-03-23'),
       ( '1', '2006-03-16');    
       
INSERT INTO product(p_name,p_price)
VALUES ( 'May giat', 3),
       ( 'Tu lanh', 5),
       ( 'Dieu hoa', 7), 
       ( 'Quat', 7), 
       ( 'Bep dien', 7);

INSERT INTO order_detail(o_id,p_id,o_quantity)
VALUES ( 1,'1', 3),
       ( 1,'3', 7),
       ( 1,'4', 2),
       ( 2,'1', 1),
       ( 3,'1', 8),
       ( 2,'5', 4),
       ( 2,'3', 3);
       
-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.o_id as oID, o.o_date as oDate, (od.o_quantity*p.p_price) as oPrice
from orders o
join order_detail od on o.o_id = od.o_id
join product p on od.o_id=p.p_id;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.c_id AS CustomerID, c.c_name AS CustomerName, p.p_id AS ProductID, p.p_name AS ProductName
FROM customer c
JOIN orders o ON c.c_id = o.c_id
JOIN order_detail od ON o.o_id = od.o_id
JOIN product p ON od.p_id = p.p_id
ORDER BY c.c_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.c_name AS CustomerName
FROM customer c
LEFT JOIN orders o ON c.c_id = o.c_id
WHERE o.c_id IS NULL;

--  Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
SELECT o.o_id AS orderID, o.o_date AS orderDate, SUM(od.o_quantity * p.p_price) AS orderPrice
FROM orders o
JOIN order_detail od ON o.o_id = od.o_id
JOIN product p ON od.p_id = p.p_id
GROUP BY o.o_id, o.o_date;