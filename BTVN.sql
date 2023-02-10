create database GRAB_BTVN;
use GRAB_BTVN;
create table ThongTinTaiKhoan (
maNguoiDung varchar(255) primary key,
maQuyenNguoiDung varchar(255),
ngayTao varchar(255),
bienSoXe varchar(255),
maTrangThai varchar(255),
maNguoiTao varchar(255),
tenDangNhap varchar(255),
matKhau varchar(255)
);
create table quyenDoiTuong (
maQuyen varchar(255) primary key,
tenQuyen varchar(255)
);
create table trangThai (
maTrangThai varchar(255) primary key,
tenTrangThai varchar(255)
);
create table thongTinNguoiDung (
maNguoiDung varchar(255) primary key,
hoVaTen varchar(255),
anhDaiDien varchar(255),
sdt1 varchar(255),
sdt2 varchar(255),
maGioitinh varchar(255),
ngaySinh varchar(255),
diaChiChiTiet varchar(255),
maXa varchar(255)
);
create table taiKhoanNganHangLienKet (
soTaiKhoan varchar(255),
usernamLienKet varchar(255) ,
maNganHang varchar(255),
tenChutaiKhoan varchar(255),
soDu varchar(255)
);
create table nganhang (
maNganhang varchar(255) primary key,
tenNganhang varchar(255)
);
create table gioiTinh(
maGioitinh varchar(255)primary key,
tenGioiTinh varchar(255)
);



create table tinh (
maTinh varchar(255) primary key,
tenTinh varchar(255)
);
create table huyen (
mahuyen varchar (255) primary key,
tenHuyen varchar (255),
maTinh varchar(255),
FOREIGN KEY (maTinh) REFERENCES tinh(maTinh)
);

create table xa(
maXa varchar(255) primary key,
tenXa varchar(255),
maHuyen varchar(255),
FOREIGN KEY (maHuyen) REFERENCES huyen(mahuyen)
);

INSERT INTO tinh(maTinh , tenTinh)
VALUES 
('T01' , 'Thanh Hoa'),
('T02' , 'Nghe An'),
('T03' , 'Ha Noi'),
('T04' , ' Ninh Binh');

INSERT INTO huyen (mahuyen, tenHuyen, maTinh)
VALUES 
('H01' , 'Quang Xuong' , 'T01'),
('H02' , 'Vinh' , 'T02'),
('H03' , 'Cau Giay' , 'T03'),
('H04' , 'Tam Diep' , 'T04');

INSERT INTO xa(maXa, tenXa, maHuyen)
VALUES 
('X01' , 'Quang chau' , 'H01'),
('X02' , 'Quang tho' , 'H01'),
('X03' , 'Quang cu' , 'H01'),
('X04' , 'Quang Tien' , 'H01'),
('X05' , 'Dich Vong Hau','H03') ,
('X07' , 'Truong Son' , 'H04'),
('X06' , 'Dich Vong', 'H03' );
INSERT INTO xa(maXa, tenXa, maHuyen)
VALUES 

('X08' , 'Truong Son Nam' , 'H02'),
('X09' , 'Truong Son Tay' , 'H02');


SELECT * FROM tinh;
SELECT * FROM huyen;
SELECT * FROM xa;

-- Bai 1
Select tinh.tenTinh, count(tinh.tenTinh) as so_xa From tinh 
inner join huyen on tinh.maTinh = huyen.maTinh
inner join xa on huyen.mahuyen = xa.mahuyen 
Group by tinh.tenTinh Order by so_xa ASC LIMIT 3;






create table phuongTienNguoiDung(
maNguoiDung varchar(255),
maPhuongTien varchar(255) primary key,
maLoaiXe varchar(255),
bienSoXe varchar(255),
maHangXe varchar(255)
);
create table loaiPhuongTien(
maLoaiPhuongTien varchar(255) primary key,
tenLoaiPhuongTien varchar(255)
);
create table loaiXe (
maLoaiXe varchar(255) primary key,
tenLoaiXe varchar(255)
);
create table hangXe(
maHangXe varchar(255) primary key,
tenHangXe varchar(255)
);
create table thongTinChuyenXe (
maChuyen varchar(255) primary key,
maNguoiDat varchar(255),
maTrangThaiChuyenDi varchar(255),
maPhuongTien varchar(255),
maPhuongThucThanhToan varchar(255),
longitudeBatDau varchar(255),
laitudeBatDau varchar(255),
longitudeKetThuc varchar(255),
laitudeKetThuc varchar(255),
doDaiQuangDuong varchar(255),
thanhTien varchar(255),
maGiamGia varchar(255),
thoiGianDat varchar(255),
thoihoanThanh varchar(255),
ghiChu varchar(255)
);
create table uuDai (
maUuDai varchar(255) primary key,
tenUuDai varchar(255),
soTienGiam varchar(255),
chienTietUuDai varchar(255)
);
create table phuongThaiThanhToan (
maPhuongThucThanhToan varchar(255) primary key,
tenPhuongThucThanhToan varchar(255)
);

