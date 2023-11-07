CREATE DATABASE QUANLYPHONGTRO
GO

CREATE TABLE PhongTro
(
  ID_Phong NVARCHAR(30) NOT NULL,
  SoPhong INT NOT NULL,
  Dientich INT NOT NULL,
  SoGiuong INT NOT NULL,
  GiaThue INT NOT NULL,
  TrangThai NVARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_Phong)
);

CREATE TABLE KhachThue
(
  ID_Khach NVARCHAR(30) NOT NULL,
  Ho NVARCHAR(30) NOT NULL,
  CCCD INT NOT NULL,
  GioiTinh BIT NOT NULL,
  SoDienThoai INT NOT NULL,
  Email NVARCHAR(25) NOT NULL,
  Ten NVARCHAR(20) NOT NULL,
  HInhAnh NVARCHAR(30) NOT NULL,
  DiaChi NVARCHAR(50) NOT NULL,
  PRIMARY KEY (ID_Khach)
);

CREATE TABLE HopDong
(
  NgayBatDauO DATE NOT NULL,
  NgayKetThucO DATE NOT NULL,
  ID_HopDong NVARCHAR(50) NOT NULL,
  TienCoc INT NOT NULL,
  TienThue INT NOT NULL,
  NgayKyHopDong DATE NOT NULL,
  NgayHetHopDong DATE NOT NULL,
  GhiChu NVARCHAR(50) NOT NULL,
  ID_Phong NVARCHAR(30) NOT NULL,
  ID_Khach NVARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_HopDong),
  FOREIGN KEY (ID_Phong) REFERENCES PhongTro(ID_Phong),
  FOREIGN KEY (ID_Khach) REFERENCES KhachThue(ID_Khach)
);

CREATE TABLE ThanhToan
(
  ID_ThanhToan NVARCHAR(30) NOT NULL,
  NgayThanhToan DATE NOT NULL,
  TienPhong INT NOT NULL,
  PhuongThucThanhToan NVARCHAR(30) NOT NULL,
  ThangThanhToan DATE NOT NULL,
  TienDien INT NOT NULL,
  TienNuoc INT NOT NULL,
  TienDichVu INT NOT NULL,
  ID_HopDong NVARCHAR(50) NOT NULL,
  FOREIGN KEY (ID_HopDong) REFERENCES HopDong(ID_HopDong)
);

CREATE TABLE NguoiDung
(
  ChucVu NVARCHAR(30) NOT NULL,
  ID_NguoiDung NVARCHAR(30) NOT NULL,
  Matkhau NVARCHAR(30) NOT NULL,
  TenDangNhap NVARCHAR(50) NOT NULL,
  Ho NVARCHAR(30) NOT NULL,
  Ten NVARCHAR(30) NOT NULL,
  Trang_Thai NVARCHAR(50) NOT NULL,
  Email NVARCHAR(30) NOT NULL,
  DiaChi NVARCHAR(30) NOT NULL,
  ID_HopDong NVARCHAR(50) NOT NULL,
  PRIMARY KEY (ID_NguoiDung),
  FOREIGN KEY (ID_HopDong) REFERENCES HopDong(ID_HopDong)
);

CREATE TABLE DichVu
(
  ID_DichVu NVARCHAR(30) NOT NULL,
  TenDichVu NVARCHAR(30) NOT NULL,
  DonGia INT NOT NULL,
  Ngay DATE NOT NULL,
  Nam DATE NOT NULL,
  HinhAnh NVARCHAR(30) NOT NULL,
  TrangThai NVARCHAR(30) NOT NULL,
  ID_Phong NVARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_DichVu),
  FOREIGN KEY (ID_Phong) REFERENCES PhongTro(ID_Phong)
);

CREATE TABLE NguoiOCung
(
  Ten NVARCHAR(30) NOT NULL,
  Ho NVARCHAR(30) NOT NULL,
  ID_NguoiOCung NVARCHAR(30) NOT NULL,
  Email NVARCHAR(30) NOT NULL,
  HinhAnh INT NOT NULL,
  SoDienThoai INT NOT NULL,
  GioiTinh BIT NOT NULL,
  CCCD INT NOT NULL,
  DiaChi NVARCHAR(30) NOT NULL,
  ID_Khach NVARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_NguoiOCung),
  FOREIGN KEY (ID_Khach) REFERENCES KhachThue(ID_Khach)
);


