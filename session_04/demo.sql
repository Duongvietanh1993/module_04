create database demo_session_04;

-- giá trị tuyệt đối
select abs(-5);

-- làm tròn theo 0.5
select round(1.6);

-- làm tròn lên
select ceil(1.2);

-- làm tròn xuống
select floor(1.2);

-- nối chuỗi
select concat('nguyễn',' ','văn');

-- hàm group_concat
select group_concat(name separator '_') from category;

-- format
select format(10000,0);

-- hoa thường
select ucase('hoa');
select lcase('Hoa');

-- ngày giờ hiện tại
select now();
select year();
select month();
select day();

select date_format(current_date,'%d-%m-%Y');
select datediff(current_date,'1993-6-14');

-- if
select id,name,if(status=1,'true','false') from category;