INSERT INTO phuongThaiThanhToan (maPhuongThucThanhToan , tenPhuongThucThanhToan)
VALUES 
('pttt01' , 'chuyen khoan'),
('pttt02' , 'tien mat');
INSERT INTO uuDai (maUuDai , tenUuDai , soTienGiam , chienTietUuDai)
VALUES 
('ud01' , 'giam 5%' , '5000VND' , 'ket thuc vao 20h ngay 27/02/2023'),
('ud02' , 'giam 10%' , '10000VND' , 'ket thuc vao 20h ngay 27/02/2023'),
('ud03' , 'giam 15%' , '15000VND' , 'ket thuc vao 20h ngay 27/02/2023');
INSERT INTO thongTinChuyenXe (maChuyen , maNguoiDat , maTrangThaiChuyenDi , maPhuongTien , maPhuongThucThanhToan , longitudeBatDau , laitudeBatDau , longitudeKetThuc , laitudeKetThuc , doDaiQuangDuong , thanhTien , maGiamGia , thoiGianDat , thoihoanThanh , ghiChu)
VALUES 
('ttcx01' , 'nd01' , 'TT04' , 'pt01' , 'pttt02' , '2098081' ,'10579623', '2098081', '10579624' , '5km' , '15000VND' , 'ud01' , '10h ngay 27/02/2023' , '11h ngay 27/02/2023' , 'tot'),
('ttcx02' , 'nd02' , 'TT04' , 'pt01' , 'pttt02' , '2098091' ,'10579673', '2098101', '10579664' , '15km' , '25000VND' , 'ud02' , '10h ngay 25/02/2023' , '11h ngay 25/02/2023' , 'tot')
;
INSERT INTO hangXe (maHangXe , tenHangXe)
VALUES 
('hx01' , 'Honda'),
('hx02' , 'mazda');
INSERT INTO loaiXe (maLoaiXe , tenLoaiXe)
VALUES 
('lx01' , 'Wawe alpha'),
('lx02' , 'mazda 3');
INSERT INTO loaiPhuongTien (maLoaiPhuongTien , tenLoaiPhuongTien)
VALUES 
('lpt01' , 'xe may'),
('lpt02' , 'oto');
INSERT INTO phuongTienNguoiDung (maNguoiDung , maPhuongTien , maLoaiXe , bienSoXe , maHangXe)
VALUES 
('nd03' , 'lx01' , 'lpt01' , '29H-12345' , 'hx01'),
('nd04' , 'lx02' , 'lpt02' , '29H-12344' , 'hx02');
INSERT INTO gioiTinh (maGioiTinh , tenGioiTinh)
VALUES 
('gt01' , 'nam'),
('gt02' , 'nu');
INSERT INTO nganHang (maNganHang , tenNganHang)
VALUES 
('vp01' , 'VPBank'),
('bidv01' , 'BVID');
INSERT INTO taiKhoanNganHangLienKet (soTaiKhoan , usernamLienKet , maNganHang , tenChutaiKhoan , soDu)
VALUES 
('123456789' , 'nd01', 'vp01' , 'Le Van A' , '100000000VND'),
('123456711' , 'nd02', 'vp01' , 'Le Van B' , '150000000VND'),
('123456777' , 'nd03', 'bidv01' , 'Le Van C' , '100000000VND'),
('123456666' , 'nd04', 'bidv01' , 'Le Van D' , '100000000VND');
INSERT INTO trangThai (maTrangThai , tenTrangThai)
VALUES 
('tt01' , 'online'),
('tt02' , 'offline'),
('tt03' , 'dat xe thanh cong'),
('tt04' , 'thanh toan thanh cong'),
('tt05' , 'dang dat xe'),
('tt06' , 'dang di chuyen'),
('tt07' , 'da xong'),
('tt08' , 'offline 30 ngay');
INSERT INTO quyenDoiTuong (maQuyen , tenQuyen)
VALUES 
('mq01' , 'khack hang'),
('mq02' , 'tai xe');
INSERT INTO thongTinNguoiDung (maNguoiDung , hoVaTen , anhDaiDien , sdt1 , sdt2 , maGioitinh , ngaySinh , diaChiChiTiet , maXa)
VALUES 
('nd01' , 'Le Van A' , 'anh1.img' , '0987654321' , '0987654322' , 'gt01' , '20/01/2004' , 'Số 25, ngách 18 ngõ 66' , 'x05'),
('nd02' , 'Le Van B' , 'anh2.img' , '0987654221' , '0987654332' , 'gt01' , '22/01/2004' , 'Số 2, ngách 18 ngõ 66' , 'x05'),
('nd03' , 'Le Van C' , 'anh3.img' , '0987654321' , '0987654322' , 'gt01' , '20/05/2004' , 'Số 3, ngách 18 ngõ 66' , 'x05'),
('nd04' , 'Le Van D' , 'anh4.img' , '0987654321' , '0987654322' , 'gt01' , '20/04/2004' , 'Số 4, ngách 18 ngõ 66' , 'x05'),
('nd05' , 'Le Van E' , 'anh5.img' , '0987654321' , '0987654322' , 'gt01' , '20/06/2004' , 'Số 5, ngách 18 ngõ 66' , 'x05');
INSERT INTO ThongTinTaiKhoan (maNguoiDung , maQuyenNguoiDung , ngayTao , bienSoXe , maTrangThai , maNguoiTao , tenDangNhap , matKhau)
VALUES 
('nd01' , 'mq01' , '20/10/2023' , '' , 'tt01' , 'nt01' , 'dangnhap01' , '1221' ),
('nd02' , 'mq01' , '20/10/2023' , '' , 'tt01' , 'nt01' , 'dangnhap02' , '1221' ),
('nd03' , 'mq02' , '20/01/2022' , '29H-12345' , 'tt01' , 'nt01' , 'dangnhap03' , '1221' ),
('nd04' , 'mq02' , '20/01/2022' , '29H-12344' , 'tt01' , 'nt01' , 'dangnhap04' , '1221' ),
('nd05' , 'mq02' , '20/01/2022' , '29H-12445' , 'tt08' , 'nt01' , 'dangnhap05' , '1221' );

-- bai 2
SELECT * FROM ThongTinTaiKhoan
WHERE NOT maQuyenNguoiDung='mq01';


