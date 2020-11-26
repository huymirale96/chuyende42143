create database hoiTroMotCua

create table tblNhanVien (
iMaNhanVien int identity(1,1) primary key not null,
stenNV Nvarchar(30),	
sSoDienThoai nvarchar(20),
bTrangThai int default 1,
iQuyen int,
sDiachi Nvarchar(30),
sUserName NVARCHAR(20),
sPass VARCHAR(100)
);


Create Table tblLoaiGiayToNhan
( 
iMaLoaiGiayToNhan int identity(1,1) primary key not null,
sTenLoaiGiayToNhan Nvarchar(50) null,
);

Create Table tblLoaiGiayToTra
( 
iMaLoaiGiayToTra int identity(1,1) primary key not null,
sTenLoaiGiayToTra Nvarchar(50) null,
iTienPhi int
);

Create Table tblLoaiHoSo
( 
iMaLoaiHoSo int identity(1,1) primary key not null,
sTenLoaiHoSo Nvarchar(50) null,
);

Create Table tblCongDan
( 
iMaCongDan int identity(1,1) primary key not null,
sTenCongDan Nvarchar(50) null,
sDiaChi Nvarchar(50) null,
sSDT Nvarchar(50) null,
sCanCuoc nvarchar(50) null,
);





create table tblHoSo (
iMaHoSo int identity(1,1) primary key not null,
iMaloaiHoSo int not null,	
iMaCongDan int not null,
bTrangThai bit default 0,
dNgayTao datetime,
dNgayHen datetime,
);


Alter Table tblHoSo add Foreign Key (iMaLoaiHoSo) References tblLoaiHoSo (iMaLoaiHoSo);

Alter Table tblHoSo add Foreign Key (iMaCongDan) References tblCongDan (iMaCongDan);

create table tblChiTiethoSoGiayToTra(
id int identity(1,1) primary key not null,
iMaHoSo int not null,
iMaGiayToTra int  not null,
iSoLuong int,
sGhichu nvarchar(200)
);


create table tblChiTiethoSoGiayTonhan(
id int identity(1,1) primary key not null,
iMaHoSo int not null,
iMaGiayToNhan int  not null,
sMaSoGiayTo nvarchar(20),
sGhichu nvarchar(200)
);

ALTER TABLE tblChiTiethoSoGiayTonhan ADD-- CONSTRAINT PK_HNHH PRIMARY KEY(iMaHoSo, iMaGiayToNhan),
CONSTRAINT FK_1 FOREIGN KEY (iMaHoSo) REFERENCES tblHoSo(iMaHoSo),
CONSTRAINT FK_2 FOREIGN KEY (iMaGiayToNhan) REFERENCES tblLoaiGiayToNhan(imaloaigiaytonhan)


ALTER TABLE tblChiTiethoSoGiayToTra ADD --CONSTRAINT PK_HNHH2 PRIMARY KEY(iMaHoSo, iMaGiayToTra),
CONSTRAINT FK_12 FOREIGN KEY (iMaHoSo) REFERENCES tblHoSo(iMaHoSo),
CONSTRAINT FK_22 FOREIGN KEY (iMaGiayToTra) REFERENCES tblLoaiGiayToTra(imaloaigiaytotra)

create proc sp_themLoaiGTnhan
@ten Nvarchar(50)
as
insert into tblLoaiGiayToNhan(sTenLoaiGiayToNhan) values (@ten);

alter proc sp_themLoaiGTtra
@ten Nvarchar(50),
@tien int
as
insert into tblLoaiGiayToTra(sTenLoaiGiayToTra,iTienPhi) values (@ten,@tien);

create proc sp_themLoaiHoSo
@ten Nvarchar(50)
as
insert into tblLoaiHoSo(sTenLoaiHoSo) values (@ten);


create proc sp_suaLoaiGTnhan
@maLoai int,
@ten nvarchar(50)
as
update tblLoaiGiayToNhan set sTenLoaiGiayToNhan = @ten where iMaLoaiGiayToNhan =  @maLoai


create proc sp_suaLoaiHoSo
@maLoai int,
@ten nvarchar(50)
as
update tblLoaiHoSo set sTenLoaiHoSo = @ten where iMaLoaiHoSo =  @maLoai


create proc sp_suaLoaiGTtra
@maLoai int,
@ten nvarchar(50),
@tien int
as
update tblLoaiGiayToTra set sTenLoaiGiayToTra = @ten, iTienPhi= @tien where iMaLoaiGiayToTra =  @maLoai

create proc sp_xoaLoaiGTnhan
@maLoai int
as
delete from tblLoaiGiayToNhan where iMaLoaiGiayToNhan = @maLoai

