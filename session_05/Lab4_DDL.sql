create database Lab4_DDLCustomerOrders;

create database session05_bt_lab4;
use session05_bt_lab4;

create table customer(
	cID int primary key auto_increment,
    cName varchar(255),
    cAge int
);
create table orders(
	oID int primary key auto_increment,
    cID int,
    foreign key(cID) references customer(cID),
    oDate date,
    oTotalPrice float
);
create table products(
	pID int primary key auto_increment,
    pName varchar(255),
    pPrice float
);
create table order_detail(
	oID int,
    foreign key(oID) references orders(oID),
    pID int,
    foreign key(pID) references products(pID),
    primary key(oID,pID),
    odQty int
);
INSERT INTO customer(cName,cAge)
VALUES ( 'A', 10),
       ( 'B', 20),
       ( 'C', 50);
    
INSERT INTO orders(cID,oDate)
VALUES ( '1', '2006-03-21'),
       ( '2', '2006-03-23'),
       ( '1', '2006-03-16');    
       
INSERT INTO products(pName,pPrice)
VALUES ( 'May giat', 3),
       ( 'Tu lanh', 5),
       ( 'Dieu hoa', 7), 
       ( 'Quat', 7), 
       ( 'Bep dien', 7);

INSERT INTO order_detail(oID,pID,odQty)
VALUES ( 1,'1', 3),
       ( 1,'3', 7),
       ( 1,'4', 2),
       ( 2,'1', 1),
       ( 3,'1', 8),
       ( 2,'5', 4),
       ( 2,'3', 3);

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order, danh sách phải sắp xếp theo thứ tự ngày tháng
select * from orders;

-- Hiển thị tên và giá của các sản phẩm có giá cao nhất như sau
SELECT p.pName, p.pPrice
FROM products p
WHERE p.pPrice >= ALL (SELECT p2.pPrice FROM products p2);
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào như sau
SELECT c.cName AS CustomerName
FROM customer c
LEFT JOIN orders o ON c.cID = o.cID
WHERE o.cID IS NULL;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách đó như sau
SELECT c.cName AS CustomerName, p.pName AS ProductName
FROM customer c
JOIN orders o ON c.cID = o.cID
JOIN order_detail od ON o.oID = od.oID
JOIN products p ON od.pID = p.pID
ORDER BY c.cID;