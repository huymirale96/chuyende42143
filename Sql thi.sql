create database quanLyCoiThiChamThi

create table tblCanBo (
iMaCanBo int identity(1,1) primary key not null,
sTenGiangVien Nvarchar(30),	
sSoDienThoai nvarchar(20),
sEmail nvarchar(20),
sDiaChi nvarchar(50)
);

create table tblHocPhan (
iMaHocPhan int identity(1,1) primary key not null,
 stenHocPhan nvarchar(30)	
);

--   alter table tblCanBo add sDiaChi nvarchar(50)

create table tblCaThi (
iHocPhan int identity(1,1) primary key not null,
sTenCaThi varchar(5)	
);

create table tblPhongHoc (
iMaPhongHoc int identity(1,1) primary key not null,
sTenPhong varchar(30),	
);

create table tblCaThi (
iMaCaThi int identity(1,1) primary key not null,
sTenCaThi varchar(30),	
);

create table tblPhongThiChamThi (
iMaPhongThiChamThi int identity(1,1) primary key not null,
iMaHoiDong int not null,
iMaHocPhan int not null,
iMaPhongHoc int not null,
dNgayThi date,
iMaCaThi int,
sMaDanhSachThi varchar(20)
);

Alter Table tblPhongThiChamThi add Foreign Key (iMaCaThi) References tblCaThi (iMaCaThi);

create table tblHoiDong (
iMaHoiDong int identity(1,1) primary key not null,
sTenHoiDong varchar(60),	
dNgayBatDau date,
dNgayKetThuc date,
iChuTich int not null,
iThuKy int not null,
iGiamSat int not null,
dThoiGianTao datetime,
bLoaiHoiDong bit
);

alter table tblHoiDong alter column sTenHoiDong nvarchar(60)

create table tblPhanCongCanBo (
iMaPhanCong int identity(1,1) primary key not null,
iMaHoiDong int not null,
iMaCa int not null,
iMaPhongHoc int not null,
iMaCanBo int not null,
dNgay date,
iTienCong int default 0
);

select * from drop table tblHoiDongCanBo

Alter Table tblHoiDong alter column sTenHoiDong nvarchar(60)

Alter Table tblHoiDong add bLoaiHoiDong bit

Alter Table tblPhanCongCanBo add Foreign Key (iMaPhongHoc) References tblPhonghoc (iMaPhongHoc);
Alter Table tblPhanCongCanBo add Foreign Key (iMaHoiDong) References tblHoiDong (iMaHoiDong);
Alter Table tblPhanCongCanBo add Foreign Key (iMaCa) References tblCaThi (iMaCaThi);
Alter Table tblPhanCongCanBo add Foreign Key (iMaCanBo) References tblCanBo (iMaCanBo);



--alter table tblHoiDong add iMaCanBoTaoHoiDong int not null

--alter table tblHoiDong add dThoiGianTao datetime

--Alter Table tblHoiDong add Foreign Key (iMaCanBoTaoHoiDong) References tblcanbo (iMaCanBo);
Alter Table tblHoiDong add Foreign Key (iChuTich) References tblcanbo (iMaCanBo);
Alter Table tblHoiDong add Foreign Key (iThuKy) References tblcanbo (iMaCanBo);
Alter Table tblHoiDong add Foreign Key (iGiamSat) References tblcanbo (iMaCanBo);


create table tblPhongThiCanBo (
iMaCanBo int not null,
iMaPhongThiChamThi int not null,
iTienCong int default 0
);

ALTER TABLE tblPhongThiCanBo ADD CONSTRAINT PK_HNHH PRIMARY KEY(iMaCanBo, iMaPhongThiChamThi),
CONSTRAINT FK_1 FOREIGN KEY (iMaCanBo) REFERENCES tblCanBo(iMaCanBo),
CONSTRAINT FK_2 FOREIGN KEY (iMaPhongThiChamThi) REFERENCES tblPhongThiChamThi(iMaPhongThiChamThi)


alter proc sp_danhSachPhongHoc
as
select  ROW_NUMBER() OVER (ORDER BY iMaPhongHoc) AS  STT, iMaPhongHoc, sTenPhong as N'Phòng Học' from tblPhongHoc

create proc sp_suaPhongHoc
@maphonghoc int,
@tenphong varchar(20)
as
update tblPhongHoc set sTenPhong = @tenphong where iMaPhongHoc = @maphonghoc

create proc sp_themHocPhan
@tenhocphan nvarchar(30)
as
insert into tblHocPhan (stenHocPhan) values (@tenhocphan)

create proc sp_themPhongHoc
@tenphong nvarchar(30)
as
insert into tblPhongHoc(sTenPhong) values (@tenphong)