create proc sp_xoaLoaiGTtra
@maLoai int
as
delete from tblLoaiGiayToTra where iMaLoaiGiayToTra = @maLoai

create proc sp_xoaLoaiHoSo
@maLoai int
as
delete from tblLoaiHoSo where iMaLoaiHoSo = @maLoai

create proc sp_dsLoaiGTtra
as
select ROW_NUMBER() OVER (ORDER BY imaloaigiaytotra)  as STT, iMaLoaiGiayToTra, sTenLoaiGiayToTra as N'Tên Loại', iTienPhi as N'Tiền Phí' 
from tblLoaiGiayToTra

create proc sp_dsLoaiGTnhan
as
select ROW_NUMBER() OVER (ORDER BY iMaLoaiGiayToNhan)  as STT, iMaLoaiGiayToNhan, sTenLoaiGiayToNhan as N'Tên Loại'
from tblLoaiGiayToNhan

create proc sp_dsLoaiHoSO
as
select ROW_NUMBER() OVER (ORDER BY iMaLoaiHoSo)  as STT, iMaLoaiHoSo, sTenLoaiHoSo as N'Tên Loại' 
from tblLoaiHoSo


create proc sp_dsLoaiHS
as
select * from tblLoaiHoSo


create proc sp_dsLoaiGTnhan_
as
select * from tblLoaiGiayToTra

create proc sp_dsLoaiGTnhan_
as
select * from tblLoaiGiayToNhan

alter proc sp_taoHoSo
@thoiGian datetime,
@maHoSo int out
as
insert into tblHoSo( dngaytao,iMaCongDan, iMaloaiHoSo) OUTPUT INSERTED.iMaHoSo as id values (@thoigian,1,1) 
 set @maHoSo = SCOPE_IDENTITY()
return @maHoSo;





Create proc sp_taophieuNhaphang  --- sp_taodonnPhieuhang
@iMaNhanVien int,
@thoigian datetime,
@imaphieuNhap int out
as
insert into tblphieuNhapHang (iMaNhanVien, dThoiGian) OUTPUT INSERTED.iMaphieuNhapHang as id values (@iMaNhanVien,@thoigian) 
 set @imaphieuNhap = SCOPE_IDENTITY()
return @imaphieuNhap;



create proc sp_taoTTcongDan_  --- sp_taodonnPhieuhang
@ten nvarchar(50),
@sdt nvarchar(50),
@diachi nvarchar(50),
@cancuoc nvarchar(50),
@maCongDan int out
as
insert into tblCongDan(sTenCongDan, sDiaChi, sSDT,sCanCuoc) OUTPUT INSERTED.iMaCongDan as id values (@ten, @diachi, @sdt,@cancuoc) 
 set @maCongDan = SCOPE_IDENTITY()
return @maCongDan;


create proc sp_themChiTietGTNhan
@maHoSo int,
@maLoaiGT int,
@maSo nvarchar(20),
@ghiChu nvarchar(200)
as
insert into tblChiTiethoSoGiayTonhan(iMaHoSo, iMaGiayToNhan, sMaSoGiayTo, sGhichu) values 
(@maHoSo, @maLoaiGT, @maso, @ghiChu);

alter table tblhoso add sghichu nvarchar(200)

create proc sp_updateHoSo_
@id int,
@maCongDan int,
@maLoai int,
@ghichu nvarchar(200),
@tgHen datetime
as
update tblHoSo set iMaCongDan = @maCongDan, iMaloaiHoSo = @maLoai, dNgayHen = @tgHen, sghichu = @ghichu
where iMaHoSo = @id

create proc sp_themChiTietGTTra
@maHoSo int,
@maLoaiGT int,
@soLuong int,
@ghiChu nvarchar(200)
as
insert into tblChiTiethoSoGiayToTra(iMaHoSo, iMaGiayToTra, iSoLuong , sGhichu) values 
(@maHoSo, @maLoaiGT, @soLuong, @ghiChu);

create proc sp_suaChiTietGTTra
@id int,
@maHoSo int,
@maLoaiGT int,
@soLuong int,
@ghiChu nvarchar(200)
as
update tblChiTiethoSoGiayToTra set iMaHoSo = @maHoSo, iMaGiayToTra = @maLoaiGT, iSoLuong = @soLuong, sGhichu = @ghiChu
where id = @id

create proc sp_suaChiTietGTNhan
@id int,
@maHoSo int,
@maLoaiGT int,
@maso nvarchar(20),
@ghiChu nvarchar(200)
as
update tblChiTiethoSoGiayToNhan set iMaHoSo = @maHoSo, iMaGiayToNhan = @maLoaiGT, sMaSoGiayTo = @maso, sGhichu = @ghiChu
where id = @id

