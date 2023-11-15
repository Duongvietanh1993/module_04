create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class(
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status bit(1)
);

create table student(
student_id int not null primary key auto_increment,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit(1),
class_id int not null,
foreign key(class_id)references class(class_id)
);

create table subject(
sub_id int not null primary key auto_increment,
sub_name varchar(30),
credit tinyint not null default(1)  check(credit>=1),
status bit(1) default(1)
);

create table mark(
mark_id int not null primary key auto_increment,
sub_id int not null unique key,
foreign key(sub_id)references subject(sub_id),
student_id int not null unique key,
foreign key(student_id) references student(student_id),
mark float default(0) check (mark between 0 and 100),
exam_time tinyint default(1)
);

-- thêm class
insert into class(class_name,start_date,status) values('JAVA','2023-11-15',1);
insert into class(class_name,start_date,status) values('PHP','2023-11-15',1);
insert into class(class_name,start_date,status) values('C#','2023-11-15',1);

-- thêm student
insert into student(student_name,address,phone,status,class_id) values('Việt','Hà Nội','0363304513',1,1);
insert into student(student_name,address,phone,status,class_id) values('Thịnh','Hà Nội','0363304513',1,1);
insert into student(student_name,address,phone,status,class_id) values('Huy','Hà Nội','0363304513',1,1);

-- thêm subject
insert into subject(sub_name,credit) values('session_01',2);
insert into subject(sub_name,credit) values('session_02',4);
insert into subject(sub_name,credit) values('session_03',6);

-- thêm mark
INSERT INTO mark (sub_id, student_id, mark, exam_time)
VALUES
  (1, 1, 80, 1),
  (2, 2, 90, 1),
  (3, 3, 75, 1);
  
-- hiển thị tất cả dữ liệu có tên bắt đầu bằng h
select * from student where student_name like 'h%';
--  Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class where month(start_date)=12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT * FROM subject WHERE credit BETWEEN 3 AND 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
update student
set class_id =2
where student_name='Thịnh';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
select s.student_name,su.sub_name,m.mark
from mark as m
join subject as su
on m.sub_id=su.sub_id
join student as s
on m.student_id=s.student_id
order by m.mark desc, s.student_name asc;