create proc sp_suaHocPhan
@maHocPhan int,
@tenhocphan nvarchar(30)
as
update tblHocPhan set stenHocPhan = @tenhocphan where iMaHocPhan = @maHocPhan

create proc sp_xoaHocPhan
@maHocPhan int
as
delete from tblHocPhan where iMaHocPhan = @maHocPhan

create proc sp_xoaPhongHoc
@maphonghoc int
as
delete from tblPhongHoc where iMaPhongHoc = @maphonghoc

alter proc sp_danhSachHocPhan
as
select  ROW_NUMBER() OVER (ORDER BY stenHocPhan) AS  STT,iMaHocPhan, stenHocPhan as N'Tên Học Phần' from tblHocPhan

create proc sp_layDanhSachCanBo
as
select * from tblCanBo


alter proc sp_dsCanBo
as
select  ROW_NUMBER() OVER (ORDER BY iMaCanBo) AS  STT,iMaCanBo,sTenGiangVien as N'Tên Giảng Viên', sSoDienThoai as N'Số Điện Thoại', sEmail as N'Email' , sDiaChi as N'Địa Chỉ' 
from tblCanBo


alter proc sp_themCanBo
@ten nvarchar(30),
@sdt varchar(20),
@mail varchar(20),
@diachi nvarchar(50)
as
insert into tblCanBo (sTenGiangVien,sSoDienThoai,sEmail,sdiachi) values
(@ten, @sdt,@mail,@diachi)



create proc sp_suaCanBo
@id int,
@ten nvarchar(30),
@sdt varchar(20),
@mail varchar(20),
@diachi nvarchar(50)
as
update tblCanBo set sTenGiangVien = @ten,sSoDienThoai = @sdt,sEmail = @mail, sdiachi =  @diachi where imacanbo = @id


create proc sp_xoaCanBo
@id int
as
delete from tblCanBo where iMaCanBo = @id


select * from tblHoiDong

create proc sp_themhoidong
@tenhoidong nvarchar(60),
@machutich int,
@mathuky int,
@magiamsat int,
@tungay date,
@denngay date,
@ngaytao datetime,
@loaihoidong bit
as
insert into tblHoiDong (stenhoidong, iChuTich, iGiamSat, iThuKy, dNgayBatDau, dNgayKetThuc,dThoiGianTao, bloaihoidong) values
(@tenhoidong, @machutich, @magiamsat,@mathuky, @tungay, @denngay, @ngaytao, @loaihoidong)

create proc sp_suahoidong
@id int,
@tenhoidong nvarchar(60),
@machutich int,
@mathuky int,
@magiamsat int,
@tungay date,
@denngay date,
@loaihoidong bit
as
update tblHoiDong set stenhoidong = @tenhoidong, iChuTich= @machutich, iGiamSat= @magiamsat, iThuKy=@mathuky, dNgayBatDau = @tungay, dNgayKetThuc=@denngay, bloaihoidong = @loaihoidong
where iMaHoiDong = @id



create proc sp_dsHoiDong  
as
select ROW_NUMBER() OVER (ORDER BY  a.iMaHoiDong) AS  STT, a.iMaHoiDong, a.stenhoidong as N'Tên Hội Đồng',IIF(a.bloaihoidong = 1, N'Coi Thi',N'Chấm Thi' ) as N'Loại Hội Đồng',a.dNgayBatDau  as N'Từ Ngày',a.dngayketthuc as N'Đến Ngày',a.dThoiGianTao  as N'Ngày Tạo', b.stengiangvien as N'Chủ Tịch', c.stengiangvien as N'Giám Sát', d.stengiangvien as N'Thư Ký'
 from 
(
(select  bLoaiHoiDong , dThoiGianTao, dNgayBatDau , dNgayKetThuc , iMaHoiDong, stenhoidong from tblHoiDong) a inner join
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iChuTich = tblCanBo.iMaCanBo) b on a.iMaHoiDong = b.iMaHoiDong
inner join 
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iGiamSat = tblCanBo.iMaCanBo) c on a.iMaHoiDong = c.iMaHoiDong
inner join
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iThuKy = tblCanBo.iMaCanBo) d on a.iMaHoiDong = d.iMaHoiDong
)

select * from tblCanBo

select * from tblPhongThiChamThi