create proc sp_xoaChiTietGTnhan
@id int
as
delete from tblChiTiethoSoGiayTonhan where id = @id

create proc sp_xoaChiTietGTtra
@id int
as
delete from tblChiTiethoSoGiayToTra where id = @id

alter proc sp_dsHoSo
as
select ROW_NUMBER() OVER (ORDER BY tblHoSo.iMaHoSo)  as STT,N'HS' +CONVERT(varchar(10),tblHoSo.iMaHoSo) as N'Mã Hồ Sơ', tblHoSo.iMaHoSo, tblHoSo.dNgayTao as N'Ngày Tạo',tblHoSo.dNgayHen as N'Ngày Hẹn', tblCongDan.sTenCongDan as N'Công Dân',
 tblLoaiHoSo.sTenLoaiHoSo as N'Loại Hồ Sơ', sum(tblLoaiGiayToTra.iTienPhi * tblChiTiethoSoGiayToTra.iSoLuong) as N'Tiền Phí', tblHoSo.sGhichu as N'Ghi Chú',tblHoSo.btrangthai,  IIF(tblHoSo.btrangthai = 0, N'Đã Tiếp Nhận Hồ Sơ', N'Đã Trả Hồ Sơ Và Thu Tiền') as N'Trạng Thái'
from tblChiTiethoSoGiayToTra, tblCongDan, tblHoSo, tblLoaiHoSo, tblLoaiGiayToTra
where tblChiTiethoSoGiayToTra.iMaHoSo = tblHoSo.iMaHoSo and tblChiTiethoSoGiayToTra.iMaGiayToTra = tblLoaiGiayToTra.iMaLoaiGiayToTra and
tblHoSo.iMaCongDan = tblCongDan.iMaCongDan and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo

group by tblHoSo.iMaHoSo, tblHoSo.dNgayHen, tblHoSo.dNgayTao,tblLoaiHoSo.sTenLoaiHoSo,
tblCongDan.sTenCongDan ,tblHoSo.sGhichu, tblHoSo.bTrangThai

select * from tblChiTiethoSoGiayTonhan
select * from tblChiTiethoSoGiayToTra

alter proc sp_dsChiTietGTtra
@maHoSo int
as
 select ROW_NUMBER() OVER (ORDER BY tblChiTiethoSoGiayToTra.id)  as STT, id, sTenLoaiGiayToTra as N'Giấy Tờ' , iSoLuong as N'Số Lượng',iTienPhi as N'Tiền Phí', sGhichu as N'Ghi Chú', iMaLoaiGiayToTra
 from tblChiTiethoSoGiayToTra, tblLoaiGiayToTra where tblChiTiethoSoGiayToTra.iMaGiayToTra  = tblLoaiGiayToTra.iMaLoaiGiayToTra
and tblChiTiethoSoGiayToTra.iMaHoSo = @maHoSo

select * from tblChiTiethoSoGiayToTra

create proc sp_dsChiTietGTnhan
@maHoSo int
as
 select ROW_NUMBER() OVER (ORDER BY tblChiTiethoSoGiayTonhan.id)  as STT, id, sTenLoaiGiayToNhan as N'Giấy Tờ' , sMaSoGiayTo as N'Mã/Số', sGhichu as N'Ghi Chú', iMaGiayToNhan
 from tblChiTiethoSoGiayTonhan, tblLoaiGiayToNhan where tblChiTiethoSoGiayTonhan.iMaGiayToNhan  =  tblLoaiGiayToNhan.iMaLoaiGiayToNhan
and tblChiTiethoSoGiayTonhan.iMaHoSo = @maHoSo

create proc sp_xoahs
@ma int
as
delete from tblChiTiethoSoGiayTonhan where iMaHoSo = @ma
delete from tblChiTiethoSoGiayToTra where iMaHoSo = @ma
delete from tblHoSo where iMaHoSo = @ma


create proc sp_layThongTinHoSo
@id int
as
select * from tblHoSo, tblCongDan where tblHoSo.iMaCongDan =  tblCongDan.iMaCongDan
and tblHoSo.iMaHoSo = @id


create proc sp_updateCongDan
@id int,
@ten nvarchar(50),
@diachi nvarchar(50),
@sdt nvarchar(50),
@cancuoc nvarchar(50)
as
update tblCongDan set sCanCuoc = @cancuoc, sDiaChi = @diachi, sSDT = @sdt, sTenCongDan = @ten
where iMaCongDan = @id


create proc sp_updateTrahoSo
@id int
as
update tblHoSo set bTrangThai = 1
where iMaHoSo = @id



