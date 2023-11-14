create table customer(
cid int primary key auto_increment,
cname varchar(50),
cage int
);

create table orders(
oid int primary key auto_increment,
cid int,
foreign key(cid)references customer(cid),
odate date,
otatalprice float
);

create table product(
pid int primary key auto_increment,
pname varchar(50),
pprice float
);

create table orderDetail(
oid int,
foreign key(oid)references orders(oid),
pid int,
foreign key(pid)references product(pid),
odQTY int
);