CREATE DATABASE QUANLYKHACHSAN


CREATE TABLE dbo.tblloaiphong(
	maloai nvarchar(50) NOT NULL primary key,
	gia nvarchar(50) NOT NULL)


CREATE TABLE dbo.tblphong(
	maphong nvarchar(50) NOT NULL primary key,
	maloai nvarchar(50) NOT NULL foreign key references tblloaiphong(maloai),
	dadat nvarchar(50),
	danhan nvarchar(50))


CREATE TABLE dbo.tbldatphong(
	mapd nvarchar(50) NOT NULL primary key,
	maphong nvarchar(50) NOT NULL foreign key references tblphong(maphong))


CREATE TABLE dbo.tbldichvu(
	madv nvarchar(50) NOT NULL primary key,
	tendv nvarchar(50),
	gia nvarchar(50),
	donvitinh nvarchar(50))


CREATE TABLE dbo.tblphieuthuephong(
	mapt nvarchar(50) NOT NULL primary key,
	mapd nvarchar(50) NOT NULL foreign key references tbldatphong(mapd),
	manv nvarchar(50))


CREATE TABLE dbo.tblctthuephong(
	mapt nvarchar(50) NOT NULL foreign key references tblphieuthuephong(mapt),
	maphong nvarchar(50) NOT NULL foreign key references tblphong(maphong),
	ngay nvarchar(50) NOT NULL,
	madv nvarchar(50) NOT NULL foreign key references tbldichvu(madv),
	soluong nvarchar(50)
	Constraint pk_thuephong primary key(mapt,maphong,madv))


CREATE TABLE dbo.tblvattu(
	mavattu nvarchar(50) NOT NULL primary key,
	tenvattu nvarchar(50))


CREATE TABLE dbo.tblctvattu(
	mavattu nvarchar(50) NOT NULL foreign key references tblvattu(mavattu),
	maloai nvarchar(50) NOT NULL foreign key references tblloaiphong(maloai) ,
	soluong nvarchar(50))


CREATE TABLE dbo.tblkhachhang(
	makh nvarchar(50) NOT NULL primary key,
	tenkh nvarchar(50),
	gioitinh nvarchar(50),
	ngaysinh nvarchar(50),
	cmnd nvarchar(50),
	diachi nvarchar(50),
	sdt nvarchar(50),
	ghichu nvarchar(50))


CREATE TABLE dbo.tblhoadon(
	mahd nvarchar(50) NOT NULL primary key,
	ngaythanhtoan nvarchar(50))


CREATE TABLE dbo.tblcthoadon(
	mahd nvarchar(50) NOT NULL foreign key references tblhoadon(mahd),
	tongtien nvarchar(50),
	mapt nvarchar(50) NOT NULL foreign key references tblphieuthuephong(mapt),
	makh nvarchar(50) NOT NULL foreign key references tblkhachhang(makh),
	manv nvarchar(50),
	Constraint pk_hd primary key(mahd,mapt,makh))


CREATE TABLE dbo.tblnhanvien(
	manv nvarchar(50) NOT NULL primary key,
	tennv nvarchar(50),
	gioitinh nvarchar(50),
	ngaysinh nvarchar(50),
	sdt nvarchar(50),
	diachi nvarchar(50),
	chucvu nvarchar(50))


CREATE TABLE dbo.tblctdatphong(
	mapd nvarchar(50) NOT NULL foreign key references tbldatphong(mapd),
	makh nvarchar(50) NOT NULL foreign key references tblkhachhang(makh),
	ngayden nvarchar(50),
	ngaydi nvarchar(50),
	sotiendat nvarchar(50),
	username nvarchar(50),
	tinhtrang nvarchar(50),
	songuoi nvarchar(50)
	Constraint pk_ctdatphong primary key(mapd,makh))



CREATE TABLE dbo.tbltrangthaiphong(
	maphong nvarchar(50) NOT NULL foreign key references tblphong(maphong),
	trangthai nvarchar(50) NOT NULL)


CREATE TABLE dbo.tbluser(
	username nvarchar(50) NOT NULL primary key,
	manv nvarchar(50) NOT NULL foreign key references tblnhanvien(manv),
	password nvarchar(50) NOT NULL,
	permision nvarchar(50) NOT NULL)

---Test query---
SELECT * FROM tbltrangthaiphong WHERE trangthai = N'Rảnh'