alter proc sp_dsPhongThiChamThi
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblPhongThiChamThi.iMaPhongThiChamThi) AS  STT,tblPhongThiChamThi.iMaPhongThiChamThi,tblPhongThiChamThi.iMaCaThi, tblPhongThiChamThi.iMaPhongHoc, tblHocPhan.stenHocPhan as N'Tên Học Phần', tblPhongHoc.sTenPhong  as N'Phòng', tblCaThi.sTenCaThi  as N'Ca Thi', tblPhongThiChamThi.dNgayThi  as N'Ngày Thi' , tblPhongThiChamThi.sMaDanhSachThi  as N'Mã DS Thi' 
from tblPhongThiChamThi, tblHocPhan, tblCaThi, tblPhongHoc, tblHoiDong where tblPhongThiChamThi.iMaHoiDong = @id and tblPhongThiChamThi.iMaHocPhan = tblHocPhan.iMaHocPhan 
and tblPhongThiChamThi.iMaHoiDong = tblHoiDong.iMaHoiDong and tblPhongThiChamThi.iMaPhongHoc = tblPhongHoc.iMaPhongHoc and tblPhongThiChamThi.iMaPhongHoc = tblPhongHoc.iMaPhongHoc and tblCaThi.iMaCaThi = tblPhongThiChamThi.iMaCaThi

exec sp_dsHoiDong 

select * from tblHoiDong


create proc sp_themPhongThiChamThi
@maHoiDong int,
@maHocPhan int,
@maPhongHoc int,
@maCaThi int,
@ngayThi date,
@maDanhSachThi varchar(30)
as
insert into tblPhongThiChamThi (iMaHoiDong, iMaHocPhan, iMaPhongHoc, iMaCaThi, dNgayThi,sMaDanhSachThi) values
(@maHoiDong, @maHocPhan, @maPhongHoc, @maCaThi, @ngayThi, @maDanhSachThi) 


alter proc sp_themPhanCongCanBo
@maHoiDong int,
@maPhongHoc int,
@maCaThi int,
@ngay date,
@maCanBo int
as
insert into tblPhanCongCanBo(iMaHoiDong, iMaPhongHoc, iMaCa, dNgay,iMaCanBo) values
(@maHoiDong, @maPhongHoc, @maCaThi, @ngay, @maCanBo) 


alter proc sp_suaPhanCongCanBo
@maHoiDong int,
@maPhongHoc int,
@maCaThi int,
@ngay date,
@maCanBo int
as
update tblPhanCongCanBo set iMaHoiDong = @maHoiDong, iMaPhongHoc=@maPhongHoc, iMaCa  = @maCaThi, dNgay = @ngay,iMaCanBo = @maCanBo 
where iMaCanBo = @maCanBo and iMaHoiDong = @maHoiDong

select * from  tblPhanCongCanBo


create proc sp_suaPhanCongCanBo --loi
@maPhongThiChamThi int,
@maHoiDong int,
@maHocPhan int,
@maPhongHoc int,
@maCaThi int,
@ngayThi date,
@maDanhSachThi varchar(30)
as
update tblPhongThiChamThi set iMaHoiDong =@maHoiDong, iMaHocPhan = @maHocPhan, iMaPhongHoc = @maPhongHoc , iMaCaThi = @maCaThi, dNgayThi = @ngayThi,sMaDanhSachThi = @maDanhSachThi

where iMaPhongThiChamThi = @maPhongThiChamThi


alter proc sp_dsCanBoTrongPhong
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblPhongThiCanBo.iMaCanBo) AS  STT,tblPhongThiCanBo.iMaCanBo,tblPhongThiCanBo.iMaPhongThiChamThi, sTenGiangVien as N'Tên Cán Bộ', iTienCong as N'Tiền Công' from 
tblPhongThiCanBo, tblCanBo where iMaPhongThiChamThi = @id and tblCanBo.iMaCanBo = tblPhongThiCanBo.iMaCanBo

alter proc sp_danhSachPhanCongTheoHoiDong
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaPhanCong,--tblPhanCongCanBo.iMaCanBo,tblPhanCongCanBo.iMaHoiDong,
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc

and tblPhanCongCanBo.iMaHoiDong = @id

select * from tblHoiDong   
select * from tblHoiDong

exec sp_danhSachPhanCongTheoHoiDong 4


create proc sp_danhSachPhanCongCanBoTheoNgay
@ngay date
as
select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaPhanCong,--tblPhanCongCanBo.iMaCanBo,tblPhanCongCanBo.iMaHoiDong,
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc
and tblPhanCongCanBo.dNgay = @ngay



create proc sp_danhSachTienCongTheoHoiDong
@id int --bo
as
select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaPhanCong,--tblPhanCongCanBo.iMaCanBo,tblPhanCongCanBo.iMaHoiDong,
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc
and tblPhanCongCanBo.iMaHoiDong = @id

