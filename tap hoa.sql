USE [master]
GO
/****** Object:  Database [quanLyBanHangTapHoa]    Script Date: 26/11/2020 4:41:07 PM ******/
CREATE DATABASE [quanLyBanHangTapHoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanLyBanHangTapHoa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\quanLyBanHangTapHoa.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'quanLyBanHangTapHoa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\quanLyBanHangTapHoa_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanLyBanHangTapHoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET  MULTI_USER 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [quanLyBanHangTapHoa]
GO
/****** Object:  StoredProcedure [dbo].[sp_baoCaoDoanhThuTheoNhanVien]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_baoCaoDoanhThuTheoNhanVien]  --okk
 @maNV int,
 @tuNgay datetime,
 @denngay datetime
 as
 select ROW_NUMBER() OVER (ORDER BY data.iMaSanPham) AS  STT,data.sTenSanPham as N'Sản Phẩm', sum(data.soluong) as N'Số Lượng Bán' , data.iGia as N'Giá' ,sum(data.tien) as N'Thành Tiền'  from
( select  ROW_NUMBER() OVER (ORDER BY d.iMaSanPham) AS  STT, d.iMaSanPham, d.sTenSanPham  ,d.igia , sum(b.iSoLuong)  as soLuong
 ,iif(b.iGiaGiam = 0,d.igia,d.igia - b.iGiaGiam) * sum(b.iSoLuong) as tien
 from tblDonBanHang a, tblChiTietDonBanHang b , tblNhanVien c, tblSanPham d where a.iMaDonHang = b.iMaDonHang and
 a.iMaNhanVien = c.iMaNhanVien and b.iMaSanPham = d.iMaSanPham 
 and c.iMaNhanVien = @maNV and a.dThoiGian >= @tuNgay and a.dThoiGian <= @denngay
 group by d.iMaSanPham,d.sTenSanPham,d.iGia,b.iGiaGiam, d.iMaSanPham) as data
 group by sTenSanPham, iGia, iMaSanPham
GO
/****** Object:  StoredProcedure [dbo].[sp_capNhatNhanVien]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	  create proc [dbo].[sp_capNhatNhanVien]
@tenNV Nvarchar(30),	
@sdt nvarchar(20),
@diachi nvarchar(50),
@quyen int,
@manv int
as
update tblNhanVien set stenNV = @tenNV,sDiachi = @diachi,sSoDienThoai = @sdt,  iQuyen = @quyen where imanhanvien = @manv
GO
/****** Object:  StoredProcedure [dbo].[sp_capNhatSoLuong]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_capNhatSoLuong]
 @idDon int,
 @iSoLuong int,
 @idSanPham int
 as
 update tblChiTietdonBanHang set iSoLuong = @iSoLuong where
 iMaDonHang =  @idDon and iMaSanPham = @idSanPham
GO
/****** Object:  StoredProcedure [dbo].[sp_capNhatThongTinDonHang_KH]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_capNhatThongTinDonHang_KH]
 @idDon int,
 @idKH int
 as
 update tblDonBanHang set iMaKhachHang = @idKH where iMaDonHang = @idDon
GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachNhanVien]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_danhSachNhanVien]
as
select stenNV as N'Tên Nhân Viên', sUserName as N'Tên Đăng Nhập', sSoDienThoai as N'SĐT', sDiachi as 'Địa Chỉ', IIF(iQuyen = 1, N'Nhân Viên', N'Quản Lý') as N'Quyền',
 IIF(bTrangThai = 1, N'Hoạt Động', N'Không Hoạt Động') as N'Trạng Thái', imanhanvien as iMaNV  
  from tblNhanVien
GO
/****** Object:  StoredProcedure [dbo].[sp_DoiMatKhau]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_DoiMatKhau]
@id int,
@mk varchar(100)
as
update tblNhanVien set Spass = @mk where iManhanvien = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_kiemTraDangNhap]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_kiemTraDangNhap]
@tenTK nvarchar(50),
@mk varchar(100)
as
select  iMaNhanVien, iQuyen , btrangthai from tblNhanVien where sUserName = @tenTK and sPass = @mk and bTrangThai = 1

GO
/****** Object:  StoredProcedure [dbo].[sp_kiemTraMK]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_kiemTraMK]
@id int,
@mk varchar(100)
as
select * from tblNhanVien where iMaNhanVien = @id and sPass = @mk

GO
/****** Object:  StoredProcedure [dbo].[sp_ktraSanPhamNhapDonBan]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_ktraSanPhamNhapDonBan]
 @idDon int,
 @idSanPham int
 as
select * from tblChiTietdonBanHang where
 iMaDonHang =  @idDon and iMaSanPham = @idSanPham
 select * from tblNhanVien
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraSanPhamTrongDonBan]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create proc [dbo].[sp_ktraSanPhamTrongDonBan]
 @idDon int,
 @idSanPham int
 as
select * from tblChiTietdonBanHang where
 iMaDonHang =  @idDon and iMaSanPham = @idSanPham
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTen]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ktraTen]
@username nvarchar(20)
as
select count(*) from tblNhanVien where sUserName = @username
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTenKhachHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_ktraTenKhachHang]
 @ten nvarchar(40)
 as
 select * from tblKhachHang where sTenKhachHang = @ten
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTenNhanVien]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_ktraTenNhanVien]
 @ten nvarchar(40)
 as
 select * from tblNhanVien where stenNV = @ten
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTenNhomHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_ktraTenNhomHang]
 @ten nvarchar(40)
 as
 select * from tblNhomHang where sTenNhomHang = @ten
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTenSanPham]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ktraTenSanPham]
 @ten nvarchar(40)
 as
 select * from tblSanPham where sTenSanPham = @ten

GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTenSuaKhachHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_ktraTenSuaKhachHang]
 @ten nvarchar(40),
  @id int
 as
 select * from tblKhachHang where sTenKhachHang = @ten and iMaKhachHang != @id
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTenSuaNhanVien]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ktraTenSuaNhanVien]
 @ten nvarchar(40),
 @id int
 as
 select * from tblNhanVien where stenNV = @ten and iMaNhanVien != @id
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTenSuaSanPham]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ktraTenSuaSanPham]
 @ten nvarchar(40),
  @id int
 as
 select * from tblSanPham where sTenSanPham = @ten and iMaSanPham != @id
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTenVaDtKH]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_ktraTenVaDtKH]
 @ten nvarchar(40),
 @dt varchar(15)
 as
 select * from tblKhachHang where sTenKhachHang = @ten and sSoDienThoai = @dt

GO
/****** Object:  StoredProcedure [dbo].[sp_layThongTinKH]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layThongTinKH]
@id int
as
select * from tblKhachHang where iMaKhachHang = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_suaKhachHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_suaKhachHang] 
@iMaKhachHang int,
@sTenKhachHang Nvarchar(30),	
@semail varchar(20),
@ssdt varchar(20),
@sdiachi NVARCHAR(30),
@bGioiTinh bit
as
update tblKhachHang set sTenKhachHang = @sTenKhachHang , sEmail = @semail, sSoDienThoai=@ssdt, sDiachi = @sdiachi, bGioiTinh = @bGioiTinh
where iMaKhachHang = @iMaKhachHang

GO
/****** Object:  StoredProcedure [dbo].[sp_suaNhomHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_suaNhomHang]
@maNhomHang int,
@tenNhomHang nvarchar(30)
as
update tblNhomHang set sTenNhomHang = @tenNhomHang where iMaNhomHang =  @maNhomHang
GO
/****** Object:  StoredProcedure [dbo].[sp_suaSanPham]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_suaSanPham] 
@iMaSanPham int,
@sTenSanPham Nvarchar(40),	
@iMaNhomHang int ,
@smavach varchar(40),
@sMoTa NVARCHAR(100),
@igia int
as
update tblSanPham  set sTenSanPham = @sTenSanPham, smavach = @smavach, iMaNhomHang = @iMaNhomHang, 
 @sMoTa =@sMoTa, iGia = @igia  where iMaSanPham = @imaSanPham 
GO
/****** Object:  StoredProcedure [dbo].[sp_taodonBanHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_taodonBanHang]  --- sp_taodonnPhieuhang
@iMaNhanVien int,
@thoigian datetime,
@maKH int,
@imaDonBanHang int out
as
insert into tbldonBanHang (iMaNhanVien, dThoiGian, iMaKhachHang) OUTPUT INSERTED.iMadonHang as id values (@iMaNhanVien,@thoigian,@maKH) 
 set @imaDonBanHang = SCOPE_IDENTITY()
return @imaDonBanHang;
GO
/****** Object:  StoredProcedure [dbo].[sp_thayDoiTrangThaiNhanVien]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_thayDoiTrangThaiNhanVien]
@id int
as
DECLARE @tt bit
set @tt = (select bTrangThai from tblNhanVien where bTrangThai = @id)
if(@tt = 1)
begin
update tblNhanVien set bTrangThai = 0 where iMaNhanVien = @id
end
else
begin
update tblNhanVien set bTrangThai = 1 where iMaNhanVien = @id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_thayDoiTrangThaiNhanVien_2]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_thayDoiTrangThaiNhanVien_2]
@id int
as
DECLARE @tt SMALLINT
set @tt = (select bTrangThai from tblNhanVien where bTrangThai = @id)
if(@tt = 1)
begin
update tblNhanVien set bTrangThai = 0 where iMaNhanVien = @id
end
else
begin
update tblNhanVien set bTrangThai = 1 where iMaNhanVien = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_thayDoiTrangThaiNhanVien1]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_thayDoiTrangThaiNhanVien1]
@id int
as
DECLARE @tt SMALLINT
set @tt = (select bTrangThai from tblNhanVien where bTrangThai = @id)
if(@tt = 1)
begin
update tblNhanVien set bTrangThai = 0 where iMaNhanVien = @id
end
else
begin
update tblNhanVien set bTrangThai = 1 where iMaNhanVien = @id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_themChiTietDonbanhang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_themChiTietDonbanhang]
 @iMaDon int,
 @iSoLuong int,
 @iMaSanPham int,
 @iGiaGiam int
 as
 insert into tblChiTietdonBanHang (iMadonHang, iMaSanPham, iSoLuong, igiagiam)
 values (@iMaDon,@imasanpham,@isoLuong,@igiagiam)
GO
/****** Object:  StoredProcedure [dbo].[sp_themKhachHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_themKhachHang] 
@sTenKhachHang Nvarchar(30),	
@semail varchar(20),
@ssdt varchar(20),
@sdiachi NVARCHAR(30),
@bGioiTinh bit
as
insert into tblKhachHang(sTenKhachHang, sEmail, sSoDienThoai, sDiachi, bGioiTinh) 
Values (@sTenKhachHang,@semail,@ssdt,@sdiachi,@bGioiTinh)
GO
/****** Object:  StoredProcedure [dbo].[sp_themKhachHang_2]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themKhachHang_2] 
@sTenKhachHang Nvarchar(30),	
@semail varchar(20),
@ssdt varchar(20),
@sdiachi NVARCHAR(30),
@bGioiTinh bit,
@iMaKhachHang int out
as
insert into tblKhachHang(sTenKhachHang, sEmail, sSoDienThoai, sDiachi, bGioiTinh) OUTPUT INSERTED.iMaKhachHang  as id
Values (@sTenKhachHang,@semail,@ssdt,@sdiachi,@bGioiTinh)
 set @iMaKhachHang = SCOPE_IDENTITY()
return @iMaKhachHang 
GO
/****** Object:  StoredProcedure [dbo].[sp_themNhanVien]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themNhanVien]
@tenNV Nvarchar(30),	
@tenTK nvarchar(50),
@mk varchar(100),
@sdt nvarchar(20),
@diachi nvarchar(50),
@quyen int
as
insert into tblNhanVien(stenNV,sUserName, sPass,sDiachi,sSoDienThoai, iQuyen) values (@tenNV, @tenTK, @mk,@diachi,@sdt,@quyen);
GO
/****** Object:  StoredProcedure [dbo].[sp_themNhomHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themNhomHang]
@tenNhomHang Nvarchar(40)
as
insert into tblNhomHang(sTenNhomHang) values (@tenNhomHang);

GO
/****** Object:  StoredProcedure [dbo].[sp_themSanPham]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themSanPham] 
@sTenSanPham Nvarchar(40),	
@iMaNhomHang int ,
@smavach varchar(40),
@sMoTa NVARCHAR(100),
@igia int
as
insert into tblSanPham (sTenSanPham, iMaNhomHang, sMoTa, smavach, iGia) 
Values (@sTenSanPham,@iMaNhomHang,@smota,@sMaVach,@igia)
GO
/****** Object:  StoredProcedure [dbo].[sp_xemdanhsachdonBanHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE proc [dbo].[sp_xemdanhsachdonBanHang]  
 as  
 select ROW_NUMBER() OVER (ORDER BY tbldonBanHang.iMaDonHang) AS  STT,
  'DBH' + CONVERT(varchar(10), tbldonBanHang.iMaDonHang) as 'Đơn Bán',tbldonBanHang.iMaDonHang,  tbldonBanHang.dThoiGian as N'Thời Gian', tblNhanVien.stennv  as N'Tên Nhân Viên Lập Đơn' , tblKhachHang.sTenKhachHang  as N'Tên Khách Hàng' 
  from tbldonBanHang, tblNhanVien, tblKhachHang where    tblNhanVien.imanhanvien = tbldonBanHang.iMaNhanVien and tblKhachHang.iMaKhachHang = tblDonBanHang.iMaKhachHang
 --group by  tbldonBanHang.iMaDonHang, tbldonBanHang.dThoiGian --and tbl


GO
/****** Object:  StoredProcedure [dbo].[sp_xemDanhSachKhachHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[sp_xemDanhSachKhachHang]
as
select ROW_NUMBER() OVER (ORDER BY  imakhachhang) AS  STT, sTenKhachHang as  N'Tên Khách Hàng', imakhachhang,  sSoDienThoai  as  N'SĐT',sDiachi  as  N'Địa Chỉ', sEmail  as  N'Email', iif(bgioiTinh = 1 , N'Nam', N'Nữ') as  N'Giới Tính' from tblKhachHang where iMaKhachHang != 1
GO
/****** Object:  StoredProcedure [dbo].[sp_xemdonBanHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_xemdonBanHang]   ---loi
 as  
 select ROW_NUMBER() OVER (ORDER BY tbldonBanHang.iMaDonHang) AS  STT,
  'DBH' + CONVERT(varchar(10), tbldonBanHang.iMaDonHang) as 'Đơn Nhập',tbldonBanHang.iMaDonHang,  tbldonBanHang.dThoiGian as N'Thời Gian', tblNhanVien.stennv  as N'Tên Nhân Viên Lập Đơn' , tblKhachHang.sTenKhachHang  as N'Tên Khách Hàng' 
  from tbldonBanHang, tblNhanVien, tblKhachHang where tblNhanVien.imanhanvien = tbldonBanHang.iMaNhanVien and tblKhachHang.iMaKhachHang = tblDonBanHang.iMaKhachHang


GO
/****** Object:  StoredProcedure [dbo].[sp_xemdonBanHangTheoMa]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  CREATE proc [dbo].[sp_xemdonBanHangTheoMa]
  @maDon int
  as
  select  ROW_NUMBER() OVER (ORDER BY tblSanPham.sTenSanPham) AS  STT , 
  tblSanPham.sTenSanPham as N'Tên Sản Phẩm',tblChiTietdonBanHang.iSoLuong *  iif(tblChiTietdonBanHang.iGiaGiam = 0,tblSanPham.igia,tblsanpham.igia - tblChiTietdonBanHang.igiaGiam) as N'Thành Tiền' 

  , tblSanPham.iMaSanPham
   from tblChiTietdonBanHang, tblSanPham where iMaDonHang = @maDon and tblChiTietdonBanHang.iMaSanPham = tblSanPham.iMaSanPham



GO
/****** Object:  StoredProcedure [dbo].[sp_xemdonBanHangTheoMaDon]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_xemdonBanHangTheoMaDon]  
@iMaDon int
as
select ROW_NUMBER() OVER (ORDER BY sTenSanPham) AS  STT,tblSanPham.iMaSanPham, tblSanPham.sTenSanPham as N'Tên Sản Phẩm', tblChiTietdonBanHang.iSoLuong as N'Số Lượng',tblChiTietdonBanHang.iSoLuong *  iif(tblChiTietdonBanHang.iGiaGiam = 0,tblSanPham.igia,tblsanpham.igia - tblChiTietdonBanHang.igiaGiam) as N'Thành Tiền' 
 from tblChiTietdonBanHang, tblSanPham
 where iMadonHang = @iMaDon and tblChiTietdonBanHang.iMaSanPham = tblSanPham.iMaSanPham
GO
/****** Object:  StoredProcedure [dbo].[sp_xemdsnv]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_xemdsnv]
 as
 select * from tblNhanVien
GO
/****** Object:  StoredProcedure [dbo].[sp_xemNhomHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xemNhomHang]
as
select ROW_NUMBER() OVER (ORDER BY sTenNhomHang)  as STT,iMaNhomHang, sTenNhomHang as N'Tên Nhóm Hàng' from tblNhomHang
GO
/****** Object:  StoredProcedure [dbo].[sp_xemSanPham]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_xemSanPham]  
as
select  ROW_NUMBER() OVER (ORDER BY igia) AS  STT,iMaSanPham, sTenSanPham as N'Tên Sản Phẩm',sMaVach as N'Mã Vạch', stennhomhang as N'Nhóm Hàng',igia as N'Giá', sMota as N'Mô Tả' from tblSanPham, tblNhomHang where tblNhomHang.iMaNhomHang = tblSanPham.iMaNhomHang 

GO
/****** Object:  StoredProcedure [dbo].[sp_xemSanPhamChoCCB]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_xemSanPhamChoCCB]
as
select iMaSanPham, sTenSanPham from tblSanPham

GO
/****** Object:  StoredProcedure [dbo].[sp_xoaDonBan]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaDonBan]
@id int
as
delete from tblChiTietDonBanHang where iMaDonHang = @id

delete from tblDonBanHang where iMaDonHang = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaDonHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   create proc [dbo].[sp_xoaDonHang]
   @id int
   as
   delete from tblChiTietdonBanHang where iMaDonHang = @id
      delete from tbldonBanHang where iMaDonHang = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaKhachHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaKhachHang]
@imakhachhang int
as
delete from tblkhachhang where imakhachhang = @imakhachhang
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaNhomHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaNhomHang]
@id int
as
delete from tblNhomHang where iMaNhomHang = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaSanPham]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaSanPham]
@id int
as
delete from tblSanPham where iMaSanPham = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaSanPhamKhoiDonBanHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_xoaSanPhamKhoiDonBanHang]
 @idDon int,
 @idSanPham int
 as
 delete from tblChiTietdonBanHang where iMaDonHang = @idDon and iMaSanPham = @idSanPham
GO
/****** Object:  StoredProcedure [dbo].[updatekh_]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatekh_]
as
update tblKhachHang set sTenKhachHang = N'Khách Lẻ' where iMaKhachHang = 1
GO
/****** Object:  Table [dbo].[tblChiTietDonBanHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietDonBanHang](
	[iMaDonHang] [int] NOT NULL,
	[iMaSanPham] [int] NOT NULL,
	[iSoLuong] [int] NULL,
	[igiagiam] [int] NULL,
 CONSTRAINT [PK_HNHH] PRIMARY KEY CLUSTERED 
(
	[iMaDonHang] ASC,
	[iMaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDonBanHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDonBanHang](
	[iMaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[iMaNhanVien] [int] NULL,
	[iMaKhachHang] [int] NULL,
	[dThoiGian] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKhachHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhachHang](
	[iMaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[sTenKhachHang] [nvarchar](30) NULL,
	[sSoDienThoai] [nvarchar](20) NULL,
	[sEmail] [nvarchar](20) NULL,
	[sDiachi] [nvarchar](30) NULL,
	[bGioiTinh] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNhanVien](
	[iMaNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[stenNV] [nvarchar](30) NULL,
	[sSoDienThoai] [nvarchar](20) NULL,
	[bTrangThai] [int] NULL,
	[iQuyen] [int] NULL,
	[sDiachi] [nvarchar](30) NULL,
	[sUserName] [nvarchar](20) NULL,
	[sPass] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNhomHang]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhomHang](
	[iMaNhomHang] [int] IDENTITY(1,1) NOT NULL,
	[sTenNhomHang] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNhomHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSanPham]    Script Date: 26/11/2020 4:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSanPham](
	[iMaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[sTenSanPham] [nvarchar](50) NULL,
	[iMaNhomHang] [int] NOT NULL,
	[iGia] [int] NULL,
	[sMoTa] [nvarchar](100) NULL,
	[sMaVach] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (4, 1, 10, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (6, 2, 12, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (6, 3, 12, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (7, 2, 12, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (7, 3, 12, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (17, 2, 12, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (17, 3, 43, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (18, 3, 33, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (19, 3, 32, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (23, 2, 1, 333)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (23, 3, 121, 1222)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (25, 1, 1, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (26, 1, 12, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (26, 4, 2, 12)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (28, 4, 0, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (49, 2, 3, 3000)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (49, 5, 2, 25000)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (50, 1, 2, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (50, 6, 2, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (51, 1, 3, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (51, 12, 3, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (54, 9, 4, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (56, 1, 3, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (57, 6, 23, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (58, 3, 3, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (61, 7, 0, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (61, 9, 3, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (62, 5, 44, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (82, 6, 3, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (83, 5, 20, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (85, 5, 4, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (87, 1, 2, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (90, 5, 3, 3000)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (90, 10, 4, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (92, 9, 3, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (95, 10, 4, 0)
INSERT [dbo].[tblChiTietDonBanHang] ([iMaDonHang], [iMaSanPham], [iSoLuong], [igiagiam]) VALUES (97, 5, 3, 0)
SET IDENTITY_INSERT [dbo].[tblDonBanHang] ON 

INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (1, 1, NULL, CAST(0x0000AC32013BBFAE AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (2, 1, 3, CAST(0x0000AC320157B1ED AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (3, 1, 3, CAST(0x0000AC320158595B AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (4, 1, 3, CAST(0x0000AC3201588CD5 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (5, 1, 3, CAST(0x0000AC320159C0A7 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (6, 1, 3, CAST(0x0000AC32015A4E41 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (7, 1, 3, CAST(0x0000AC32015D6D27 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (9, 1, 3, CAST(0x0000AC32015DDB49 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (12, 1, 1, CAST(0x0000AC32015E59A9 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (13, 1, 1, CAST(0x0000AC3201661BA3 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (14, 1, 1, CAST(0x0000AC32016682AE AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (15, 1, 1, CAST(0x0000AC320166B9CA AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (16, 1, 1, CAST(0x0000AC320166D344 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (17, 1, 1, CAST(0x0000AC3201678F53 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (18, 1, 1, CAST(0x0000AC32016A2004 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (19, 1, 4, CAST(0x0000AC33000D0D38 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (20, 1, 1, CAST(0x0000AC3300107A33 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (21, 1, 3, CAST(0x0000AC330010AA3B AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (22, 1, 1, CAST(0x0000AC3D010FCB59 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (23, 1, 1, CAST(0x0000AC3D01104A7C AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (24, 1, 1, CAST(0x0000AC3D011128B7 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (25, 1, 3, CAST(0x0000AC3D01113D8E AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (26, 1, 1, CAST(0x0000AC3D01116D5B AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (27, 1, 1, CAST(0x0000AC5F00F2DFF0 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (28, 1, 1, CAST(0x0000AC5F00F3F00A AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (29, 1, 1, CAST(0x0000AC5F00F4D645 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (30, 1, 1, CAST(0x0000AC5F010420A7 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (31, 1, 1, CAST(0x0000AC5F0104F13D AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (32, 1, 1, CAST(0x0000AC5F0105E290 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (33, 1, 1, CAST(0x0000AC5F010652B8 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (34, 1, 1, CAST(0x0000AC5F0106A0FE AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (35, 1, 1, CAST(0x0000AC5F0107029A AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (36, 1, 1, CAST(0x0000AC5F0108818A AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (37, 1, 1, CAST(0x0000AC5F0109FA8A AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (38, 1, 1, CAST(0x0000AC5F010B453F AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (39, 1, 1, CAST(0x0000AC5F010C144B AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (40, 1, 1, CAST(0x0000AC5F010C5753 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (41, 1, 1, CAST(0x0000AC5F010CDEBF AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (42, 1, 1, CAST(0x0000AC5F010D1483 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (43, 1, 1, CAST(0x0000AC5F010E9E50 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (44, 1, 1, CAST(0x0000AC5F010EF2C4 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (45, 1, 1, CAST(0x0000AC5F010F4A40 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (46, 1, 1, CAST(0x0000AC5F010F526F AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (47, 1, 1, CAST(0x0000AC5F010F898A AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (48, 1, 1, CAST(0x0000AC5F010FE619 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (49, 1, 1, CAST(0x0000AC6200DD47B5 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (50, 1, 1, CAST(0x0000AC6200E0FD44 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (51, 1, 1, CAST(0x0000AC6200E1EA1B AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (54, 1, 1, CAST(0x0000AC6200EB543B AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (56, 1, 8, CAST(0x0000AC6200ED2D0A AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (57, 1, 5, CAST(0x0000AC6200ED9EC2 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (58, 1, 9, CAST(0x0000AC6200EE0D3E AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (61, 1, 1, CAST(0x0000AC6200F14C24 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (62, 1, 10, CAST(0x0000AC6300ED0147 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (64, 1, 1, CAST(0x0000AC6600EFD809 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (65, 1, 1, CAST(0x0000AC6600F0541A AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (76, 1, 1, CAST(0x0000AC6600F7BD36 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (77, 1, 1, CAST(0x0000AC6600F88639 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (79, 1, 1, CAST(0x0000AC6600F95E53 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (80, 1, 1, CAST(0x0000AC6600FA4846 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (82, 1, 1, CAST(0x0000AC6600FD72AE AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (83, 1, 5, CAST(0x0000AC6600FD9F46 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (85, 1, 11, CAST(0x0000AC6600FE25A5 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (87, 1, 3, CAST(0x0000AC68015ECD18 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (90, 1, 1, CAST(0x0000AC7E014447F5 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (92, 1, 1, CAST(0x0000AC7E01458E98 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (93, 1, 1, CAST(0x0000AC7E01468F0A AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (95, 1, 1, CAST(0x0000AC7E0146FC19 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (96, 2, 1, CAST(0x0000AC7E0147B036 AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (97, 2, 5, CAST(0x0000AC7E0148BADA AS DateTime))
INSERT [dbo].[tblDonBanHang] ([iMaDonHang], [iMaNhanVien], [iMaKhachHang], [dThoiGian]) VALUES (99, 2, 4, CAST(0x0000AC7E0149DAAF AS DateTime))
SET IDENTITY_INSERT [dbo].[tblDonBanHang] OFF
SET IDENTITY_INSERT [dbo].[tblKhachHang] ON 

INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (1, N'Khách Lẻ', N'089656562', N'momueleu32@gmail.com', N'Giải Phóng - Hà Nội', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (3, N'Le Van A', N'035658848', N'abc@gmail.com', N'HN', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (4, N'Le Van V', N'0758456459', N'abc@gmail.com', N'Hà Nội', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (5, N'Nguyễn Van C', N'0552422544', N'abc@gmail.com', N' Hà Nội', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (6, N'Lê Van D', N'0552422544', N'abc@gmail.com', N'Hà Nội', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (7, N'Le Van E', N'534534', N'abc@gmail.com', N'3543545', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (8, N'Le Van H', N'dá', N'abc@gmail.com', N'sads', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (9, N'ádasd', N'424324', N'dâs', N'đá', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (10, N'aaa11', N'234324', N'3243432', N'4332', 1)
INSERT [dbo].[tblKhachHang] ([iMaKhachHang], [sTenKhachHang], [sSoDienThoai], [sEmail], [sDiachi], [bGioiTinh]) VALUES (11, N'qưeqe', N'23423423', N'sdsd', N'adsad', 1)
SET IDENTITY_INSERT [dbo].[tblKhachHang] OFF
SET IDENTITY_INSERT [dbo].[tblNhanVien] ON 

INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (1, N'Nhan vien 6', N'0864854845', 1, 2, N'HN', N'admin2', N'21232F297A57A5A743894A0E4A801FC3')
INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (2, N'nv 5', N'0982225545', 1, 2, N'Định Công - Hà Nội', N'admin', N'21232F297A57A5A743894A0E4A801FC3')
INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (3, N'nv 4', N'0885654845', 1, 2, N'Định Công - HN', N'nhanvien1', N'E10ADC3949BA59ABBE56E057F20F883E')
INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (4, N'111', N'111', 1, 2, N'111', N'', N'D41D8CD98F00B204E9800998ECF8427E')
INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (5, N'nv 3', N'085956595', 1, 2, N'Hà Nội', N'nhanvien2', N'E10ADC3949BA59ABBE56E057F20F883E')
INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (6, N'nv 2', N'085956595', 1, 2, N'Hà Nội', N'nv2', N'81DC9BDB52D04DC20036DBD8313ED055')
INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (7, N'BBBB', N'0885654845', 1, 2, N'Định Công - HN', N'a222', N'BCBE3365E6AC95EA2C0343A2395834DD')
INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (8, N'AAA', N'0885654845', 1, 2, N'Định Công - HN', N'asss', N'4124BC0A9335C27F086F24BA207A4912')
SET IDENTITY_INSERT [dbo].[tblNhanVien] OFF
SET IDENTITY_INSERT [dbo].[tblNhomHang] ON 

INSERT [dbo].[tblNhomHang] ([iMaNhomHang], [sTenNhomHang]) VALUES (1, N'Máy hút khi')
INSERT [dbo].[tblNhomHang] ([iMaNhomHang], [sTenNhomHang]) VALUES (3, N'Tủ Lạnh')
INSERT [dbo].[tblNhomHang] ([iMaNhomHang], [sTenNhomHang]) VALUES (4, N'Bếp')
INSERT [dbo].[tblNhomHang] ([iMaNhomHang], [sTenNhomHang]) VALUES (5, N'Máy Giặt')
SET IDENTITY_INSERT [dbo].[tblNhomHang] OFF
SET IDENTITY_INSERT [dbo].[tblSanPham] ON 

INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (1, N'Hut Mui ABC42  bosch ', 1, 1200000, N'MO TA', N'3123213324')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (2, N'Hut Mui  bosch Adsds23', 1, 2500000, N'MO TA', N'212121353453')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (3, N'Bếp  bosch 534234', 4, 5000000, N'MO TA', N'5564442321')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (4, N'Tủ lạnh  bosch FH24', 3, 1250000, N'MO TA', N'34543534666')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (5, N'Hut mui bosch 3232', 1, 1000000, N'MO TA', N'3123213213')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (6, N'Tủ Lạnh FHS bosch 32', 3, 1350000, N'MO TA', N'756534666')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (7, N'Bếp  bosch AD32', 4, 5500000, N'MO TA', N'55644552321')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (9, N'Hút khi  bosch 53kD', 1, 550000, N'MO TA', N'2121213533453')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (10, N'Tủ Lạnh  bosch 352', 3, 1350000, N'MO TA', N'756534666')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (11, N'Tủ lạnh HFAUS423  bosch ', 3, 1350000, N'MO TA', N'756534666')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iGia], [sMoTa], [sMaVach]) VALUES (12, N'Bếp  bosch 4235sds', 4, 550000, N'MO TA', N'55644552321')
SET IDENTITY_INSERT [dbo].[tblSanPham] OFF
ALTER TABLE [dbo].[tblNhanVien] ADD  DEFAULT ((1)) FOR [bTrangThai]
GO
ALTER TABLE [dbo].[tblChiTietDonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_1] FOREIGN KEY([iMaDonHang])
REFERENCES [dbo].[tblDonBanHang] ([iMaDonHang])
GO
ALTER TABLE [dbo].[tblChiTietDonBanHang] CHECK CONSTRAINT [FK_1]
GO
ALTER TABLE [dbo].[tblChiTietDonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_2] FOREIGN KEY([iMaSanPham])
REFERENCES [dbo].[tblSanPham] ([iMaSanPham])
GO
ALTER TABLE [dbo].[tblChiTietDonBanHang] CHECK CONSTRAINT [FK_2]
GO
ALTER TABLE [dbo].[tblDonBanHang]  WITH CHECK ADD FOREIGN KEY([iMaKhachHang])
REFERENCES [dbo].[tblKhachHang] ([iMaKhachHang])
GO
ALTER TABLE [dbo].[tblDonBanHang]  WITH CHECK ADD FOREIGN KEY([iMaNhanVien])
REFERENCES [dbo].[tblNhanVien] ([iMaNhanVien])
GO
ALTER TABLE [dbo].[tblSanPham]  WITH CHECK ADD FOREIGN KEY([iMaNhomHang])
REFERENCES [dbo].[tblNhomHang] ([iMaNhomHang])
GO
USE [master]
GO
ALTER DATABASE [quanLyBanHangTapHoa] SET  READ_WRITE 
GO
