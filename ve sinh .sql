USE [master]
GO
/****** Object:  Database [quanLyNhapThietBiVeSinh]    Script Date: 26/11/2020 4:43:12 PM ******/
CREATE DATABASE [quanLyNhapThietBiVeSinh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanLyNhapThietBiVeSinh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\quanLyNhapThietBiVeSinh.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'quanLyNhapThietBiVeSinh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\quanLyNhapThietBiVeSinh_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanLyNhapThietBiVeSinh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET  MULTI_USER 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [quanLyNhapThietBiVeSinh]
GO
/****** Object:  StoredProcedure [dbo].[sp_baoCaoSanPhamNhapTheoNhomHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_baoCaoSanPhamNhapTheoNhomHang]
@ngayBatDau datetime,
@ngayKetThuc datetime
as
select d.iMaNhomHang, d.sTenNhomHang,  sum(c.iSoLuong ) as soLuong
 from tblPhieuNhapHang a, tblSanPham b, tblChiTietPhieuNhapHang c, tblNhomHang d
 where a.iMaphieuNhapHang = c.iMaphieuNhapHang and c.iMaSanPham = b.iMaSanPham 
 and b.iMaNhomHang = d.iMaNhomHang
 and a.dThoiGian <= @ngayKetThuc and a.dThoiGian >= @ngayBatDau
group by d.iMaNhomHang,  d.sTenNhomHang
GO
/****** Object:  StoredProcedure [dbo].[sp_baoCaoSanPhamNhapTheoNhomHang_2]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_baoCaoSanPhamNhapTheoNhomHang_2]
@ngayBatDau datetime,
@ngayKetThuc datetime
as
select d.iMaNhomHang, d.sTenNhomHang,  sum(c.iSoLuong ) as soLuong
 from tblPhieuNhapHang a, tblSanPham b, tblChiTietPhieuNhapHang c, tblNhomHang d
 where a.iMaphieuNhapHang = c.iMaphieuNhapHang and c.iMaSanPham = b.iMaSanPham 
 and b.iMaNhomHang = d.iMaNhomHang
 and a.dThoiGian <= @ngayKetThuc and a.dThoiGian >= @ngayBatDau
group by d.iMaNhomHang,  d.sTenNhomHang
GO
/****** Object:  StoredProcedure [dbo].[sp_capNhatChiTietDonNhap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_capNhatChiTietDonNhap]
 @idDon int,
 @iSoLuong int,
 @idSanPham int,
 @iDonGia int
 as
 update tblChiTietphieuNhapHang set iSoLuong = @iSoLuong, iDonGia = @iDonGia where
 iMaphieuNhapHang =  @idDon and iMaSanPham = @idSanPham

GO
/****** Object:  StoredProcedure [dbo].[sp_capNhatNhanVien_]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_capNhatNhanVien_]
@tenNV Nvarchar(30),	
@sdt nvarchar(20),
@diachi nvarchar(50),
@quyen int,
@manv int
as
update tblNhanVien set stenNV = @tenNV,sDiachi = @diachi,sSoDienThoai = @sdt,  iQuyen = @quyen where imanhanvien = @manv
GO
/****** Object:  StoredProcedure [dbo].[sp_capNhatSoLuong]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_capNhatSoLuong]
 @idDon int,
 @iSoLuong int,
 @idSanPham int
 as
 update tblChiTietphieuNhapHang set iSoLuong = @iSoLuong where
 iMaphieuNhapHang =  @idDon and iMaSanPham = @idSanPham
GO
/****** Object:  StoredProcedure [dbo].[sp_danhSachNhanVien]    Script Date: 26/11/2020 4:43:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DoiMatKhau]    Script Date: 26/11/2020 4:43:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_kiemTraDangNhap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_kiemTraDangNhap]
@tenTK nvarchar(50),
@mk varchar(100)
as
select  iMaNhanVien, iQuyen from tblNhanVien where sUserName = @tenTK and sPass = @mk and bTrangThai = 1
GO
/****** Object:  StoredProcedure [dbo].[sp_kiemTraMK]    Script Date: 26/11/2020 4:43:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ktraSanPhamNhapDon]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ktraSanPhamNhapDon]
 @idDon int,
 @idSanPham int
 as
select * from tblChiTietphieuNhapHang where
 iMaphieuNhapHang =  @idDon and iMaSanPham = @idSanPham
 select * from tblNhanVien
GO
/****** Object:  StoredProcedure [dbo].[sp_ktraTen]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ktraTen]
@username nvarchar(20)
as
select count(*) from tblNhanVien where sUserName = @username
GO
/****** Object:  StoredProcedure [dbo].[sp_suaSanPham]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_suaSanPham] 
@imaSanPham int,
@sTenSanPham Nvarchar(40),	
@iMaBoSuuTap int,
@iMaNhomHang int ,
@sKichThuoc Nvarchar(50),
@sTinhNang NVARCHAR(300),
@sHinhanh NVARCHAR(100),
@sXuatxu nvarchar(100),
@gia int
as
update tblSanPham  set sTenSanPham = @sTenSanPham, iMaBoSuuTap = @iMaBoSuuTap, iMaNhomHang = @iMaNhomHang, sxuatxu = @sXuatxu ,
sKichThuoc = @sKichThuoc , sTinhNang =@sTinhNang, iGia = @gia, shinhanh = @sHinhanh where iMaSanPham = @imaSanPham 
GO
/****** Object:  StoredProcedure [dbo].[sp_taophieuNhaphang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_taophieuNhaphang]
@iMaNhanVien int,
@thoigian datetime,
@imaphieuNhap int out
as
insert into tblphieuNhapHang (iMaNhanVien, dThoiGian) OUTPUT INSERTED.iMaphieuNhapHang as id values (@iMaNhanVien,@thoigian) 
 set @imaphieuNhap = SCOPE_IDENTITY()
return @imaphieuNhap;
GO
/****** Object:  StoredProcedure [dbo].[sp_thayDoiTrangThaiNhanVien]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_thayDoiTrangThaiNhanVien]
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
/****** Object:  StoredProcedure [dbo].[sp_themBoSuuTap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themBoSuuTap]
@tenBoSuuTap Nvarchar(40)
as
insert into tblbosuutap(sTenBoSuuTap) values (@tenBoSuuTap);
GO
/****** Object:  StoredProcedure [dbo].[sp_themChiTietphieuNhap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_themChiTietphieuNhap]
 @iMaDon int,
 @iSoLuong int,
 @iMaSanPham int,
 @iDonGia int
 as
 insert into tblChiTietphieuNhapHang (iMaphieuNhapHang, iMaSanPham, iSoLuong, idongia)
 values (@iMaDon,@imasanpham,@isoLuong,@iDonGia)
GO
/****** Object:  StoredProcedure [dbo].[sp_themNhanVien]    Script Date: 26/11/2020 4:43:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_themNhomHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_themNhomHang]
@tenNhomHang Nvarchar(40)
as
insert into tblNhomHang(sTenNhomHang) values (@tenNhomHang);
GO
/****** Object:  StoredProcedure [dbo].[sp_themSanPham]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_themSanPham] 
@sTenSanPham Nvarchar(40),	
@iMaNhomHang int ,
@iMaBoSuuTap int ,
@sKichThuoc Nvarchar(50),
@sXuatxu nvarchar(100),
@sTinhNang NVARCHAR(300),
@sHinhanh NVARCHAR(100),
@gia int
as
insert into tblSanPham (sTenSanPham, iMaNhomHang,iMaBoSuuTap, sKichThuoc, sTinhNang, iGia, shinhanh,sxuatxu) 
Values (@sTenSanPham,@iMaNhomHang,@iMaBoSuuTap,@sKichThuoc,@sTinhNang,@gia,@shinhanh,@sxuatxu)

GO
/****** Object:  StoredProcedure [dbo].[sp_thongKeSanPhamNhapTHeoNgay]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_thongKeSanPhamNhapTHeoNgay]
@ngayBatDau datetime,
@ngayKetThuc datetime
as
select tblSanPham.sTenSanPham as N'Tên Sản Phẩm', ISNULL(sum(tblChiTietphieuNhapHang.iSoLuong),0) as N'Số Lượng', ISNULL(sum(tblChiTietphieuNhapHang.idongia),0) as N'Tiền Nhập'from tblChiTietphieuNhapHang, tblphieuNhapHang, tblSanPham where tblChiTietphieuNhapHang.iMaphieuNhapHang = tblphieuNhapHang.iMaphieuNhapHang and
tblChiTietphieuNhapHang.iMaSanPham = tblSanPham.iMaSanPham and tblphieuNhapHang.dThoiGian <= @ngayKetThuc and tblphieuNhapHang.dThoiGian >= @ngayBatDau
group by  tblSanPham.sTenSanPham
GO
/****** Object:  StoredProcedure [dbo].[sp_timDonNhapHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_timDonNhapHang]
 @madon int
as
select ROW_NUMBER() OVER (ORDER BY tblphieuNhapHang.iMaphieuNhapHang) AS  STT,
  'DNH' + CONVERT(varchar(10), tblphieuNhapHang.iMaphieuNhapHang) as 'Đơn Nhập',tblphieuNhapHang.iMaphieuNhapHang,  tblphieuNhapHang.dThoiGian as N'Thời Gian', tblNhanVien.stennv  as N'Tên Nhân Viên Lập Đơn',IIF(tblNhanVien.iquyen = 1, N'Nhân Viên', N'Quản Lý') as N'Quyền'
  from tblphieuNhapHang, tblNhanVien where tblNhanVien.imanhanvien = tblphieuNhapHang.iMaNhanVien and tblPhieuNhapHang.iMaphieuNhapHang = @madon

GO
/****** Object:  StoredProcedure [dbo].[sp_timsp]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_timsp]
@ten nvarchar(30)
as
select  ROW_NUMBER() OVER (ORDER BY igia) AS  STT,iMaSanPham, sTenSanPham as N'Tên Sản Phẩm',
sKichThuoc as N'Kích Thước', stennhomhang as N'Nhóm Hàng',igia as N'Giá',tblbosuutap.sTenBoSuuTap as N'Bộ Sưu Tập', sTinhNang as N'Tính Năng',sxuatxu as N'Xuất Xứ',shinhanh from tblSanPham, tblNhomHang, tblbosuutap
 where tblNhomHang.iMaNhomHang = tblSanPham.iMaNhomHang and tblbosuutap.iMaBoSuuTap = tblSanPham.iMaBoSuuTap and
 tblSanPham.stensanpham like '%' + @ten + '%'
GO
/****** Object:  StoredProcedure [dbo].[sp_xemDanhSachBoSuuTap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_xemDanhSachBoSuuTap]
as
select ROW_NUMBER() OVER (ORDER BY sTenBoSuuTap)  as STT,iMaBoSuuTap, sTenBoSuuTap as N'Tên Bộ Sưu Tập' from tblbosuutap
GO
/****** Object:  StoredProcedure [dbo].[sp_xemDanhSachBoTap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xemDanhSachBoTap]
as
select ROW_NUMBER() OVER (ORDER BY sTenBoSuuTap)  as STT,iMaBoSuuTap, sTenBoSuuTap as N'Tên Nhóm Hàng' from tblbosuutap
GO
/****** Object:  StoredProcedure [dbo].[sp_xemDanhSachDonNhapHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_xemDanhSachDonNhapHang]
as
select ROW_NUMBER() OVER (ORDER BY tblphieuNhapHang.iMaphieuNhapHang) AS  STT,
  'DNH' + CONVERT(varchar(10), tblphieuNhapHang.iMaphieuNhapHang) as 'Đơn Nhập',tblphieuNhapHang.iMaphieuNhapHang,  tblphieuNhapHang.dThoiGian as N'Thời Gian', tblNhanVien.stennv  as N'Tên Nhân Viên Lập Đơn',IIF(tblNhanVien.iquyen = 1, N'Nhân Viên', N'Quản Lý') as N'Quyền'
  from tblphieuNhapHang, tblNhanVien where tblNhanVien.imanhanvien = tblphieuNhapHang.iMaNhanVien

GO
/****** Object:  StoredProcedure [dbo].[sp_xemDonNhapHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xemDonNhapHang]
@iMaDon int
as
select ROW_NUMBER() OVER (ORDER BY sTenSanPham) AS  STT,tblSanPham.iMaSanPham, tblSanPham.sTenSanPham as N'Tên Sản Phẩm', tblChiTietDonNhapHang.iSoLuong as N'Số Lượng' from tblChiTietDonNhapHang, tblSanPham
 where iMaDonNhapHang = @iMaDon and tblChiTietDonNhapHang.iMaSanPham = tblSanPham.iMaSanPham

GO
/****** Object:  StoredProcedure [dbo].[sp_xemNhomHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_xemNhomHang]
as
select ROW_NUMBER() OVER (ORDER BY sTenNhomHang)  as STT,iMaNhomHang, sTenNhomHang as N'Tên Nhóm Hàng' from tblNhomHang
GO
/****** Object:  StoredProcedure [dbo].[sp_xemphieuNhapHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_xemphieuNhapHang]
@iMaDon int
as
select ROW_NUMBER() OVER (ORDER BY sTenSanPham) AS  STT,tblSanPham.iMaSanPham, tblSanPham.sTenSanPham as N'Tên Sản Phẩm', tblChiTietphieuNhapHang.iSoLuong as N'Số Lượng' 
, tblChiTietphieuNhapHang.idongia as N'Đơn Giá' from tblChiTietphieuNhapHang, tblSanPham
 where iMaphieuNhapHang = @iMaDon and tblChiTietphieuNhapHang.iMaSanPham = tblSanPham.iMaSanPham
GO
/****** Object:  StoredProcedure [dbo].[sp_xemphieuNhapHangTheoMa]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE proc [dbo].[sp_xemphieuNhapHangTheoMa]
  @maDon int
  as
  select  ROW_NUMBER() OVER (ORDER BY tblSanPham.sTenSanPham) AS  STT , 
  tblSanPham.sTenSanPham as N'Tên Sản Phẩm', tblChiTietphieuNhapHang.idongia as N'Đơn Giá Nhập' , tblChiTietphieuNhapHang.iSoLuong as N'Số Lượng' 
   from tblChiTietphieuNhapHang, tblSanPham where iMaphieuNhapHang = @maDon and tblChiTietphieuNhapHang.iMaSanPham = tblSanPham.iMaSanPham

GO
/****** Object:  StoredProcedure [dbo].[sp_xemSanPham]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_xemSanPham]
as
select  ROW_NUMBER() OVER (ORDER BY igia) AS  STT,iMaSanPham, sTenSanPham as N'Tên Sản Phẩm',
sKichThuoc as N'Kích Thước', stennhomhang as N'Nhóm Hàng',igia as N'Giá',tblbosuutap.sTenBoSuuTap as N'Bộ Sưu Tập', sTinhNang as N'Tính Năng',sxuatxu as N'Xuất Xứ',shinhanh from tblSanPham, tblNhomHang, tblbosuutap
 where tblNhomHang.iMaNhomHang = tblSanPham.iMaNhomHang and tblbosuutap.iMaBoSuuTap = tblSanPham.iMaBoSuuTap
GO
/****** Object:  StoredProcedure [dbo].[sp_xemSanPhamChoCCB]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_xemSanPhamChoCCB]
as
select iMaSanPham, sTenSanPham from tblSanPham
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaBoSuuTap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaBoSuuTap]
@id int
as
delete from tblbosuutap where iMaBoSuuTap = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaNhomHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaNhomHang]
@id int
as
delete from tblNhomHang where iMaNhomHang = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaphieuNhap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[sp_xoaphieuNhap]
   @id int
   as
   delete from tblChiTietphieuNhapHang where iMaphieuNhapHang = @id
      delete from tblphieuNhapHang where iMaphieuNhapHang = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaSanPham]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaSanPham]
@id int
as
delete from tblSanPham where iMaSanPham = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaSanPhamKhoiPhieu]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaSanPhamKhoiPhieu]
 @idDon int,
 @idSanPham int
 as
 delete from tblChiTietphieuNhapHang where iMaphieuNhapHang = @idDon and iMaSanPham = @idSanPham
GO
/****** Object:  Table [dbo].[tblbosuutap]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblbosuutap](
	[iMaBoSuuTap] [int] IDENTITY(1,1) NOT NULL,
	[sTenBoSuuTap] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaBoSuuTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChiTietPhieuNhapHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietPhieuNhapHang](
	[iMaphieuNhapHang] [int] NOT NULL,
	[iMaSanPham] [int] NOT NULL,
	[iSoLuong] [int] NULL,
	[idongia] [int] NULL,
 CONSTRAINT [PK_HNHH] PRIMARY KEY CLUSTERED 
(
	[iMaphieuNhapHang] ASC,
	[iMaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 26/11/2020 4:43:12 PM ******/
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
/****** Object:  Table [dbo].[tblNhomHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhomHang](
	[iMaNhomHang] [int] IDENTITY(1,1) NOT NULL,
	[sTenNhomHang] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNhomHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPhieuNhapHang]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuNhapHang](
	[iMaphieuNhapHang] [int] IDENTITY(1,1) NOT NULL,
	[iMaNhanVien] [int] NULL,
	[dThoiGian] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaphieuNhapHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSanPham]    Script Date: 26/11/2020 4:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSanPham](
	[iMaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[sTenSanPham] [nvarchar](40) NULL,
	[iMaNhomHang] [int] NOT NULL,
	[iMaBoSuuTap] [int] NOT NULL,
	[iGia] [int] NULL,
	[sKichThuoc] [nvarchar](50) NULL,
	[sTinhNang] [nvarchar](300) NULL,
	[shinhanh] [nvarchar](100) NULL,
	[idongia] [int] NULL,
	[sXuatxu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblbosuutap] ON 

INSERT [dbo].[tblbosuutap] ([iMaBoSuuTap], [sTenBoSuuTap]) VALUES (1, N'S600')
INSERT [dbo].[tblbosuutap] ([iMaBoSuuTap], [sTenBoSuuTap]) VALUES (2, N'S500')
SET IDENTITY_INSERT [dbo].[tblbosuutap] OFF
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (3, 1, 21, 450000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (3, 3, 21, 500000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (3, 4, 3, NULL)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (5, 1, 10, 459)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (5, 4, 6, 4640000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (6, 1, 3, 3)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (6, 6, 3, 4600000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (8, 1, 6, 459999)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (8, 5, 5, 340000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (9, 1, 3, 3000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (10, 5, 4, 5000000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (14, 1, 3, 1222222)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (15, 1, 3, 5000000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (17, 1, 3, 333)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (18, 1, 3, 333333)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (19, 1, 3, 10000)
INSERT [dbo].[tblChiTietPhieuNhapHang] ([iMaphieuNhapHang], [iMaSanPham], [iSoLuong], [idongia]) VALUES (20, 1, 3, 1)
SET IDENTITY_INSERT [dbo].[tblNhanVien] ON 

INSERT [dbo].[tblNhanVien] ([iMaNhanVien], [stenNV], [sSoDienThoai], [bTrangThai], [iQuyen], [sDiachi], [sUserName], [sPass]) VALUES (1, N'admin 1', N'08965962555', 1, 2, N'Hà Nội', N'Admin', N'21232F297A57A5A743894A0E4A801FC3')
SET IDENTITY_INSERT [dbo].[tblNhanVien] OFF
SET IDENTITY_INSERT [dbo].[tblNhomHang] ON 

INSERT [dbo].[tblNhomHang] ([iMaNhomHang], [sTenNhomHang]) VALUES (5, N'Chậu Rửa')
INSERT [dbo].[tblNhomHang] ([iMaNhomHang], [sTenNhomHang]) VALUES (6, N'Bồn Tắm')
INSERT [dbo].[tblNhomHang] ([iMaNhomHang], [sTenNhomHang]) VALUES (7, N'Sen Vòi')
SET IDENTITY_INSERT [dbo].[tblNhomHang] OFF
SET IDENTITY_INSERT [dbo].[tblPhieuNhapHang] ON 

INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (3, 1, CAST(0x0000AC3201057453 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (5, 1, CAST(0x0000AC4800F920C3 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (6, 1, CAST(0x0000AC4800FA8BAD AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (7, 1, CAST(0x0000AC52010D23BA AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (8, 1, CAST(0x0000AC52010D6366 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (9, 1, CAST(0x0000AC67011946DA AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (10, 1, CAST(0x0000AC67011D44F4 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (11, 1, CAST(0x0000AC74013C83C8 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (12, 1, CAST(0x0000AC74013CF591 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (13, 1, CAST(0x0000AC74013D7B71 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (14, 1, CAST(0x0000AC7500108AF7 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (15, 1, CAST(0x0000AC7500110841 AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (16, 1, CAST(0x0000AC750011A3BF AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (17, 1, CAST(0x0000AC750012593C AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (18, 1, CAST(0x0000AC750012C39A AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (19, 1, CAST(0x0000AC750012F51D AS DateTime))
INSERT [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang], [iMaNhanVien], [dThoiGian]) VALUES (20, 1, CAST(0x0000AC7E018A3D40 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblPhieuNhapHang] OFF
SET IDENTITY_INSERT [dbo].[tblSanPham] ON 

INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iMaBoSuuTap], [iGia], [sKichThuoc], [sTinhNang], [shinhanh], [idongia], [sXuatxu]) VALUES (1, N'Chậu rửa cabinet Inax CC0504-4IF-B', 5, 2, 3500000, N'70x85cm', N'Chậu rửa cabinet Inax CB0504-4IF-B', N'cb0504-5qf-b-anh-dai-dien.jpg', NULL, NULL)
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iMaBoSuuTap], [iGia], [sKichThuoc], [sTinhNang], [shinhanh], [idongia], [sXuatxu]) VALUES (3, N'Vòi chậu inax + ống xả LFV-1302S-1+A-325', 7, 1, 1500000, N'35x40cm', N'Vòi chậu inax + ống xả LFV-1302S-1+A-325PL', N'cb0504-5qf-b-anh-dai-dien.jpg', NULL, NULL)
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iMaBoSuuTap], [iGia], [sKichThuoc], [sTinhNang], [shinhanh], [idongia], [sXuatxu]) VALUES (4, N'Vòi chậu Inax LFV-1302SP', 7, 1, 1800000, N'sad', N'Vòi chậu Inax LFV-1302SP', N'lfv-1302sp.jpg', NULL, NULL)
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iMaBoSuuTap], [iGia], [sKichThuoc], [sTinhNang], [shinhanh], [idongia], [sXuatxu]) VALUES (5, N'Chậu rửa cabinet Inax CB0504-4IF-B', 5, 1, 2500000, N'46x50cm', N'Cabinet CB0504-4IF-B kích thước nhỏ gọn phù hợp với nhiều không gian phòng tắm.
Lọai cánh cửa mở( Có tính năng đóng êm).', N'no-photo.jpg', NULL, N'HN')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iMaBoSuuTap], [iGia], [sKichThuoc], [sTinhNang], [shinhanh], [idongia], [sXuatxu]) VALUES (6, N'Bồn tắm massage Inax MSBV-1700B', 6, 2, 5500000, N'170x85cm', N'Bồn tắm massage Inax MSBV-1700B', N'bon-tam-massage-inax-msbv-1700b.jpg', NULL, NULL)
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iMaBoSuuTap], [iGia], [sKichThuoc], [sTinhNang], [shinhanh], [idongia], [sXuatxu]) VALUES (8, N'Bồn tắm massage Inax MSBV-1700B', 6, 2, 5500000, N'170x85cm', N'Bồn tắm massage Inax MSBV-1700B', N'no-photo.jpg', NULL, N'HD')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iMaBoSuuTap], [iGia], [sKichThuoc], [sTinhNang], [shinhanh], [idongia], [sXuatxu]) VALUES (9, N'123123123', 6, 2, 5500000, N'170x85cm', N'Bồn tắm massage Inax MSBV-1700B', N'no-photo.jpg', NULL, N'')
INSERT [dbo].[tblSanPham] ([iMaSanPham], [sTenSanPham], [iMaNhomHang], [iMaBoSuuTap], [iGia], [sKichThuoc], [sTinhNang], [shinhanh], [idongia], [sXuatxu]) VALUES (10, N'Chậu rửa cabinet Inax CC0504-4IF-B', 5, 2, 34234, N'70x85cm', N'Chậu rửa cabinet Inax CB0504-4IF-B', N'no-photo.jpg', NULL, N'')
SET IDENTITY_INSERT [dbo].[tblSanPham] OFF
ALTER TABLE [dbo].[tblNhanVien] ADD  DEFAULT ((1)) FOR [bTrangThai]
GO
ALTER TABLE [dbo].[tblChiTietPhieuNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_1] FOREIGN KEY([iMaphieuNhapHang])
REFERENCES [dbo].[tblPhieuNhapHang] ([iMaphieuNhapHang])
GO
ALTER TABLE [dbo].[tblChiTietPhieuNhapHang] CHECK CONSTRAINT [FK_1]
GO
ALTER TABLE [dbo].[tblChiTietPhieuNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_2] FOREIGN KEY([iMaSanPham])
REFERENCES [dbo].[tblSanPham] ([iMaSanPham])
GO
ALTER TABLE [dbo].[tblChiTietPhieuNhapHang] CHECK CONSTRAINT [FK_2]
GO
ALTER TABLE [dbo].[tblPhieuNhapHang]  WITH CHECK ADD FOREIGN KEY([iMaNhanVien])
REFERENCES [dbo].[tblNhanVien] ([iMaNhanVien])
GO
ALTER TABLE [dbo].[tblSanPham]  WITH CHECK ADD FOREIGN KEY([iMaBoSuuTap])
REFERENCES [dbo].[tblbosuutap] ([iMaBoSuuTap])
GO
ALTER TABLE [dbo].[tblSanPham]  WITH CHECK ADD FOREIGN KEY([iMaNhomHang])
REFERENCES [dbo].[tblNhomHang] ([iMaNhomHang])
GO
USE [master]
GO
ALTER DATABASE [quanLyNhapThietBiVeSinh] SET  READ_WRITE 
GO
