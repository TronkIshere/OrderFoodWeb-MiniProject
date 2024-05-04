CREATE TABLE [NguoiDung] (
  [idNguoiDung] BIGINT PRIMARY KEY NOT NULL IDENTITY,
  [Email] NVARCHAR(255) NOT NULL,
  [MatKhau] NVARCHAR(255) NOT NULL,
  [SoDienThoai] BIGINT NOT NULL,
  [HoVaTen] NVARCHAR(255) NOT NULL,
  [GioiTinh] NVARCHAR(255) NOT NULL,
  [DiaChi] NVARCHAR(255) NOT NULL,
  [PhanQuyen] BIGINT NOT NULL,
  [AvtKhachHang] NVARCHAR(255) NOT NULL
);

CREATE TABLE [MonAn] (
  [idMonAn] BIGINT PRIMARY KEY NOT NULL IDENTITY,
  [TenMon] NVARCHAR(255) NOT NULL,
  [MieuTa] NVARCHAR(255) NOT NULL,
  [GiaTien] BIGINT NOT NULL,
  [DiaChi] NVARCHAR(255) NOT NULL,
  [HinhAnh] NVARCHAR(255) NOT NULL
);

CREATE TABLE [GioHang] (
  [idGioHang] BIGINT PRIMARY KEY IDENTITY,
  [idNguoiDung] BIGINT,
  [idMonAn] BIGINT NOT NULL,
  [idHoaDon] BIGINT,
  [SoLuong] BIGINT NOT NULL,
  [TongSoTien] BIGINT NOT NULL
);

CREATE TABLE [HoaDon] (
  [idHoaDon] BIGINT PRIMARY KEY NOT NULL IDENTITY,
  [idNguoiDung] BIGINT NOT NULL,
  [NgayDatHang] DATE NOT NULL,
  [MoTa] NVARCHAR(255) NOT NULL,
  [DiaChiGiaoHang] NVARCHAR(255) NOT NULL,
  [TongSoTien] BIGINT NOT NULL
);

ALTER TABLE GioHang
ADD CONSTRAINT FK_NguoiDung_GioHang
FOREIGN KEY (idNguoiDung)
REFERENCES NguoiDung(idNguoiDung);

ALTER TABLE GioHang
ADD CONSTRAINT FK_MonAn_GioHang
FOREIGN KEY (idMonAn)
REFERENCES MonAn(idMonAn);

ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_NguoiDung
FOREIGN KEY (idNguoiDung)
REFERENCES NguoiDung(idNguoiDung);

ALTER TABLE GioHang
ADD CONSTRAINT FK_GioHang_HoaDon
FOREIGN KEY (idHoaDon)
REFERENCES HoaDon(idHoaDon);


INSERT INTO NguoiDung (Email, MatKhau, SoDienThoai, HoVaTen, GioiTinh, DiaChi, PhanQuyen, AvtKhachHang)
VALUES ('admin@gmail.com', '123', 123456789, N'User 1', N'Nam', N'Địa chỉ 1', 1, 'img/customersAvt/admin.jpg'),
       ('CuHanh@gmail.com', '123', 987654321, N'Củ hành', N'Nam', N'Xứ Catarina', 2, 'img/customersAvt/CuHanh.jpg');
INSERT INTO MonAn (TenMon, MieuTa, GiaTien, DiaChi, HinhAnh)
VALUES 
(N'Gà chiên', N'Nó lúc trước là con gà sống, sau khi gia công thì không', 10000, N'Địa chỉ 1', N'img/mealAvt/GaChien.jpg'),
(N'Phở bò', N'Gân bò hơi dai, nhưng được cái đúng giá tiền', 20000, N'Địa chỉ 2', N'img/mealAvt/PhoBo.jpg');
INSERT INTO GioHang (idNguoiDung, idMonAn, idHoaDon, SoLuong, TongSoTien)
VALUES 
(2, 1, NULL, 2, 20000),
(2, 2, NULL, 1, 20000);
INSERT INTO HoaDon (idNguoiDung, NgayDatHang, MoTa, DiaChiGiaoHang, TongSoTien)
VALUES 
(2, '2024-04-07', N'Mô tả hóa đơn 1', N'Địa chỉ giao hàng 1', 50000),
(2, '2024-04-07', N'Mô tả hóa đơn 2', N'Địa chỉ giao hàng 2', 60000);

SET IDENTITY_INSERT GioHang ON;

DROP TABLE IF EXISTS HoaDon, GioHang ,NguoiDung, MonAn;

drop database DeadlineRestaurant

