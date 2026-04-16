create table shippers(
	shipperID int primary key ,
    shipperName varchar(255),
    phone varchar(20)
);
INSERT INTO shippers (shipperName,phone)
values ('giao hàng nhanh',0901234567);

INSERT INTO shippers (phone)
values('viettel post');

/*
lỗi 1 : chỗ giao hàng nhanh chưa đóng ngoặc đơn
lỗi 2 : tại chỗ insert chưa chỉ ra column cần thêm
*/