alter proc sp_timHoSo
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblHoSo.iMaHoSo)  as STT,N'HS' +CONVERT(varchar(10),tblHoSo.iMaHoSo) as N'Mã Hồ Sơ', tblHoSo.iMaHoSo, tblHoSo.dNgayTao as N'Ngày Tạo',tblHoSo.dNgayHen as N'Ngày Hẹn', tblCongDan.sTenCongDan as N'Công Dân',
 tblLoaiHoSo.sTenLoaiHoSo as N'Loại Hồ Sơ', sum(tblLoaiGiayToTra.iTienPhi * tblChiTiethoSoGiayToTra.iSoLuong) as N'Tiền Phí', tblHoSo.sGhichu as N'Ghi Chú',tblHoSo.btrangthai,  IIF(tblHoSo.btrangthai = 0, N'Đã Tiếp Nhận Hồ Sơ', N'Đã Trả Hồ Sơ Và Thu Tiền') as N'Quyền'
from tblChiTiethoSoGiayToTra, tblCongDan, tblHoSo, tblLoaiHoSo, tblLoaiGiayToTra
where tblChiTiethoSoGiayToTra.iMaHoSo = tblHoSo.iMaHoSo and tblChiTiethoSoGiayToTra.iMaGiayToTra = tblLoaiGiayToTra.iMaLoaiGiayToTra and
tblHoSo.iMaCongDan = tblCongDan.iMaCongDan and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo and tblHoSo.iMaHoSo = @id
group by tblHoSo.iMaHoSo, tblHoSo.dNgayHen, tblHoSo.dNgayTao,tblLoaiHoSo.sTenLoaiHoSo,
tblCongDan.sTenCongDan ,tblHoSo.sGhichu, tblHoSo.bTrangThai

select * from tblLoaiHoSo

alter proc sp_thongKeHoSoTHeoNgay
@ngaybatdau datetime,
@ngayketthuc datetime
as
select sTenLoaiHoSo, count(iMaHoSo) as soLuong from tblHoSo, tblLoaiHoSo where dNgayTao >= @ngaybatdau and dNgayTao <= @ngayketthuc
and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo
group by sTenLoaiHoSo

alter proc sp_thongKeHoSoTHeoNgay_1
@ngaybatdau datetime,
@ngayketthuc datetime
as
select ROW_NUMBER() OVER (ORDER BY tblhoso.imaloaihoso)  as STT, sTenLoaiHoSo  as N'Tên Loại Hồ Sơ', count(iMaHoSo) as  N'Số Lượng' from tblHoSo, tblLoaiHoSo where dNgayTao >= @ngaybatdau and dNgayTao <= @ngayketthuc
and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo
group by sTenLoaiHoSo,tblhoso.imaloaihoso

exec sp_thongKeHoSoTHeoNgay 3 ,'01/11/2020','11/11/2020'

select * from tblHoSo

01/11/2020



create proc sp_thongKeHoSo_1
@ngaybatdau datetime,
@ngayketthuc datetime
as
select ROW_NUMBER() OVER (ORDER BY tblHoSo.iMaHoSo)  as STT,N'HS' +CONVERT(varchar(10),tblHoSo.iMaHoSo) as N'Mã Hồ Sơ', tblHoSo.iMaHoSo, tblHoSo.dNgayTao as N'Ngày Tạo',tblHoSo.dNgayHen as N'Ngày Hẹn', tblCongDan.sTenCongDan as N'Công Dân',
 tblLoaiHoSo.sTenLoaiHoSo as N'Loại Hồ Sơ', sum(tblLoaiGiayToTra.iTienPhi * tblChiTiethoSoGiayToTra.iSoLuong) as N'Tiền Phí', tblHoSo.sGhichu as N'Ghi Chú',tblHoSo.btrangthai,  IIF(tblHoSo.btrangthai = 0, N'Đã Tiếp Nhận Hồ Sơ', N'Đã Trả Hồ Sơ Và Thu Tiền') as N'Quyền'
from tblChiTiethoSoGiayToTra, tblCongDan, tblHoSo, tblLoaiHoSo, tblLoaiGiayToTra
where tblChiTiethoSoGiayToTra.iMaHoSo = tblHoSo.iMaHoSo and tblChiTiethoSoGiayToTra.iMaGiayToTra = tblLoaiGiayToTra.iMaLoaiGiayToTra and
tblHoSo.iMaCongDan = tblCongDan.iMaCongDan and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo and tblHoSo.dNgayTao >= @ngaybatdau and tblHoSo.dNgayTao <= @ngayketthuc
group by tblHoSo.iMaHoSo, tblHoSo.dNgayHen, tblHoSo.dNgayTao,tblLoaiHoSo.sTenLoaiHoSo,
tblCongDan.sTenCongDan ,tblHoSo.sGhichu, tblHoSo.bTrangThai