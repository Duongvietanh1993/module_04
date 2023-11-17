create database studen_test;

create table test(
test_id int primary key auto_increment,
name varchar(60)
);

create table student_test(
rn int,
foreign key(rn)references student(rn),
test_id int,
foreign key(test_id) references test(test_id),
primary key(rn,test_id),
date_test date,
mark int
);

create table student(
rn int primary key auto_increment,
name varchar(60),
age int,
status bit(1)
);

insert into student(name, age) values
('Nguyen Hong Ha',20),
('Truong Ngoc Anh',30),
('Tuan Minh',25),
('Dan Truong',22);

insert into test(name) values
('EPC'),
('DWMX'),
('SQL1'),
('SQL2');

insert INTO student_test(rn,test_id,date_test,mark) values
(1,1,'2006-07-17',8),
(1,2,'2006-07-18',5),
(1,3,'2006-07-19',7),
(2,1,'2006-07-17',7),
(2,2,'2006-07-18',4),
(2,3,'2006-07-19',2),
(3,1,'2006-07-17',10),
(3,2,'2006-07-18',1);

-- Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55
alter table student
add constraint age check(age>15 and age<55);
-- Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0
ALTER TABLE student_test
ALTER COLUMN mark SET DEFAULT 0;
-- Thêm khóa chính cho bảng studenttest là (RN,TestID)
ALTER TABLE student_test
add primary key (rn,test_id);
-- Thêm ràng buộc duy nhất (unique) cho cột name trên bảng Test
ALTER TABLE test
modify column name varchar(60) unique;
-- Xóa ràng buộc duy nhất (unique) trên bảng Test
ALTER TABLE test
DROP INDEX name;

-- Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó, điểm thi và ngày thi giống như hình sau
select s.name, t.name,st.mark,st.date_test
from student s
join student_test st on st.rn=s.rn
join test t on t.test_id= st.test_id
group by s.name, t.name,st.mark,st.date_test;

-- Hiển thị danh sách các bạn học viên chưa thi môn nào như hình sau
select * from student s
left join student_test st on st.rn=s.rn
where st.rn is null;

-- Hiển thị danh sách học viên phải thi lại, tên môn học phải thi lại và điểm thi(điểm phải thi lại là điểm nhỏ hơn 5) như sau
 select  s.name,t.name,st.mark,st.date_test
 from student s
join student_test st on st.rn=s.rn
join test t on t.test_id= st.test_id
group by s.name, t.name,st.mark,st.date_test
having st.mark<5;

-- Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi. Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần(nếu không sắp xếp thì chỉ được ½ số điểm) như sau:
 select  s.rn,s.name,avg(st.mark) as average
 from student_test st
 join student s on s.rn=st.rn
 group by s.rn,s.name;
 
 -- Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất như sau:
 
SELECT s.rn, s.name, AVG(st.mark) AS average
FROM student_test st
JOIN student s ON s.rn = st.rn
GROUP BY s.rn, s.name
HAVING AVG(st.mark) >= (SELECT AVG(mark) FROM student_test);

-- Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học như sau:
select t.test_id, t.name,max(st.mark) as max_mark
from test t
join student_test st on st.test_id=t.test_id
group by  t.test_id, t.name;

-- Hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null:
select s.name, t.name
from student s
left join student_test st on st.rn = s.rn
left join test t on t.test_id= st.test_id
group by s.name, t.name;

-- Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi.
update student 
set age =age+1;

-- Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student
alter table student 
modify column status varchar(10);
 -- Cập nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, trường hợp còn lại nhận giá trị ‘Old’ sau đó hiển thị toàn bộ nội dung bảng Student
select rn,name,age,if(status=1,'young','old') from student ;
-- Hiển thị danh sách học viên và điểm thi, dánh sách phải sắp xếp tăng dần theo ngày thi như sau
SELECT s.rn, s.name, t.name, st.mark, st.date_test
FROM student s
JOIN student_test st ON st.rn = s.rn
JOIN test t ON t.test_id = st.test_id
ORDER BY st.date_test ASC;

-- Hiển thị các thông tin sinh viên có tên bắt đầu bằng ký tự ‘T’ và điểm thi trung bình >4.5. Thông tin bao gồm Tên sinh viên, tuổi, điểm trung bình

 select  s.rn,s.name,avg(st.mark) as average
 from student_test st
 join student s on s.rn=st.rn
 group by s.rn,s.name
 having s.name like 't%' and avg(st.mark)>4.5;
 
 -- Hiển thị các thông tin sinh viên (Mã, tên, tuổi, điểm trung bình, xếp hạng). Trong đó, xếp hạng dựa vào điểm trung bình của học viên, điểm trung bình cao nhất thì xếp hạng 1
 SELECT s.rn, s.name, s.age, AVG(st.mark) AS average_score,
       RANK() OVER (ORDER BY AVG(st.mark) DESC) AS ranking
FROM student s
JOIN student_test st ON st.rn = s.rn
GROUP BY s.rn, s.name, s.age
ORDER BY average_score DESC;

-- Sủa đổi kiểu dữ liệu cột name trong bảng student thành nvarchar(max)
alter table student modify name nvarchar(1111);

-- Cập nhật (sử dụng phương thức write) cột name trong bảng student với yêu cầu sau
UPDATE student
SET name = CONCAT(
    CASE WHEN age > 20 THEN 'Old ' ELSE 'Young ' END,
    name
);

-- Xóa tất cả các môn học chưa có bất kỳ sinh viên nào thi
DELETE FROM course
WHERE course_id NOT IN (SELECT test_id FROM student_test);

-- Xóa thông tin điểm thi của sinh viên có điểm <5
DELETE FROM student_test
WHERE mark < 5;