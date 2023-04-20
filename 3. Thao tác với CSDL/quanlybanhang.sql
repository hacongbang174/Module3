-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.oID, o.oDate, o.oTotalPrice from `order` o;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select distinct customer.cName, product.pName from customer
cross join product, orderdetail,`order` where customer.cID = `order`.cID and product.pID = orderdetail.pID
order by customer.cName;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select distinct customer.cName from customer
where customer.cName not in (select distinct customer.cName from customer
cross join product, orderdetail,`order`where customer.cID = `order`.cID and product.pID = orderdetail.pID)
order by customer.cName;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select distinct `order`.oID, `order`.oDate, 
(select sum((select orderdetail.odQTY*product.pPrice from product where orderdetail.pId = product.pID)) from orderdetail
where orderdetail.oID = `order`.oID) as oTotalPrice 
from `order`
order by `order`.oID;