--Bảng PhongTro
INSERT INTO PhongTro VALUES
('PT01', 101, 30, 2, 500000, N'Trống'),
('PT02', 102, 25, 1, 400000, N'Đang thuê'),
('PT03', 103, 50, 4, 800000, N'Trống'),
('PT04', 104, 35, 3, 650000, N'Trống'),
('PT05', 105, 40, 5, 900000, N'Đang thuê')

--Bảng KhachThue
INSERT INTO KhachThue VALUES
('KH01', N'Nam', 123456789, 1, 0987654321, 'nam@email.com', N'Nguyễn Văn Nam', 'avatar1.jpg', N'Địa chỉ Nam'),
('KH02', N'Hoa', 223456789, 0, 0987654322, 'hoa@email.com', N'Trần Thị Hoa', 'avatar2.jpg', N'Địa chỉ Hoa'),
('KH03', N'Linh', 323456789, 1, 0987654323, 'linh@email.com', N'Dao Thị Linh', 'avatar3.jpg', N'Địa chỉ Linh')

--Bảng HopDong
INSERT INTO HopDong VALUES
('2023-01-01', '2023-03-31', 'HD01', 200000, 500000, '2023-01-10', '2023-03-30', N'Ghi chú 1', 'PT01', 'KH01'),
('2023-02-15', '2023-05-30', 'HD02', 100000, 400000, '2023-02-01', '2023-05-15', N'Ghi chú 2', 'PT02', 'KH02'),
('2023-03-10', '2023-06-20', 'HD03', 150000, 650000, '2023-03-03', '2023-06-10', N'Ghi chú 3', 'PT04', 'KH03')

INSERT INTO ThanhToan VALUES
('TT01', '2023-10-02', 500000, N'Tiền mặt', '2023-10-02', 80000, 20000, 30000, 'HD01'),
('TT02', '2023-02-15', 400000, N'Chuyển khoản', '2023-02-02', 60000, 10000, 20000, 'HD02'),
('TT03', '2023-03-25', 650000, N'Thẻ tín dụng', '2023-03-02', 100000, 30000, 50000, 'HD03')

--Bảng NguoiDung
INSERT INTO NguoiDung VALUES
(N'Quản lý', 'ND01', '123456', 'admin', N'Nguyễn Văn', N'An', N'Hoạt động', 'admin@gmail.com', N'Địa chỉ admin', 'HD01'),
(N'Nhân viên', 'ND02', '123456', 'staff', N'Trần Thị', N'Huệ', N'Hoạt động', 'staff@gmail.com', N'Địa chỉ staff', 'HD02')

--Bảng DichVu
INSERT INTO DichVu VALUES
('DV01', N'Internet', 50000, '2023-01-01', '2023', 'internet.jpg', N'Hoạt động', 'PT01'),
('DV02', N'Nước uống', 30000, '2023-01-15', '2023', 'nuocuong.jpg', N'Hoạt động', 'PT02'),
('DV03', N'Dọn dẹp', 50000, '2023-02-10', '2023', 'dondep.jpg', N'Hoạt động', 'PT03')

--Bảng NguoiOCung
INSERT INTO NguoiOCung VALUES
(N'Nam', N'Bùi', 'NOC01', 'buinam@gmail.com', 'avatar1.jpg', 0987654321, 1, 123456789, N'Địa chỉ Nam', 'KH01'),
(N'Hoa', N'Đinh', 'NOC02', 'dinhhoa@gmail.com', 'avatar2.jpg', 0987654322, 0, 223456789, N'Địa chỉ Hoa', 'KH02'),
(N'Linh', N'Lê', 'NOC03', 'lelinh@gmail.com', 'avatar3.jpg', 0987654323, 1, 323456789, N'Địa chỉ Linh', 'KH03')

ALTER TABLE NguoiDung
ALTER COLUMN ChucVu ENUM('QuanLi','NhanVien')

update NguoiDung set ChucVu = N'Quản Lí' where ID_NguoiDung = 'ND01'

select * from PhongTro
select * from DichVu
select * from KhachThue
select * from NguoiDung
select * from NguoiOCung
select * from ThanhToan
select * from HopDong


SELECT
MONTH(NgayThanhToan) AS Thang,
SUM(TienPhong) AS DoanhThu
FROM ThanhToan
GROUP BY MONTH(NgayThanhToan)