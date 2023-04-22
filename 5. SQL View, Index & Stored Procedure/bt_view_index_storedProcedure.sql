-- Index
create Unique Index index_productCode on products (productCode);
create Unique Index index_product2 on products (productName, productPrice);
EXPLAIN select * from products;
-- View
create view view_product
as select productCode, productName, productPrice, productStatus from products;
select * from view_product;
Update view_product set productPrice = 1300 where productCode = 'prod001';
drop view view_product;
-- Stored Procedure
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure showall()
begin
select * from products;
end //
DELIMITER ;
call showall();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure addProduct(
in id int,
in productCode varchar(45), 
in productName varchar(45),
in productPrice double,
in productAmount int,
in productDescription text,
in productStatus varchar(45))
begin
INSERT INTO Products (id, productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES (id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
end //
DELIMITER ;
CALL addProduct(4,'PROD004', 'iPad Pro', 800.00, 25, 'Powerful tablet from Apple', 'In stock');
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure updateProduct(
in p_id int,
in p_productCode varchar(45), 
in p_productName varchar(45),
in p_productPrice double,
in p_productAmount int,
in p_productDescription text,
in p_productStatus varchar(45))
begin
  UPDATE Products
  SET productCode = p_productCode,
      productName = p_productName,
      productPrice = p_productPrice,
      productAmount = p_productAmount,
      productDescription = p_productDescription,
      productStatus = p_productStatus
  WHERE Id = p_Id;
end //
DELIMITER ;
CALL UpdateProduct(2, 'PROD002', 'Samsung Galaxy S21 Ultra', 1200.00, 40, 'The latest flagship phone from Samsung with improved camera', 'In stock');
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure deleteProduct(
in p_Id int)
begin
  DELETE FROM Products WHERE Id = p_Id;
end //
DELIMITER ;
call deleteProduct(4);