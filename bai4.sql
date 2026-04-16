/*
PHÂN TÍCH:
GIẢI PHÁP 1: DÙNG DELETE XOÁ HẾT CÁC ĐƠN HÀNG CÓ TRẠNG THÁI 'Canceled' NẾU CẦN LƯU LAI
THÌ CHÈN RIÊNG VÀO MỘT BẢNG PHỤ 
GIẢI PHÁP 2 : SỬ DỤNG MỘT CỘT ĐỂ ĐÁNH DẤU THEO KIỂU BIT , KHI XOÁ THÌ CẬP NHẬT CỘT ĐẤY =1

SO SÁNH : 
GIẢI PHÁP 1 : ƯU => GIẢI PHÓNG DUNG LƯỢNG VÀ TỐC ĐỘ TRUY VẤN NHANH
			NHƯỢC => PHẢI QUẢN LÝ NHIỀU BẢNG
GIẢI PHÁP 2 : ƯU => DỮ LIỆU NẰM TẬP TRUNG DỄ TRUY CẬP , KHI TRUY CẬP CHỈ CẦN THÊM ĐIỀU KIỆN
			NHƯỢC => DỮ LIỆU TỐN NHIỀU DUNG LƯỢNG
	==> CHỐT GIẢI PHÁP 2 .
*/
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    OrderDate DATETIME,
    TotalAmount DECIMAL(18, 2),
    Status VARCHAR(20), -- 'Completed', 'Canceled', 'Pending'
    -- Giải pháp Soft Delete: Thêm cột này để đánh dấu trạng thái xóa
    IsDeleted BIT DEFAULT 0 
);

INSERT INTO ORDERS (CustomerName, OrderDate, TotalAmount, Status) 
VALUES 
(N'Nguyễn Văn A', '2023-01-10', 500000, 'Completed'),
(N'Khách hàng vãng lai', '2023-02-15', 1200000, 'Canceled'), -- "Rác" cần xử lý
(N'Trần Thị B', '2023-05-20', 300000, 'Canceled'),           -- "Rác" cần xử lý
(N'Lê Văn C', '2024-01-05', 850000, 'Completed');

UPDATE ORDERS
SET IsDeleted = 1
WHERE Status = 'Canceled';

SELECT* FROM ORDERS WHERE Status ='Completed';

SELECT* FROM ORDERS WHERE IsDeleted =0 ;

SELECT* FROM ORDERS WHERE Status ='Canceled';