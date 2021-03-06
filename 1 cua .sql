USE [master]
GO
/****** Object:  Database [hoiTroMotCua]    Script Date: 26/11/2020 4:40:25 PM ******/
CREATE DATABASE [hoiTroMotCua]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hoiTroMotCua', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\hoiTroMotCua.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'hoiTroMotCua_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\hoiTroMotCua_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [hoiTroMotCua] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hoiTroMotCua].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hoiTroMotCua] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET ARITHABORT OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hoiTroMotCua] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [hoiTroMotCua] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hoiTroMotCua] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hoiTroMotCua] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hoiTroMotCua] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hoiTroMotCua] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hoiTroMotCua] SET  MULTI_USER 
GO
ALTER DATABASE [hoiTroMotCua] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hoiTroMotCua] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hoiTroMotCua] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hoiTroMotCua] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [hoiTroMotCua]
GO
/****** Object:  StoredProcedure [dbo].[sp_dsChiTietGTnhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsChiTietGTnhan]
@maHoSo int
as
 select ROW_NUMBER() OVER (ORDER BY tblChiTiethoSoGiayTonhan.id)  as STT, id, sTenLoaiGiayToNhan as N'Giấy Tờ' , sMaSoGiayTo as N'Mã/Số', sGhichu as N'Ghi Chú', iMaGiayToNhan
 from tblChiTiethoSoGiayTonhan, tblLoaiGiayToNhan where tblChiTiethoSoGiayTonhan.iMaGiayToNhan  =  tblLoaiGiayToNhan.iMaLoaiGiayToNhan
and tblChiTiethoSoGiayTonhan.iMaHoSo = @maHoSo
GO
/****** Object:  StoredProcedure [dbo].[sp_dsChiTietGTtra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_dsChiTietGTtra]
@maHoSo int
as
 select ROW_NUMBER() OVER (ORDER BY tblChiTiethoSoGiayToTra.id)  as STT, id, sTenLoaiGiayToTra as N'Giấy Tờ' , iSoLuong as N'Số Lượng',iTienPhi as N'Tiền Phí', sGhichu as N'Ghi Chú', iMaLoaiGiayToTra
 from tblChiTiethoSoGiayToTra, tblLoaiGiayToTra where tblChiTiethoSoGiayToTra.iMaGiayToTra  = tblLoaiGiayToTra.iMaLoaiGiayToTra
and tblChiTiethoSoGiayToTra.iMaHoSo = @maHoSo
GO
/****** Object:  StoredProcedure [dbo].[sp_dsHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_dsHoSo]
as
select ROW_NUMBER() OVER (ORDER BY tblHoSo.iMaHoSo)  as STT,N'HS' +CONVERT(varchar(10),tblHoSo.iMaHoSo) as N'Mã Hồ Sơ', tblHoSo.iMaHoSo, tblHoSo.dNgayTao as N'Ngày Tạo',tblHoSo.dNgayHen as N'Ngày Hẹn', tblCongDan.sTenCongDan as N'Công Dân',
 tblLoaiHoSo.sTenLoaiHoSo as N'Loại Hồ Sơ', sum(tblLoaiGiayToTra.iTienPhi * tblChiTiethoSoGiayToTra.iSoLuong) as N'Tiền Phí', tblHoSo.sGhichu as N'Ghi Chú',tblHoSo.btrangthai,  IIF(tblHoSo.btrangthai = 0, N'Đã Tiếp Nhận Hồ Sơ', N'Đã Trả Hồ Sơ Và Thu Tiền') as N'Trạng Thái'
from tblChiTiethoSoGiayToTra, tblCongDan, tblHoSo, tblLoaiHoSo, tblLoaiGiayToTra
where tblChiTiethoSoGiayToTra.iMaHoSo = tblHoSo.iMaHoSo and tblChiTiethoSoGiayToTra.iMaGiayToTra = tblLoaiGiayToTra.iMaLoaiGiayToTra and
tblHoSo.iMaCongDan = tblCongDan.iMaCongDan and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo

group by tblHoSo.iMaHoSo, tblHoSo.dNgayHen, tblHoSo.dNgayTao,tblLoaiHoSo.sTenLoaiHoSo,
tblCongDan.sTenCongDan ,tblHoSo.sGhichu, tblHoSo.bTrangThai
GO
/****** Object:  StoredProcedure [dbo].[sp_dsLoaiGTnhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsLoaiGTnhan]
as
select ROW_NUMBER() OVER (ORDER BY iMaLoaiGiayToNhan)  as STT, iMaLoaiGiayToNhan, sTenLoaiGiayToNhan as N'Tên Loại'
from tblLoaiGiayToNhan
GO
/****** Object:  StoredProcedure [dbo].[sp_dsLoaiGTnhan_]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsLoaiGTnhan_]
as
select * from tblLoaiGiayToNhan
GO
/****** Object:  StoredProcedure [dbo].[sp_dsLoaiGTtra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsLoaiGTtra]
as
select ROW_NUMBER() OVER (ORDER BY imaloaigiaytotra)  as STT, iMaLoaiGiayToTra, sTenLoaiGiayToTra as N'Tên Loại', iTienPhi as N'Tiền Phí' 
from tblLoaiGiayToTra
GO
/****** Object:  StoredProcedure [dbo].[sp_dsLoaiGTtra_]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_dsLoaiGTtra_]
as
select * from tblLoaiGiayToTra

GO
/****** Object:  StoredProcedure [dbo].[sp_dsLoaiHoSO]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsLoaiHoSO]
as
select ROW_NUMBER() OVER (ORDER BY iMaLoaiHoSo)  as STT, iMaLoaiHoSo, sTenLoaiHoSo as N'Tên Loại' 
from tblLoaiHoSo
GO
/****** Object:  StoredProcedure [dbo].[sp_dsLoaiHS]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_dsLoaiHS]
as
select * from tblLoaiHoSo
GO
/****** Object:  StoredProcedure [dbo].[sp_layThongTinHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layThongTinHoSo]
@id int
as
select * from tblHoSo, tblCongDan where tblHoSo.iMaCongDan =  tblCongDan.iMaCongDan
and tblHoSo.iMaHoSo = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_suaChiTietGTNhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaChiTietGTNhan]
@id int,
@maHoSo int,
@maLoaiGT int,
@maso nvarchar(20),
@ghiChu nvarchar(200)
as
update tblChiTiethoSoGiayToNhan set iMaHoSo = @maHoSo, iMaGiayToNhan = @maLoaiGT, sMaSoGiayTo = @maso, sGhichu = @ghiChu
where id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_suaChiTietGTTra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaChiTietGTTra]
@id int,
@maHoSo int,
@maLoaiGT int,
@soLuong int,
@ghiChu nvarchar(200)
as
update tblChiTiethoSoGiayToTra set iMaHoSo = @maHoSo, iMaGiayToTra = @maLoaiGT, iSoLuong = @soLuong, sGhichu = @ghiChu
where id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_suaLoaiGTnhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_suaLoaiGTnhan]
@maLoai int,
@ten nvarchar(50)
as
update tblLoaiGiayToNhan set sTenLoaiGiayToNhan = @ten where iMaLoaiGiayToNhan =  @maLoai
GO
/****** Object:  StoredProcedure [dbo].[sp_suaLoaiGTtra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaLoaiGTtra]
@maLoai int,
@ten nvarchar(50),
@tien int
as
update tblLoaiGiayToTra set sTenLoaiGiayToTra = @ten, iTienPhi= @tien where iMaLoaiGiayToTra =  @maLoai
GO
/****** Object:  StoredProcedure [dbo].[sp_suaLoaiHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaLoaiHoSo]
@maLoai int,
@ten nvarchar(50)
as
update tblLoaiHoSo set sTenLoaiHoSo = @ten where iMaLoaiHoSo =  @maLoai

GO
/****** Object:  StoredProcedure [dbo].[sp_taoHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_taoHoSo]
@thoiGian datetime,
@maHoSo int out
as
insert into tblHoSo( dngaytao,iMaCongDan, iMaloaiHoSo) OUTPUT INSERTED.iMaHoSo as id values (@thoigian,1,1) 
 set @maHoSo = SCOPE_IDENTITY()
return @maHoSo;
GO
/****** Object:  StoredProcedure [dbo].[sp_taoTTcongDan_]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_taoTTcongDan_]  --- sp_taodonnPhieuhang
@ten nvarchar(50),
@sdt nvarchar(50),
@diachi nvarchar(50),
@cancuoc nvarchar(50),
@maCongDan int out
as
insert into tblCongDan(sTenCongDan, sDiaChi, sSDT,sCanCuoc) OUTPUT INSERTED.iMaCongDan as id values (@ten, @diachi, @sdt,@cancuoc) 
 set @maCongDan = SCOPE_IDENTITY()
return @maCongDan;
GO
/****** Object:  StoredProcedure [dbo].[sp_themChiTietDonNhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themChiTietDonNhan]
@maHoSo int,
@maLoaiGT int,
@maSo nvarchar(20),
@ghiChu nvarchar(200)
as
insert into tblChiTiethoSoGiayTonhan(iMaHoSo, iMaGiayToNhan, sMaSoGiayTo, sGhichu) values 
(@maHoSo, @maLoaiGT, @maso, @ghiChu);
GO
/****** Object:  StoredProcedure [dbo].[sp_themChiTietDonTra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themChiTietDonTra]
@maHoSo int,
@maLoaiGT int,
@soLuong int,
@ghiChu nvarchar(200)
as
insert into tblChiTiethoSoGiayToTra(iMaHoSo, iMaGiayToTra, iSoLuong , sGhichu) values 
(@maHoSo, @maLoaiGT, @soLuong, @ghiChu);
GO
/****** Object:  StoredProcedure [dbo].[sp_themChiTietGTNhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themChiTietGTNhan]
@maHoSo int,
@maLoaiGT int,
@maSo nvarchar(20),
@ghiChu nvarchar(200)
as
insert into tblChiTiethoSoGiayTonhan(iMaHoSo, iMaGiayToNhan, sMaSoGiayTo, sGhichu) values 
(@maHoSo, @maLoaiGT, @maso, @ghiChu);
GO
/****** Object:  StoredProcedure [dbo].[sp_themChiTietGTTra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themChiTietGTTra]
@maHoSo int,
@maLoaiGT int,
@soLuong int,
@ghiChu nvarchar(200)
as
insert into tblChiTiethoSoGiayToTra(iMaHoSo, iMaGiayToTra, iSoLuong , sGhichu) values 
(@maHoSo, @maLoaiGT, @soLuong, @ghiChu);
GO
/****** Object:  StoredProcedure [dbo].[sp_themLoaiGTnhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themLoaiGTnhan]
@ten Nvarchar(50)
as
insert into tblLoaiGiayToNhan(sTenLoaiGiayToNhan) values (@ten);
GO
/****** Object:  StoredProcedure [dbo].[sp_themLoaiGTtra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_themLoaiGTtra]
@ten Nvarchar(50),
@tien int
as
insert into tblLoaiGiayToTra(sTenLoaiGiayToTra,iTienPhi) values (@ten,@tien);
GO
/****** Object:  StoredProcedure [dbo].[sp_themLoaiHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themLoaiHoSo]
@ten Nvarchar(50)
as
insert into tblLoaiHoSo(sTenLoaiHoSo) values (@ten);
GO
/****** Object:  StoredProcedure [dbo].[sp_thongKeHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_thongKeHoSo]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_thongKeHoSo_1]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_thongKeHoSo_1]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_thongKeHoSoTHeoNgay]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_thongKeHoSoTHeoNgay]
@ngaybatdau datetime,
@ngayketthuc datetime
as
select sTenLoaiHoSo, count(iMaHoSo) as soLuong from tblHoSo, tblLoaiHoSo where dNgayTao >= @ngaybatdau and dNgayTao <= @ngayketthuc
and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo
group by sTenLoaiHoSo
GO
/****** Object:  StoredProcedure [dbo].[sp_thongKeHoSoTHeoNgay_1]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_thongKeHoSoTHeoNgay_1]
@ngaybatdau datetime,
@ngayketthuc datetime
as
select ROW_NUMBER() OVER (ORDER BY tblhoso.imaloaihoso)  as STT, sTenLoaiHoSo  as N'Tên Loại Hồ Sơ', count(iMaHoSo) as  N'Số Lượng' from tblHoSo, tblLoaiHoSo where dNgayTao >= @ngaybatdau and dNgayTao <= @ngayketthuc
and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo
group by sTenLoaiHoSo,tblhoso.imaloaihoso
GO
/****** Object:  StoredProcedure [dbo].[sp_timHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_timHoSo]
@id int
as
select ROW_NUMBER() OVER (ORDER BY tblHoSo.iMaHoSo)  as STT,N'HS' +CONVERT(varchar(10),tblHoSo.iMaHoSo) as N'Mã Hồ Sơ', tblHoSo.iMaHoSo, tblHoSo.dNgayTao as N'Ngày Tạo',tblHoSo.dNgayHen as N'Ngày Hẹn', tblCongDan.sTenCongDan as N'Công Dân',
 tblLoaiHoSo.sTenLoaiHoSo as N'Loại Hồ Sơ', sum(tblLoaiGiayToTra.iTienPhi * tblChiTiethoSoGiayToTra.iSoLuong) as N'Tiền Phí', tblHoSo.sGhichu as N'Ghi Chú',tblHoSo.btrangthai,  IIF(tblHoSo.btrangthai = 0, N'Đã Tiếp Nhận Hồ Sơ', N'Đã Trả Hồ Sơ Và Thu Tiền') as N'Quyền'
from tblChiTiethoSoGiayToTra, tblCongDan, tblHoSo, tblLoaiHoSo, tblLoaiGiayToTra
where tblChiTiethoSoGiayToTra.iMaHoSo = tblHoSo.iMaHoSo and tblChiTiethoSoGiayToTra.iMaGiayToTra = tblLoaiGiayToTra.iMaLoaiGiayToTra and
tblHoSo.iMaCongDan = tblCongDan.iMaCongDan and tblHoSo.iMaloaiHoSo = tblLoaiHoSo.iMaLoaiHoSo and tblHoSo.iMaHoSo = @id
group by tblHoSo.iMaHoSo, tblHoSo.dNgayHen, tblHoSo.dNgayTao,tblLoaiHoSo.sTenLoaiHoSo,
tblCongDan.sTenCongDan ,tblHoSo.sGhichu, tblHoSo.bTrangThai
GO
/****** Object:  StoredProcedure [dbo].[sp_updateCongDan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updateCongDan]
@id int,
@ten nvarchar(50),
@diachi nvarchar(50),
@sdt nvarchar(50),
@cancuoc nvarchar(50)
as
update tblCongDan set sCanCuoc = @cancuoc, sDiaChi = @diachi, sSDT = @sdt, sTenCongDan = @ten
where iMaCongDan = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_updateHoSo_]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updateHoSo_]
@id int,
@maCongDan int,
@maLoai int,
@ghichu nvarchar(200),
@tgHen datetime
as
update tblHoSo set iMaCongDan = @maCongDan, iMaloaiHoSo = @maLoai, dNgayHen = @tgHen, sghichu = @ghichu
where iMaHoSo = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_updateTrahoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_updateTrahoSo]
@id int
as
update tblHoSo set bTrangThai = 1
where iMaHoSo = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaChiTietGTnhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaChiTietGTnhan]
@id int
as
delete from tblChiTiethoSoGiayTonhan where id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaChiTietGTtra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaChiTietGTtra]
@id int
as
delete from tblChiTiethoSoGiayToTra where id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoahs]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoahs]
@ma int
as
delete from tblChiTiethoSoGiayTonhan where iMaHoSo = @ma
delete from tblChiTiethoSoGiayToTra where iMaHoSo = @ma
delete from tblHoSo where iMaHoSo = @ma
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaLoaiGTnhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaLoaiGTnhan]
@maLoai int
as
delete from tblLoaiGiayToNhan where iMaLoaiGiayToNhan = @maLoai
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaLoaiGTtra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaLoaiGTtra]
@maLoai int
as
delete from tblLoaiGiayToTra where iMaLoaiGiayToTra = @maLoai
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaLoaiHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaLoaiHoSo]
@maLoai int
as
delete from tblLoaiHoSo where iMaLoaiHoSo = @maLoai

GO
/****** Object:  Table [dbo].[tblChiTiethoSoGiayTonhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTiethoSoGiayTonhan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[iMaHoSo] [int] NOT NULL,
	[iMaGiayToNhan] [int] NOT NULL,
	[sMaSoGiayTo] [nvarchar](20) NULL,
	[sGhichu] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChiTiethoSoGiayToTra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTiethoSoGiayToTra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[iMaHoSo] [int] NOT NULL,
	[iMaGiayToTra] [int] NOT NULL,
	[iSoLuong] [int] NULL,
	[sGhichu] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCongDan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCongDan](
	[iMaCongDan] [int] IDENTITY(1,1) NOT NULL,
	[sTenCongDan] [nvarchar](50) NULL,
	[sDiaChi] [nvarchar](50) NULL,
	[sSDT] [nvarchar](50) NULL,
	[sCanCuoc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaCongDan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoSo](
	[iMaHoSo] [int] IDENTITY(1,1) NOT NULL,
	[iMaloaiHoSo] [int] NOT NULL,
	[iMaCongDan] [int] NOT NULL,
	[bTrangThai] [bit] NULL,
	[dNgayTao] [datetime] NULL,
	[dNgayHen] [datetime] NULL,
	[sghichu] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaHoSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLoaiGiayToNhan]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiGiayToNhan](
	[iMaLoaiGiayToNhan] [int] IDENTITY(1,1) NOT NULL,
	[sTenLoaiGiayToNhan] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLoaiGiayToNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLoaiGiayToTra]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiGiayToTra](
	[iMaLoaiGiayToTra] [int] IDENTITY(1,1) NOT NULL,
	[sTenLoaiGiayToTra] [nvarchar](50) NULL,
	[iTienPhi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLoaiGiayToTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLoaiHoSo]    Script Date: 26/11/2020 4:40:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiHoSo](
	[iMaLoaiHoSo] [int] IDENTITY(1,1) NOT NULL,
	[sTenLoaiHoSo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLoaiHoSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblChiTiethoSoGiayTonhan] ON 

INSERT [dbo].[tblChiTiethoSoGiayTonhan] ([id], [iMaHoSo], [iMaGiayToNhan], [sMaSoGiayTo], [sGhichu]) VALUES (21, 30, 1, N'15426556559', N'')
INSERT [dbo].[tblChiTiethoSoGiayTonhan] ([id], [iMaHoSo], [iMaGiayToNhan], [sMaSoGiayTo], [sGhichu]) VALUES (22, 31, 1, N'7878564559', N'')
INSERT [dbo].[tblChiTiethoSoGiayTonhan] ([id], [iMaHoSo], [iMaGiayToNhan], [sMaSoGiayTo], [sGhichu]) VALUES (23, 30, 1, N'15426559759', N'')
INSERT [dbo].[tblChiTiethoSoGiayTonhan] ([id], [iMaHoSo], [iMaGiayToNhan], [sMaSoGiayTo], [sGhichu]) VALUES (24, 30, 8, N'', N'tờ khai')
INSERT [dbo].[tblChiTiethoSoGiayTonhan] ([id], [iMaHoSo], [iMaGiayToNhan], [sMaSoGiayTo], [sGhichu]) VALUES (25, 32, 10, N'787599', N'hợp đồng mua bán nhà đất ')
INSERT [dbo].[tblChiTiethoSoGiayTonhan] ([id], [iMaHoSo], [iMaGiayToNhan], [sMaSoGiayTo], [sGhichu]) VALUES (26, 32, 4, N'00345454354', N'Tên Nguyên Văn B')
SET IDENTITY_INSERT [dbo].[tblChiTiethoSoGiayTonhan] OFF
SET IDENTITY_INSERT [dbo].[tblChiTiethoSoGiayToTra] ON 

INSERT [dbo].[tblChiTiethoSoGiayToTra] ([id], [iMaHoSo], [iMaGiayToTra], [iSoLuong], [sGhichu]) VALUES (22, 30, 2, 1, N'adasd')
INSERT [dbo].[tblChiTiethoSoGiayToTra] ([id], [iMaHoSo], [iMaGiayToTra], [iSoLuong], [sGhichu]) VALUES (23, 31, 5, 4, N'Câp cho công dân 7878564559 bản sao giấy căn cước')
INSERT [dbo].[tblChiTiethoSoGiayToTra] ([id], [iMaHoSo], [iMaGiayToTra], [iSoLuong], [sGhichu]) VALUES (27, 32, 6, 1, N'chứng thực cho hợp đồng mã 787599')
SET IDENTITY_INSERT [dbo].[tblChiTiethoSoGiayToTra] OFF
SET IDENTITY_INSERT [dbo].[tblCongDan] ON 

INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (1, N'ad', N'ad', N'333333333', N'3333333333')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (2, N'eqweda', N'đá', N'đá', N'đád')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (3, N'eqweda', N'đá', N'đá', N'đád')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (4, N'dá', N'đá', N'dsa', N'đasad')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (5, N'đá', N'đá', N'đá', N'đáda')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (6, N'đá', N'dád', N'đá', N'đá')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (7, N'dá', N'đádá', N'dsad', N'dsadas')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (8, N'dá', N'ád', N'ad', N'sads')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (9, N'đá', N'dá', N'đá', N'đádá')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (10, N'Nguyễn Van A', N'Hà Nội', N'0895659565', N'259555959595')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (11, N'Le Van An', N'Hà Nội', N'0846595659', N'002225598988')
INSERT [dbo].[tblCongDan] ([iMaCongDan], [sTenCongDan], [sDiaChi], [sSDT], [sCanCuoc]) VALUES (12, N'Nguyễn Văn C', N'Hà Nội', N'0779894484', N'000595998855')
SET IDENTITY_INSERT [dbo].[tblCongDan] OFF
SET IDENTITY_INSERT [dbo].[tblHoSo] ON 

INSERT [dbo].[tblHoSo] ([iMaHoSo], [iMaloaiHoSo], [iMaCongDan], [bTrangThai], [dNgayTao], [dNgayHen], [sghichu]) VALUES (30, 3, 10, 1, CAST(0x0000AC6C000CDC29 AS DateTime), CAST(0x0000AC6C00D33650 AS DateTime), N'Ghi chú')
INSERT [dbo].[tblHoSo] ([iMaHoSo], [iMaloaiHoSo], [iMaCongDan], [bTrangThai], [dNgayTao], [dNgayHen], [sghichu]) VALUES (31, 6, 11, 0, CAST(0x0000AC6C011B51A4 AS DateTime), CAST(0x0000AC6C00556B30 AS DateTime), N'Cấp bản sao')
INSERT [dbo].[tblHoSo] ([iMaHoSo], [iMaloaiHoSo], [iMaCongDan], [bTrangThai], [dNgayTao], [dNgayHen], [sghichu]) VALUES (32, 4, 12, 0, CAST(0x0000AC7000FFBAD7 AS DateTime), CAST(0x0000AC700039F3F0 AS DateTime), N'Thủ tục câp chứng nhận hợp đồng')
SET IDENTITY_INSERT [dbo].[tblHoSo] OFF
SET IDENTITY_INSERT [dbo].[tblLoaiGiayToNhan] ON 

INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (1, N'Thẻ căn cước')
INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (3, N'Sổ Hộ Khẩu')
INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (4, N'GIấy CMND')
INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (5, N'Giấy Khai Sinh')
INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (6, N'Giấy Chứng Nhân Kết Hôn')
INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (7, N'Tờ khai cấp giấy xác nhận tình trạng hôn nhân ')
INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (8, N'Tờ khai cấp giấy đăng ký kết hôn')
INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (9, N'Tờ khai cấp giấy khai sinh')
INSERT [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan], [sTenLoaiGiayToNhan]) VALUES (10, N'Hợp đồng mua bán ')
SET IDENTITY_INSERT [dbo].[tblLoaiGiayToNhan] OFF
SET IDENTITY_INSERT [dbo].[tblLoaiGiayToTra] ON 

INSERT [dbo].[tblLoaiGiayToTra] ([iMaLoaiGiayToTra], [sTenLoaiGiayToTra], [iTienPhi]) VALUES (2, N'Giấy Đăng Ký Kết Hôn', 30000)
INSERT [dbo].[tblLoaiGiayToTra] ([iMaLoaiGiayToTra], [sTenLoaiGiayToTra], [iTienPhi]) VALUES (3, N'Giấy Khai Sinh', 35000)
INSERT [dbo].[tblLoaiGiayToTra] ([iMaLoaiGiayToTra], [sTenLoaiGiayToTra], [iTienPhi]) VALUES (4, N'Giấy xác nhận tình trạng hôn nhân', 20000)
INSERT [dbo].[tblLoaiGiayToTra] ([iMaLoaiGiayToTra], [sTenLoaiGiayToTra], [iTienPhi]) VALUES (5, N'Bản sao từ bản chính', 15000)
INSERT [dbo].[tblLoaiGiayToTra] ([iMaLoaiGiayToTra], [sTenLoaiGiayToTra], [iTienPhi]) VALUES (6, N'Giấy chứng thực hợp đồng', 50000)
SET IDENTITY_INSERT [dbo].[tblLoaiGiayToTra] OFF
SET IDENTITY_INSERT [dbo].[tblLoaiHoSo] ON 

INSERT [dbo].[tblLoaiHoSo] ([iMaLoaiHoSo], [sTenLoaiHoSo]) VALUES (1, N'Đăng Ký Khai Sinh')
INSERT [dbo].[tblLoaiHoSo] ([iMaLoaiHoSo], [sTenLoaiHoSo]) VALUES (3, N'Đăng Ký Kết Hôn')
INSERT [dbo].[tblLoaiHoSo] ([iMaLoaiHoSo], [sTenLoaiHoSo]) VALUES (4, N'Chứng Thực Hợp Đồng')
INSERT [dbo].[tblLoaiHoSo] ([iMaLoaiHoSo], [sTenLoaiHoSo]) VALUES (5, N'Cấp Giấy Xác Nhận Tình Trạng Hôn Nhân')
INSERT [dbo].[tblLoaiHoSo] ([iMaLoaiHoSo], [sTenLoaiHoSo]) VALUES (6, N'Chứng Thực Bản Sao Từ Bản Chính')
SET IDENTITY_INSERT [dbo].[tblLoaiHoSo] OFF
ALTER TABLE [dbo].[tblHoSo] ADD  DEFAULT ((0)) FOR [bTrangThai]
GO
ALTER TABLE [dbo].[tblChiTiethoSoGiayTonhan]  WITH CHECK ADD  CONSTRAINT [FK_1] FOREIGN KEY([iMaHoSo])
REFERENCES [dbo].[tblHoSo] ([iMaHoSo])
GO
ALTER TABLE [dbo].[tblChiTiethoSoGiayTonhan] CHECK CONSTRAINT [FK_1]
GO
ALTER TABLE [dbo].[tblChiTiethoSoGiayTonhan]  WITH CHECK ADD  CONSTRAINT [FK_2] FOREIGN KEY([iMaGiayToNhan])
REFERENCES [dbo].[tblLoaiGiayToNhan] ([iMaLoaiGiayToNhan])
GO
ALTER TABLE [dbo].[tblChiTiethoSoGiayTonhan] CHECK CONSTRAINT [FK_2]
GO
ALTER TABLE [dbo].[tblChiTiethoSoGiayToTra]  WITH CHECK ADD  CONSTRAINT [FK_12] FOREIGN KEY([iMaHoSo])
REFERENCES [dbo].[tblHoSo] ([iMaHoSo])
GO
ALTER TABLE [dbo].[tblChiTiethoSoGiayToTra] CHECK CONSTRAINT [FK_12]
GO
ALTER TABLE [dbo].[tblChiTiethoSoGiayToTra]  WITH CHECK ADD  CONSTRAINT [FK_22] FOREIGN KEY([iMaGiayToTra])
REFERENCES [dbo].[tblLoaiGiayToTra] ([iMaLoaiGiayToTra])
GO
ALTER TABLE [dbo].[tblChiTiethoSoGiayToTra] CHECK CONSTRAINT [FK_22]
GO
ALTER TABLE [dbo].[tblHoSo]  WITH CHECK ADD FOREIGN KEY([iMaCongDan])
REFERENCES [dbo].[tblCongDan] ([iMaCongDan])
GO
ALTER TABLE [dbo].[tblHoSo]  WITH CHECK ADD FOREIGN KEY([iMaloaiHoSo])
REFERENCES [dbo].[tblLoaiHoSo] ([iMaLoaiHoSo])
GO
USE [master]
GO
ALTER DATABASE [hoiTroMotCua] SET  READ_WRITE 
GO
