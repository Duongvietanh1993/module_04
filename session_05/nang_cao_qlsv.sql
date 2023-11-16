create database nang_cao_QLSV;
use nang_cao_QLSV;

create table classe(
class_id int primary key auto_increment,
class_name varchar(30) not null
);

create table students(
student_id int primary key auto_increment,
student_name varchar(30) not null,
age int not null,
email varchar(30) not null
);

create table class_student(
student_id int ,
foreign key(student_id) references students(student_id),
class_id int ,
foreign key(class_id) references classe(class_id),
primary key(student_id,class_id)
);

create table subject(
subject_id int primary key auto_increment,
subject_name varchar(50) not null
);
create table mark(
mark int ,
subject_id int,
foreign key(subject_id)references subject(subject_id),
student_id int ,
foreign key(student_id) references students(student_id),
primary key(subject_id,student_id)
);

-- Chèn dữ liệu vào bảng classe
INSERT INTO classe (class_name) VALUES
  ('Lớp A'),
  ('Lớp B'),
  ('Lớp C');

-- Chèn dữ liệu vào bảng students
INSERT INTO students (student_name, age, email) VALUES
  ('Nguyễn Văn A', 20, 'nguyenvana@example.com'),
  ('Trần Thị B', 22, 'tranthib@example.com'),
  ('Lê Văn C', 21, 'levanc@example.com'),
  ('Viet Anh', 20, 'beo@example.com'),
  ('Minh Huy', 22, 'huy@example.com'),
  ('Tung', 21, 'tataus@example.com');

-- Chèn dữ liệu vào bảng class_student
INSERT INTO class_student (student_id, class_id) VALUES
  (1, 1),
  (2, 1),
  (3, 2),
  (3, 3);

-- Chèn dữ liệu vào bảng subject
INSERT INTO subject (subject_name) VALUES
  ('Toán học'),
  ('Văn học'),
  ('Lịch sử');

-- Chèn dữ liệu vào bảng mark
INSERT INTO mark (mark, subject_id, student_id) VALUES
  (8, 1, 1),
  (7, 2, 1),
  (9, 3, 1),
  (6, 1, 2),
  (8, 2, 2),
  (7, 3, 2),
  (9, 1, 3),
  (8, 2, 3),
  (7, 3, 3);
  
-- Hien thi danh sach tat ca cac hoc vien
select * from students;
-- Hien thi danh sach tat ca cac mon hoc
select * from subject;
-- Tinh diem trung binh học sinh
select s.student_id,s.student_name,avg(m.mark) as 'Điểm trung bình'
from mark m
join students s on m.student_id=s.student_id
group by s.student_id,s.student_name;
-- Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select s.student_id,s.student_name, m.mark
from mark m
join students s on m.student_id=s.student_id
group by s.student_id,s.student_name,m.mark
having m.mark >= all(select mark from mark);
-- Danh so thu tu cua diem theo chieu giam
select * from mark
order by mark desc ;
-- Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
alter table subject modify subject_name nvarchar(1111);
-- Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
update subject set subject_name = concat('Đây là muôn học ',subject_name);
-- Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table student 
add constraint age check(age>15 and age<50);
-- Loai bo tat ca quan he giua cac bang
alter table class_student drop constraint class_student_ibfk_1;
alter table class_student drop constraint class_student_ibfk_2;
alter table mark drop constraint mark_ibfk_1;
alter table mark drop constraint mark_ibfk_2;
-- Xoa hoc vien co StudentID la 1
delete from students where student_id =1 ;
-- Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
ALTER TABLE Student
ADD Status bit DEFAULT 1;
-- Cap nhap gia tri Status trong bang Student thanh 0
UPDATE Student
SET Status = 0;