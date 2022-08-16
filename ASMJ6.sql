USE MASTER; --  SQLINES DEMO *** C ĐỊNH VỀ MASTER
  --  SQLINES DEMO ***  LỆNH TRƯỚC
IF DB_ID('SHOESSHOPAG') IS NOT NULL THEN --  SQLINES DEMO *** ��N TẠO ĐÃ TỒN TẠI CHƯA
	DROP DATABASE SHOESSHOPAG
END IF; -- XÓA CSDL
 
CREATE DATABASE SHOESSHOPAG;
 
USE SHOESSHOPAG;
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hanggiays
(
	ma_hang INT AUTO_INCREMENT PRIMARY KEY,
	ten_hang NVARCHAR(50)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE loaigiays
(
  ma_loai_giay INT AUTO_INCREMENT PRIMARY KEY,
  ten_loai NVARCHAR(20),
  gioi_tinh INT
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE giays
(
  ma_giay INT AUTO_INCREMENT PRIMARY KEY,
  ten_giay NVARCHAR(500),
  don_gia INT,
  giam_gia DOUBLE,
  mo_ta LONGTEXT,
  hinh_anh LONGTEXT,
  ma_loai_giay INT,
  ma_hang INT,  
  FOREIGN KEY (ma_loai_giay) REFERENCES loaigiays(ma_loai_giay),
  FOREIGN KEY (ma_hang) REFERENCES hanggiays(ma_hang)    
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE danhgias
(
	ma_danh_gia INT AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(100),
	ho_va_ten NVARCHAR(100),
	hinh LONGTEXT,
	ngay_danh_gia VARCHAR(30),
	nhan_xet NVARCHAR(300),
	so_sao INT,
	ma_giay INT,
	FOREIGN KEY (ma_giay) REFERENCES giays(ma_giay)
);


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE quyens
(
	ma_quyen INT AUTO_INCREMENT PRIMARY KEY,
	ten_quyen NVARCHAR(100)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE khachhangs
(
  tai_khoan VARCHAR(20),
  mat_khau VARCHAR(20),
  ten_khach_hang NVARCHAR(50),
  so_dien_thoai VARCHAR(20),
  dia_chi  LONGTEXT,
  ma_quyen INT,
  PRIMARY KEY (tai_khoan),
  FOREIGN KEY (ma_quyen) REFERENCES quyens(ma_quyen)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE donhangs
(
  ma_don_hang INT AUTO_INCREMENT PRIMARY KEY,
  dia_chi NVARCHAR(300),
  ten_nguoi_nhan NVARCHAR(100),
  tong_tien INT,
  ghi_chu_khach_hang NVARCHAR(300),
  ghi_chu_admin NVARCHAR(300),
  ngay_dat_hang DateTime(3),
  trang_thai NVARCHAR(20),
  so_dien_thoai VARCHAR(15),
  tai_khoan VARCHAR(20),
  FOREIGN KEY (tai_khoan) REFERENCES khachhangs(tai_khoan)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE chitietdonhangs
(
	ma_don_hang INT,
	ma_giay INT,
	so_luong INT,
	don_gia INT,
	PRIMARY KEY (ma_don_hang, ma_giay),
	FOREIGN KEY (ma_don_hang) REFERENCES donhangs(ma_don_hang),
	FOREIGN KEY (ma_giay) REFERENCES giays(ma_giay)
);

-- Thêm Hãng giày
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO hanggiays(ten_hang)
VALUES ('Adidas'),
('Nike'),
('Vans'),
('Converse');

-- Thêm loại giày
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO loaigiays(gioi_tinh,ten_loai)
VALUES (1,'Nam'),
(2,'Nữ'),
(3,'Nam, Nữ');

-- Thêm Giày
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO giays(ten_giay,don_gia,giam_gia,hinh_anh,
mo_ta,
ma_loai_giay,ma_hang)
VALUES ('Giày Nike Air Force 1 Low GS Year of the Tiger DQ4502-171',4690000,0.2,'sp1_1.png',
'Được thiết kế bởi Bruce Kilgore vào năm 1982 với ý tưởng đặt tên từ chiếc chuyên cơ chuyên chở tổng thống mỹ AIR FORCE ONE, AF1 đã nhanh chóng trở thành đôi giày mang tính cách mạng trong giới sneaker, sản phẩm được bán hết trong một thời gian kỷ lục. Cho dù đã gần 40 năm trôi qua NIKE AIR FORCE 1 vẫn đem lại hàng trăm triệu USD hàng năm cho NIKE.',
3,2),
('Giày nữ Nike Air Max 90 SE GS ‘Worldwide Pack – SEFA20’ CV7665-001',3690000,0.4,'sp2_1.png',
'Được thiết kế lại cho các trang phục bình thường, Nike Air Max 90 NRG vẫn đúng với nguồn gốc hoạt động của những năm 90 với đế ngoài bằng cao su Waffle, các lớp phủ được khâu và các chi tiết TPU. Màu sắc mới táo bạo và các chi tiết tươi mới kết hợp với đệm Max Air cho phong cách và sự thoải mái hàng ngày.',
2,2),
('Giày Nike Air Jordan 1 Mid ‘Cream Grey’ DN4281-100',5590000,0.1,'sp3_1.png',
'Nike Air Jordan 1 với lịch sử hơn 30 năm luôn được nhìn nhận như một trong những dòng sản phẩm thành công nhất của Nike. Nike Jordan 1 luôn bán hết một cách nhanh chóng ngay từ khi ra mắt đến nay, luôn là sản phẩm được các tín đồ thời trang chú ý hàng đầu. Air Jordan được đặt dựa theo ngôi sao bóng rổ lừng danh Michael Jordan – huyền thoại của NBA.',
1,2),
('Giày Adidas Ultraboost 21 ‘Blue Oxide’ FY3084',3290000,0.2,'sp4_1.png',
'Hàng loạt bản mẫu. Hàng loạt cải tiến. Hàng loạt thử nghiệm. Đồng hành cùng chúng tôi trên hành trình tìm kiếm sự hòa hợp đỉnh cao giữa trọng lượng, sự êm ái và độ đàn hồi. Ultraboost 21. Đón chào nguồn năng lượng hoàn trả phi thường.',
1,1),
('Giày Adidas Originals 4D Fusio ‘Black Orange Pink’ FZ2414',4100000,0.2,'sp5_1.png',
'Cam kết chính hãng 100% nhập từ ADIDAS US, UK, JP - Fake đền x10. GIÁ RẺ hơn các shop khác 15-20% - full box, tem, tag, giấy gói chính hãng.',
1,1),
('Giày Adidas UltraBoost 21 ‘White Glow Pink’ FY0396',4090000,0.2,'sp6_1.png',
'Mua Giày Adidas Wmns UltraBoost 21 White Glow Pink FY0396 chính hãng 100%. Giao hàng miễn phí trong 1 ngày. Cam kết đền tiền X5 nếu phát hiện Fake. Đổi trả miễn phí size. FREE vệ sinh giày trọn đời. MUA NGAY!',
2,1),
('Giày Adidas NMD R1 V2 Brilliant ‘Basics White’ GV7557',3100000,0.1,'sp7_1.png',
'Trong tiếng Anh, NOMAD có nghĩa là dân du cư, những người sống nay đây mai đó, ngao du thiên hạ. Từ đây chúng ta có thể hiểu rõ rằng Adidas NMD được sáng tạo nên từ tinh thần muốn trải nghiệm và khám phá cuộc sống thông qua những chuyến hành trình.',
3,1),
('Giày Vans Authentic Mule ‘Red’ VN0A54F7JV61',1590000,0.2,'sp8_1.png',
'Nhiều người ấn tượng với cấu hình mỏng, trượt của Vans Old Skool Mule mang lại cho nó một lợi thế dễ mặc và cảm giác linh hoạt. Nó được ca ngợi vì sự thoải mái mà nó mang lại cho đôi chân, khiến nó trở thành một lựa chọn xứng đáng cho trang phục thường ngày. Số lượng đệm vừa đủ, dây đeo đàn hồi dưới lưỡi và phần trên có thể uốn cong giữ cho bàn chân được thoải mái giấu bên trong giày.',
3,3),
('Giày nữ Vans Comfycush Era ‘Strawberry Pink’ VN0A3WM9VNJ1',3000000,0.5,'sp9_1.jpg',
'Với phối màu nhẹ nhàng, không quá chói chang - Vans Comfycush Era Strawberry Pink được Vans mang đến như một làn gió mới so với những sản phẩm trước đây từng được ra mắt. Vẫn giữ cho mình chất lượng tuyệt vời nhất, Vans Comfycush Era Strawberry Pink chắc chắn sẽ mang đến cho bạn một trải nghiệm vô cùng đặc biệt.',
2,3),
('Giày nam Vans Old Skool ‘White Flame’ VN0A4U3B2231',2900000,0.2,'sp10_1.png',
'Ở thời điểm hiện, có lẽ cụm từ “Vans Off The Wall” đã không còn xa lạ gì với giới trẻ Việt Nam, khi chúng không chỉ là một slogan của một trong những thương hiệu thời trang hàng đầu đầu thế giới và được đặc biệt yêu thích tại Việt Nam, mà chúng còn là tượng trưng của một nền văn hóa đang ngày một phát triển và đi lên trong cộng đồng của các bạn trẻ yêu thích hip hop – văn hóa Streetwear (Trang phục đường phố), mẫu Vans #95 hay còn được gọi là Vans Era chính thức được ra mắt và nhanh chóng thành sự lựa chọn hàng đầu cho dân trượt ván thời điểm bấy giờ.',
1,3),
('Giày nữ Vans Slip-On ComfyCush ‘Checkerboard’ VN0A3WMDVO4',1900000,0.1,'sp11_1.jpg',
'Có thể bạn không nhận ra được sự khác biệt của dòng giày ComfyCush so với các mẫu Classic nhà Vans đã xuất hiện cách đây hơn 50 năm. Bởi, các nhà thiết kế chỉ chú trọng việc tạo ra một sự thoải mái từ bên trong đôi giày và hoàn toàn giữ lại kiểu dáng kinh điển, truyền thống của 5 dòng giày: Vans Era, Authentic, Slip-On và Sk8-Hi. Ngoài ra, dòng giày hiện đại bậc nhất này còn có thêm các phiên bản mới bên cạnh phiên bản Classic với sự phối hợp về màu sắc, họa tiết khá lạ mắt và tươi trẻ.',
2,3),
('Giày Converse Natasha Cloud x Run Star Hike Inspired ‘Floral – Pink Quartz’ 571877C',2900000,0.1,'sp12_1.png',
'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
2,4),
('Giày Converse Chuck Taylor All Star Sunflower 670701C',1700000,0.1,'sp13_1.png',
'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
2,4),
('Giày Converse UNT1TL3D ‘Red-Grey-White’ 168636C',1400000,0.1,'sp14_1.png',
'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
1,4),
('Giày Converse Pro Leather High ‘Breaking Down Barries’ 170493C',2190000,0.1,'sp15_1.png',
'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
3,4),
('Giày Converse Chuck Taylor All Star High Top ‘Traveler’ 170851C',1700000,0.1,'sp16_1.png',
'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
3,4),
('Giày nam Converse Chuck 70 ‘Amarillo’ 170282C',4900000,0.4,'sp17_1.png',
'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
1,4),
('Giày nữ Converse Chuck Taylor All Star Platform Low 567855C',1400000,0.1,'sp18_1.png',
'Converse là một trong những thương hiệu giày nổi tiếng và uy tín nhất trên thế giới với lịch sử phát triển lên đến hơn 100 năm. Đến 60% người Mỹ đều sở hữu ít nhất 1 đôi giày từ nhãn hiệu Converse. Với thiết kế đơn giản, trẻ trung và năng động, Converse trở thành một ‘must-have item’ cần có trong bộ sưu tập giày của tất cả mọi người, không chỉ riêng với các sneakerhead. Lịch sử phát triển của Converse lâu đời hơn rất nhiều so với các loại giày thể thao đang làm mưa làm gió ngày nay như hai ông lớn Nike và adidas.',
2,4),
('Giày Nike Air Jordan 1 Acclimate ‘Dusty Pink’ DC7723-500',5800000,0.1,'sp19_1.png',
'Nike Air Jordan 1 với lịch sử hơn 30 năm luôn được nhìn nhận như một trong những dòng sản phẩm thành công nhất của Nike. Nike Jordan 1 luôn bán hết một cách nhanh chóng ngay từ khi ra mắt đến nay, luôn là sản phẩm được các tín đồ thời trang chú ý hàng đầu. Air Jordan được đặt dựa theo ngôi sao bóng rổ lừng danh Michael Jordan – huyền thoại của NBA.',
1,2),
('Giày Air Jordan Series.01 ‘Dear Larry’ CV8129-100',4900000,0.4,'sp20_1.png',
'Với sự ra đời của mình, Jordan Series 01 đã tôn vinh hai người vĩ đại: bản thân MJ cũng như người anh trai Larry của huyền thoại. Điều này bắt đầu một xu hướng sẵn sàng chỉ tiếp tục, và hình ảnh sẽ chỉ làm điều đó với sự tôn kính sắp tới đối với Dean Smith.',
3,2),
('Giày bóng rổ nữ Jordan Why Not Zer0.4 PF GS ‘Upbringing’ DH0944-100',4000000,0.1,'sp21_1.png',
'Why not Zer0.4 luôn mang đến một vẻ ngoài đầy sặc sỡ, với sự pha trộn táo bạo của nhiều phối màu, nhiều chất liệu cũng như các hoạ tiết độc đáo luôn thu hút được ánh nhìn và sự tò mò đến từ fan hâm mô giày bóng rổ.',
2,2),
('Giày Air Jordan 10 Retro ‘Seattle’ 2019 310805-137',7200000,0.5,'sp22_1.png',
'Vào năm 1995, Nike đã bắt đầu release những đôi 10s vào mùa giải NBA 1994-1995, theo dòng chảy đó thì Nike cũng đã ra mắt series "City Pack" đầu tiên của mình. Và sau nhiều năm, thì mùa thu năm 2019, Nike đã phát hành đôi 10s "Seattle Supersonics" . Đôi giày đại diện cho thành phố Seattle và đôi Seattle Supersonics ( nay được biết đến là đội Oklahoma City Thunder).',
1,2),
('Giày Wmns Air Jordan MA2 ‘Light Bone Sunset Pulse’ CW5992-003',5900000,0.3,'sp23_1.jpg',
'Wmns Air Jordan MA2 ‘Light Bone Sunset Pulse’ dành cho phụ nữ tạo thêm điểm nhấn sống động cho một đường màu trung tính khác của hình bóng phong cách sống. Phần trên kết hợp lưới màu ngà với lớp phủ da lộn tông màu và một vòng kéo màu hồng mờ dán ở cổ áo bên. Một màu hồng đậm hơn được áp dụng cho một tấm đá cao su có kết cấu ở gót chân, cho phép người mang giày đá bóng mà không cần dùng tay. Một điểm nhấn cuối cùng của màu sắc tương phản sẽ đến với đơn vị Max Air 200 dưới gót giày.',
2,2),
('Giày Wmns Jordan Delta Breathe ‘Purple Brilliant Green’ DJ5200-109',5600000,0.1,'sp24_1.png',
'Ra mắt lần đầu vào năm ngoái, Jordan Delta Breathe đã trở thành một đôi giày phong cách sống thành công cho cả nam và nữ. Thêm vào dòng sản phẩm của mình, Jordan Brand tiết lộ một sản phẩm dành cho phụ nữ mới được trang bị các màu trắng, nhiều màu, bạc kim loại và đen. Làm nổi bật đôi giày là tông màu pastel Tím và Xanh lá đi kèm với hệ thống dây buộc bật tắt. Một đế đệm bọt React màu trắng hoàn thiện thiết kế.',
3,2);



-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO quyens
VALUES ('User'),
('Staff'),
('Admin');

-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO khachhangs
VALUES('pnmtriet','123456','Phạm Triết','0393796446','123 Cộng Hòa, P.4, Q.Tân Bình, TP.HCM',1),
('pnmtriet2','123456','Phạm Triết','0393796446','123 Cộng Hòa, P.4, Q.Tân Bình, TP.HCM',2),
('admin','123456','Admin','0393796446','123 Cộng Hòa, P.4, Q.Tân Bình, TP.HCM',3),
('tula','123456','Lê Anh Tú','0393796446','123 Cộng Hòa, P.4, Q.Tân Bình, TP.HCM',1),
('tulaadmin','123456','Lê Anh Tú','0393796446','123 Cộng Hòa, P.4, Q.Tân Bình, TP.HCM',3);


-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO danhgias
VALUES ('pnmtriet@gmail.com','Phạm Nguyễn Minh Triết','nam.jpg','03/08/2022','Sản phẩm rất đẹp',4,1),
('nntduong@gmail.com','Nguyễn Ngọc Thùy Dương','nu.jpg','03/08/2022','Mình vừa mua 2 đôi rất ưng ý',5,1);

-- 2020
-- 2020
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into donhangs(ngay_dat_hang,ten_nguoi_nhan,dia_chi,so_dien_thoai,trang_thai,tong_tien)
values ('2020/01/01','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',3000000),
('2020/01/02','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',4000000),
('2020/01/03','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2000000),
('2020/01/04','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2700000),
('2020/01/15','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',3000000),
('2020/01/22','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2000000),
('2020/01/27','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',400000),
('2020/02/01','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',1200000),
('2020/02/03','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',4000000),
('2020/02/03','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2000000),
('2020/02/04','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',1000000),
('2020/02/28','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',1000000),
('2020/03/01','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2200000),
('2020/03/03','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2000000),
('2020/03/03','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2000000),
('2020/03/04','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2000000),
('2020/03/28','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2000000),
('2020/04/01','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2400000),
('2020/04/03','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2400000),
('2020/04/03','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',2400000),
('2020/04/04','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',4400000),
('2020/04/28','Phạm Minh','338 Ngô Đức Kế, Q.Bình Thạnh, TP.HCM','0987652712','Đã giao',7400000),
('2020/05/02','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',5200000),
('2020/05/05','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',3100000),
('2020/05/11','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2100000),
('2020/05/19','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1100000),
('2020/05/25','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2100000),
('2020/05/28','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',3100000),
('2020/06/05','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',5000000),
('2020/06/11','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2000000),
('2020/06/19','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1000000),
('2020/06/25','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',8000000),
('2020/06/28','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1000000),
('2020/07/05','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1000000),
('2020/07/11','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1000000),
('2020/07/19','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2000000),
('2020/07/25','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1000000),
('2020/07/28','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',3000000),
('2020/08/05','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',5300000),
('2020/08/11','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2300000),
('2020/08/19','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2300000),
('2020/08/25','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2300000),
('2020/08/28','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2300000),
('2020/09/05','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2900000),
('2020/09/11','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2900000),
('2020/09/19','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',3900000),
('2020/09/25','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1900000),
('2020/09/28','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',4900000),
('2020/10/05','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',3700000),
('2020/10/11','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',3700000),
('2020/10/19','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1700000),
('2020/10/25','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1700000),
('2020/10/28','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1700000),
('2020/11/05','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',4700000),
('2020/11/11','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1700000),
('2020/11/19','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',2700000),
('2020/11/25','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1700000),
('2020/11/28','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1000000),
('2020/12/05','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1100000),
('2020/12/11','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1000000),
('2020/12/19','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',800000),
('2020/12/25','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1100000),
('2020/12/28','Phạm Minh','02 Lê Hồng Phong, Q.10, TP.HCM','0987652712','Đã giao',1200000);

-- 2021
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into donhangs(ngay_dat_hang,ten_nguoi_nhan,dia_chi,so_dien_thoai,trang_thai,tong_tien)
values ('2021/01/01','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2000000),
('2021/01/02','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',3000000),
('2021/01/03','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/01/04','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1700000),
('2021/01/15','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2000000),
('2021/01/22','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/01/27','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',500000),
('2021/02/01','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2200000),
('2021/02/03','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',5000000),
('2021/02/03','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',3000000),
('2021/02/04','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2000000),
('2021/02/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2000000),
('2021/03/01','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1200000),
('2021/03/03','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/03/03','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/03/04','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/03/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/04/01','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',3400000),
('2021/04/03','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',3400000),
('2021/04/03','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',3400000),
('2021/04/04','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',3400000),
('2021/04/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',3400000),
('2021/05/02','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1200000),
('2021/05/05','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2100000),
('2021/05/11','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2100000),
('2021/05/19','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2100000),
('2021/05/25','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2100000),
('2021/05/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2100000),
('2021/06/05','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/06/11','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/06/19','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/06/25','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/06/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/07/05','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',4000000),
('2021/07/11','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',4000000),
('2021/07/19','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',4000000),
('2021/07/25','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',4000000),
('2021/07/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',4000000),
('2021/08/05','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1300000),
('2021/08/11','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1300000),
('2021/08/19','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1300000),
('2021/08/25','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1300000),
('2021/08/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1300000),
('2021/09/05','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1900000),
('2021/09/11','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1900000),
('2021/09/19','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1900000),
('2021/09/25','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1900000),
('2021/09/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1900000),
('2021/10/05','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2700000),
('2021/10/11','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2700000),
('2021/10/19','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2700000),
('2021/10/25','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2700000),
('2021/10/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2700000),
('2021/11/05','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',5700000),
('2021/11/11','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2700000),
('2021/11/19','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',3700000),
('2021/11/25','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',2700000),
('2021/11/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1700000),
('2021/12/05','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1700000),
('2021/12/11','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',700000),
('2021/12/19','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1500000),
('2021/12/25','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000),
('2021/12/28','Phạm Triết','123 Lữ Gia, Q.11, TP. HCM','0987652712','Đã giao',1000000);

 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
DELIMITER //

CREATE PROCEDURE DOANH_THU_NAM ( p_year int)
BEGIN
-- SQLINES LICENSE FOR EVALUATION USE ONLY
SELECT 
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 1
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang1' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 2
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang2' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 3
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang3' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 4
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang4' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 5
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang5' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 6
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang6' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 7
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang7' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 8
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang8' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 9
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang9' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 10
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang10' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 11
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang11' ,
(
	SELECT SUM(tong_tien)
	FROM donhangs
	WHERE MONTH(ngay_dat_hang) = 12
	AND YEAR(ngay_dat_hang)=p_year
) as N'Thang12';
END;
//

DELIMITER ;

 

--  SQLINES DEMO ***  2020


--  SQLINES DEMO *** angs
--  SQLINES DEMO *** ietdonhangs

--  SQLINES DEMO ***  2020


--  SQLINES DEMO *** angs
--  SQLINES DEMO *** ietdonhangs
