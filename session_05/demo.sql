use quan_ly_ban_hang;

select * from product;

create table test(
id int not null,
name varchar(255) not null
);

insert into test(id,name)values
(2,'b'),
(1,'a');

delete from test;
select * from test;
create index idx_id on test(id);

create table test_2(
id int not null,
name varchar(255) not null
);

-- tạo chỉ mục
create unique index uidx_id on test_2(id);

select * from test_2;

insert into test_2(id,name)values
(2,'b'),
(1,'a');

-- 
select p.id,p.name,p.price,c.name as category_name
from product p
join category c
on p.category_id = c.id;

-- tao view
create view category_product
as
select p.id,p.name,p.price,c.name as category_name
from product p
join category c
on p.category_id = c.id;

select * from category_product;
drop view category_product;

-- cap nhat view
alter view category_product
as
select p.id,p.name,p.price,c.name as category_name
from product p
join category c
on p.category_id = c.id where p.price>10000000;


-- xây dựng thủ tục hiển thị
delimiter &&
create procedure thong_tin_product()
begin
select * from product;
end;
&& 



-- gọi thủ tục;
call thong_tin_product();

-- thủ tục có tham sô;
insert into category(name,status) values('abc',1);

delimiter &&
create procedure thong_tin_category(in category_name varchar(50),status bit(1))
begin
insert into category(name,status) values(category_name,status);
end;
&&

-- gọi thủ tuc;
call thong_tin_category('cate',1);

-- lấy đơn hàng 1;
select sum(price*quantity) from order_detail where orders_id =1;

-- tao thu tục tham số là id đơn hàng;
delimiter &&
create procedure thong_tin_total_price(in id int,out total float)
begin
set total=(select sum(price*quantity) from order_detail where orders_id =id);
end;
&&


-- call thong_tin_total_price(2,@total);
-- select @total as total;

-- Thực hiện đánh chỉ mục trên trường name, bảng customer 
-- create unique index index_name on customer(name);

-- xếp hạng 
/*create view xep_hang
as
select s.name, avg(st.mark) as điểm_trung_binh,
case 
 when avg(st.mark) <5
then 'yeu'
when avg(st.mark)>=5 and avg(st.mark)<8
then 'kha'
else 'gioi'
end as Xếp_loại
from student s
join student_test st on st.rn = s.rn
group by s.name;*/

-- Tạo view hiển thị danh sách đơn hàng (case when );
/*create view đơn_hang
as
select o.id,c.name,o.status,
case
when status =0 then 'đang chờ sử lý'
when status =1 then 'đang giao hàng'
else 'đã hoàn thành'
end as 'trạng thái'
from orders o
join customer c on c.id= o.customer_id
group by  o.id,c.name,o.status;

select * from đơn_hang;
drop view đơn_hang;*/

-- Tạo thủ tục thêm mới sản phẩm
delimiter &&
create procedure thêm_mới(in name varchar(50),in category_id int, in price float, in sale_price float )
begin
insert into category(name,status) values(id,category_id,price,sale_price);
end;
&&

-- Tạo thủ tục lấy ra 5 sản phẩm có giá cao nhất
/*delimiter &&
create procedure 5_product()
begin
select * from product
order by price desc limit 3;
end;
&&

call 5_product;*/

-- Tạo thủ tục cập nhật

delimiter &&
create procedure update_product(in id int, in new_name varchar(50))
begin
update product set name = new_name where id =id;
end;
&&

call update_product(1,'vui');

-- xóa thủ tục
delimiter &&
create procedure update_product(in id int)
begin
delete from product where id =id;
end;
&&

call update_product(1);