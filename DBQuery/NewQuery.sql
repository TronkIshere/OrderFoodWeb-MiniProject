CREATE TABLE [NguoiDung] (
  [idKhachHang] BIGINT PRIMARY KEY NOT NULL,
  [Email] NVARCHAR(255) NOT NULL,
  [MatKhau] NVARCHAR(255) NOT NULL,
  [SoDienThoai] BIGINT NOT NULL,
  [HoVaTen] NVARCHAR(255) NOT NULL,
  [GioiTinh] NVARCHAR(255) NOT NULL,
  [DiaChi] NVARCHAR(255) NOT NULL,
  [PhanQuyen] BIGINT NOT NULL,
  [AvtKhachHang] NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE [MonAn] (
  [idMonAn] BIGINT PRIMARY KEY NOT NULL,
  [TenMon] NVARCHAR(255) NOT NULL,
  [MieuTa] NVARCHAR(255) NOT NULL,
  [GiaTien] BIGINT NOT NULL,
  [DiaChi] NVARCHAR(255) NOT NULL,
  [SoLuong] BIGINT NOT NULL,
  [HinhAnh] NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE [GioHang] (
  [idGioHang] BIGINT PRIMARY KEY NOT NULL,
  [idNguoiDung] BIGINT NOT NULL,
  [idMonAn] BIGINT NOT NULL,
  [MoTa] NVARCHAR(255) NOT NULL,
  [DiaChiGiaoHang] NVARCHAR(255) NOT NULL,
  [TongSoTien] BIGINT NOT NULL
)
GO

CREATE TABLE [HoaDon] (
  [idHoaDon] BIGINT PRIMARY KEY NOT NULL,
  [idNguoiDung] BIGINT NOT NULL,
  [idGioHang] BIGINT NOT NULL,
  [NgayDatHang] DATE NOT NULL,
  [MoTa] NVARCHAR(255) NOT NULL,
  [DiaChiGiaoHang] NVARCHAR(255) NOT NULL,
  [TongSoTien] BIGINT NOT NULL
)
GO

ALTER TABLE [GioHang] ADD CONSTRAINT [fk_nguoidung_giohang] FOREIGN KEY ([idNguoiDung]) REFERENCES [NguoiDung] ([idKhachHang])
GO

ALTER TABLE [MonAn] ADD CONSTRAINT [fk_giohang_monan] FOREIGN KEY ([idMonAn]) REFERENCES [GioHang] ([idGioHang])
GO

ALTER TABLE [HoaDon] ADD CONSTRAINT [fk_nguoidung_hoadon] FOREIGN KEY ([idNguoiDung]) REFERENCES [NguoiDung] ([idKhachHang])
GO

ALTER TABLE [GioHang] ADD CONSTRAINT [fk_hoadon_giohang] FOREIGN KEY ([idGioHang]) REFERENCES [HoaDon] ([idGioHang])
GO
