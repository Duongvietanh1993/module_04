CREATE DATABASE session_02_bt;
drop database session_02;
USE session_02;

CREATE TABLE phieuxuat(
soPX INT PRIMARY KEY AUTO_INCREMENT,
ngay_xuat DATE
);

CREATE TABLE vattu(
maVTu INT PRIMARY KEY AUTO_INCREMENT,
tenVTu VARCHAR(50)
);

CREATE TABLE chitietphieuxuat(
id_phieuxuat INT,
FOREIGN KEY(id_phieuxuat)REFERENCES phieuxuat(soPX),
id_maVTu INT,
FOREIGN KEY(id_maVTu)REFERENCES vattu(maVTu),
PRIMARY KEY(id_phieuxuat,id_maVTu),
DGxuat FLOAT,
SLxuat INT
);

CREATE TABLE phieunhap(
soPN INT PRIMARY KEY AUTO_INCREMENT,
ngaynhap DATE
);

CREATE TABLE chitietphieunhap(
id_phieunhap INT,
FOREIGN KEY(id_phieunhap)REFERENCES phieunhap(soPN),
id_maVTu INT,
FOREIGN KEY(id_maVTu)REFERENCES vattu(maVTu),
PRIMARY KEY(id_phieunhap,id_maVTu),
DGnhap FLOAT,
SLnhap INT
);
create table donDH(
soDH int primary key auto_increment,
ngayDH date
);

create table chitietdathang(
id_maVTu INT,
FOREIGN KEY(id_maVTu)REFERENCES vattu(maVTu),
id_donDH int,
foreign key(id_donDH)references donDH(soDH)
);

create table nhaCC(
maNCC int primary key auto_increment,
tenNCC varchar(50),
diachi text,
sdt varchar(20)
);

