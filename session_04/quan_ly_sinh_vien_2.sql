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
sub_id int not null,
foreign key(sub_id) references subject(sub_id),
student_id int not null,
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
INSERT INTO mark (sub_id, student_id, mark) VALUES
(1, 1, 15),
(2, 3, 10),
(1, 2, 9),
(1, 1, 20),
(2, 3, 18),
(1, 2, 19);
  
  -- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
 SELECT *
FROM subject
WHERE credit = (
  SELECT MAX(credit)
  FROM subject
);
  
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT s.sub_name, m.mark
FROM subject s
JOIN mark m ON m.sub_id = s.sub_id
WHERE m.mark = (
  SELECT MAX(mark)
  FROM mark
);

SELECT 
    s.sub_name, m.mark
FROM
    subject s
        JOIN
    mark m ON m.sub_id = s.sub_id
GROUP BY s.sub_name , m.mark
HAVING m.mark = (SELECT 
        MAX(mark)
    FROM
        mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.student_name, AVG(m.mark) AS 'Điểm trung bình'
FROM student s
JOIN mark m ON m.student_id = s.student_id
GROUP BY s.student_name
ORDER BY AVG(m.mark) DESC;