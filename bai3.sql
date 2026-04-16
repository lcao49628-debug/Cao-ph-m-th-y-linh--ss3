CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    LastPurchaseDate DATE,
    Status VARCHAR(20),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Points INT,
    Address VARCHAR(255)
);

INSERT INTO CUSTOMERS (
    FullName, 
    Email, 
    City, 
    LastPurchaseDate, 
    Status
)
VALUES 
(N'Nguyễn Văn A', 'anv@gmail.com', N'Hà Nội', '2025-05-20', 'Active'),
(N'Trần Thị B', 'btt@gmail.com', N'Hà Nội', '2026-02-10', 'Active'),
(N'Lê Văn C', NULL, N'Hà Nội', '2025-01-15', 'Active'), 
(N'Phạm Minh D', 'dpm@gmail.com', N'Hà Nội', '2024-12-01', 'Locked'), 
(N'Hoàng An E', 'eha@gmail.com', N'TP HCM', '2025-03-01', 'Active');

SELECT 
    FullName, 
    Email
FROM 
    CUSTOMERS
WHERE 
    Email IS NOT NULL 
    AND Status <> 'Locked';
/*
Phân tích : input cần quét bảng customers
			output trả về 2 cột Fullname và email
	Dùng SELECT* gây sai lầm vì bảng có nhiều cột nhưng ta chỉ cần hai cột , việc lấy tất cả
    sẽ khiến lượng dữ liệu truyền qua rất lớn và làm chậm đường chuyền.
Giải pháp : Email bị null => Hệ thống sẽ không thể sử lý nếu không có người nhận
			(Status='Locked') => KHông gửi dữ liệu cho ngườu không còn hoạt động
*/