create proc sp_danhSachTienCongTheoHoiDong
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblPhanCongCanBo.iMaPhanCong) AS  STT,tblPhanCongCanBo.iMaPhanCong,--tblPhanCongCanBo.iMaCanBo,tblPhanCongCanBo.iMaHoiDong,
 tblcanbo.sTenGiangVien as N'Tên Cán Bộ/Giảng Viên', tblPhanCongCanBo.dNgay  as N'Ngày' ,tblPhongHoc.sTenPhong  as N'Phòng' , tblCaThi.sTenCaThi  as N'Ca' ,iTienCong as N'Tiền Công' from 
tblPhongHoc, tblCaThi, tblCanBo, tblPhanCongCanBo where tblCanBo.iMaCanBo = tblPhanCongCanBo.iMaCanBo and tblPhanCongCanBo.iMaCa = tblCaThi.iMaCaThi and tblPhanCongCanBo.iMaPhongHoc = tblPhongHoc.iMaPhongHoc
and tblPhanCongCanBo.iMaHoiDong = @id

exec sp_danhSachTienCongTheoHoiDong 4

select * from tblHoiDong


create proc sp_XoaPhanCongCanBo
@maPhanCong int
as
delete from tblPhanCongCanBo where iMaPhanCong = @maPhanCong


create proc sp_themCanBoVaoPhong
@maPhong int,
@maCanBo int
as
insert into tblPhongThiCanBo (iMaCanBo, iMaPhongThiChamThi) values (@maCanBo, @maPhong)

create proc sp_thanhToanTienChoCanBo
@maHoiDong int,
@maCanBo int,
@tien int
as
update  tblHoiDongCanBo set iTienCong = @tien where  iMaCanBo =  @maCanBo and iMaHoiDong = @maHoiDong


create proc sp_kiemTraPhanCongCanBo
@maphong int,
@macanbo int,
@maca int,
@ngay date,
@mahoidong int
as
select * from tblPhanCongCanBo where iMaCanBo =  @macanbo and iMaPhongHoc = @maphong and 
iMaHoiDong = @mahoidong and iMaCa = @maca and dNgay = @ngay


alter proc sp_xoaHoiDong  --kk
@id int
as
DELETE  b FROM tblPhongThiChamThi a , tblPhongThiCanBo b 
where b.iMaPhongThiChamThi = a.iMaPhongThiChamThi  and a.iMaHoiDong = @id
delete from tblPhongThiChamThi where iMaHoiDong = @id
delete from tblHoiDong where iMaHoiDong = @id

create proc sp_xoaHoiDong
@id int
as
delete from tblPhanCongCanBo where iMaHoiDong = @id
delete from tblHoiDong where iMaHoiDong = @id


create proc sp_XoaCanBoKhoiPhong
@maphong int,
@macanbo int
as
delete from tblPhongThiCanBo where iMaCanBo =  @macanbo and iMaPhongThiChamThi = @maphong


create proc sp_timKiemHoiDong
@tenhoidong nvarchar(30)
as
select ROW_NUMBER() OVER (ORDER BY  a.iMaHoiDong) AS  STT, a.iMaHoiDong, a.stenhoidong as N'Tên Hội Đồng',IIF(a.bloaihoidong = 1, N'Coi Thi',N'Chấm Thi' ) as N'Loại Hội Đồng',a.dNgayBatDau  as N'Từ Ngày',a.dngayketthuc as N'Đến Ngày',a.dThoiGianTao  as N'Ngày Tạo', b.stengiangvien as N'Chủ Tịch', c.stengiangvien as N'Giám Sát', d.stengiangvien as N'Thư Ký'
 from 
(
(select  bLoaiHoiDong , dThoiGianTao, dNgayBatDau , dNgayKetThuc , iMaHoiDong, stenhoidong from tblHoiDong where sTenHoiDong like '%' + @tenhoidong + '%') a inner join
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iChuTich = tblCanBo.iMaCanBo) b on a.iMaHoiDong = b.iMaHoiDong
inner join 
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iGiamSat = tblCanBo.iMaCanBo) c on a.iMaHoiDong = c.iMaHoiDong
inner join
(select iMaHoiDong, sTenGiangVien from tblHoiDong, tblCanBo where tblHoiDong.iThuKy = tblCanBo.iMaCanBo) d on a.iMaHoiDong = d.iMaHoiDong

)



create proc sp_kiemTraPhong
@ngay date,
@macaThi int,
@maphong int,
@
as
select * from tblPhongThiChamThi where dNgayThi = @ngay and iMaCaThi = @macaThi and iMaPhongHoc = @maphong 

select * from tbl


create proc sp_thanhToanTienChoCanBo
@maPhanCong int,
@tien int
as
update tblPhanCongCanBo set iTienCong = @tien where iMaPhanCong = @maPhanCong