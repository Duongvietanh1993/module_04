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
  (1, 1, 60, 1),
  (2, 2, 50, 1),
  (3, 3, 35, 1);
  
  
-- Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select address, count(student_id) as 'Số lượng sinh viên'
from Student 
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select s.student_id,s.student_name, avg(mark)
from student s 
join mark m on s.student_id= m.student_id
group by s.student_id,s.student_name;
 -- Sử dụng having để xét điều kiện điểm trung bình các môn học phải lớn hơn 15
 SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) > 15;