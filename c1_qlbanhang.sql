use c1_qlbanhang;
/**
I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
1. Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của quan hệ.
2. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
3. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
4. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
5. Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
6. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang ai”, “Thuong xuyen”, “Vip”, …
7. Đơn vị tính của sản phẩm chỉ có thể là (“cây”,”hộp”,”cái”,”quyển”,”chục”)
8. Giá bán của sản phẩm từ 500 đồng trở lên.
9. Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
10. Ngày gia nhập của khách hàng thành viên phải lớn hơn ngày sinh của người đó.
11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó ăng ký thành viên (NGDK).
12. Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.
13. Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.
14. Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.
15. Doanh số của một khách hàng là tổng trị giá các hóa đơn mà khách hàng thành viên đó đã mua.
II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
1. Nhập dữ liệu cho các quan hệ trên.
2. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất.
3. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống.
4. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 ó doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh ố từ 2.000.000 trở lên.
III. Viết các câu truy vấn:
1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất.
2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cây”, ”quyển”.
3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 20.000 đến 30.000.
5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” hoặc “Thái Lan” sản xuất có giá từ
20.000 đến 30.000.
6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của óa đơn (giảm dần).
8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
9. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong háng 10/2006.
10. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyễn Văn B” lập trong ngày 10/10/2006.
11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số ượng từ 10 đến 20.
13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số ượng từ 10 đến 20.
14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất hoặc các sản phẩm được bán a trong ngày 1/1/2007.
15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất không bán được trong năm 2006.
18. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
19. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
21. Tính doanh thu bán hàng trong năm 2006.
22. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
23. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
24. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
25. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của tất cả các sản phẩm).
27. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của sản phẩm do “Trung Quốc” sản xuất).
28. * In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
29. Tính tổng số sản phẩm do “Trung Quốc” sản xuất.
30. Tính tổng số sản phẩm của từng nước sản xuất.
31. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
32. Tính doanh thu bán hàng mỗi ngày.
33. Tính tổng số lượng của từng sản phẩm bán ra trong ngày 28/10/2006.
34. Tính doanh thu bán hàng của từng tháng trong năm 2006.
35. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
36. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
37. Tháng mấy trong năm 2006, doanh số bán hàng thấp nhất ?
38. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
39. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
40. *Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau
**/
--  1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất.
select masp, tensp from sanpham 
where nuocsx = 'trung quoc';
-- 2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cây”, ”quyển”.
select masp, tensp from sanpham 
where dvt = 'cay' or 'quyen';
-- 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
select masp, tensp from sanpham 
where masp like 'B%01';
-- 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 20.000 đến 30.000.
select masp, tensp from sanpham 
where Gia between 20000 and 30000
and nuocsx = 'trung quoc';
-- 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” hoặc “Thái Lan” sản xuất có giá từ 20.000 đến 30.000.
select masp, tensp from sanpham 
where Gia between 20000 and 30000
and nuocsx in ('trung quoc','Thai Lan');
-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
select sohoadon from hoadon 
where ngaymuahang in ('2007-01-01','2007-01-02');
-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của óa đơn (giảm dần).
select sohoadon, TriGia from hoadon 
where month(ngaymuahang) = 1 and year(ngaymuahang) = 2007
order by ngaymuahang asc, TriGia desc;
-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select kh.makh, kh.hoten from khachhang kh, hoadon hd
where kh.MaKH = hd.makh and hd.ngaymuahang = '2007-01-01';
-- 9. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong tháng 10/2006.
select distinct sp.masp, sp.tensp from sanpham sp
cross join hoadon hd, khachhang kh, cthd
where kh.HoTen = 'Nguyen Van A' and month(hd.NgayMuaHang) = 10 and year(hd.ngaymuahang) = 2006 and kh.makh = hd.MaKH and hd.SoHoaDon = cthd.SoHD and sp.MaSP = cthd.MaSP;
-- 10. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyễn Văn B” lập trong tháng 10/2006.
select hd.sohoadon, hd.trigia from hoadon hd, nhanvien nv
where nv.hoten = 'Nguyễn Văn B' and nv.manv = hd.manv and month(hd.ngaymuahang) = 10;
-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
select distinct cthd.SoHD from cthd
where cthd.MaSP in ('BB01','BB02');
-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số ượng từ 10 đến 20.
select distinct cthd.SoHD from cthd
where cthd.MaSP in ('BB01','BB02') and cthd.SoLuong between 10 and 20;
-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select distinct sohd from cthd
where sohd in (select sohd from cthd where sohd in (select sohd from cthd where masp = 'BB01') and masp = 'BB02')
and SoLuong in (select SoLuong from cthd where SoLuong in (select SoLuong from cthd where masp = 'BB01') and masp = 'BB02') and soluong between 10 and 20;
-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất hoặc các sản phẩm được bán a trong ngày 1/1/2007.

select distinct sp.masp, sp.tensp from sanpham sp -- , cthd, hoadon hd
join cthd on sp.masp = cthd.MaSP
join hoadon hd on hd.SoHoaDon = cthd.SoHD
where sp.nuocsx = 'trung quoc' or hd.ngaymuahang = '2007-01-01';
-- and sp.masp = cthd.MaSP and hd.SoHoaDon = cthd.SoHD;

-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.

select distinct sp.masp, sp.tensp from sanpham sp
where sp.masp not in (select cthd.masp from cthd);

-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
select distinct sp.masp, sp.tensp from sanpham sp
where sp.masp not in (
	select distinct cthd.masp from cthd, hoadon hd 
    where cthd.SoHD = hd.SoHoaDon 
    and year(hd.ngaymuahang) = 2006
    );
-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất không bán được trong năm 2006.
select sp.masp, sp.tensp from sanpham sp
where sp.MaSP not in (
	select cthd.MaSP from cthd, hoadon hd 
    where hd.SoHoaDon = cthd.SoHD 
    and year(hd.NgayMuaHang) = 2006) 
    and sp.nuocsx = 'trung quoc';
-- 18. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select count(hd.sohoadon) from hoadon hd
where hd.makh is null;
-- 20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg(hd.trigia) as trigiatb from hoadon hd
where year(hd.ngaymuahang) = 2006;
-- 21. Tính doanh thu bán hàng trong năm 2006.
select sum(hd.trigia) as doanhthu2006 from hoadon hd
where year(hd.ngaymuahang) = 2006;
-- 22. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select max(hd.trigia) as trigiamax2006 from hoadon hd
where year(hd.ngaymuahang) = 2006;
-- 23. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select kh.hoten from khachhang kh, hoadon hd
where kh.makh = hd.makh 
and hd.trigia = (select max(hd.trigia) from hoadon hd
				 where year(hd.ngaymuahang) = 2006);
-- 24. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
select makh, hoten from khachhang
order by DoanhSo desc
limit 3;
-- 25. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select masp, tensp from sanpham
where gia in (
	select gia from (
		select distinct gia from sanpham 
        order by gia desc 
        limit 3) as giatop3
);
-- 26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của tất cả các sản phẩm).
select masp, tensp from sanpham
where nuocsx = 'trung quoc' and gia in (
	select gia from (
		select gia from sanpham 
        order by gia asc
        limit 3) as giatop3min
);
-- 27. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của sản phẩm do “Trung Quốc” sản xuất).
select masp, tensp from sanpham
where nuocsx = 'trung quoc' and gia in (
	select gia from (
		select gia from sanpham
        where nuocsx = 'trung quoc'
        order by gia asc
        limit 3) as giatop3min
);
-- 28. * In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
select makh, hoten from khachhang
order by (dense_rank() over (order by doanhso desc)) asc
limit 3;
-- 29. Tính tổng số sản phẩm do “Trung Quốc” sản xuất.
select sum(cthd.soluong) as tongsp from cthd, sanpham sp
where sp.masp = cthd.MaSP and sp.nuocsx = 'trung quoc';
-- 30. Tính tổng số sản phẩm của từng nước sản xuất.
select sp.nuocsx, sum(cthd.soluong) as tongsp from cthd, sanpham sp
where sp.masp = cthd.MaSP
group by sp.nuocsx;
-- 31. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select sp.nuocsx, max(sp.gia) as giamax, min(sp.gia) as giamin, avg(sp.gia) as giatb from sanpham sp
group by sp.nuocsx;
-- 32. Tính doanh thu bán hàng mỗi ngày.
select ngaymuahang, sum(trigia) as doanhsotheongay from hoadon
group by ngaymuahang;
-- 33. Tính tổng số lượng của từng sản phẩm bán ra trong ngày 28/10/2006.
select sp.masp, sp.tensp, sum(cthd.soluong) as tongsoluong from sanpham sp, cthd, hoadon hd
where sp.masp = cthd.masp and cthd.sohd = hd.sohoadon and hd.ngaymuahang = '2006-10-28'
group by sp.masp;
-- 34. Tính doanh thu bán hàng của từng tháng trong năm 2006.

select month(ngaymuahang) as thang, sum(trigia) as doanhthu from hoadon
where year(ngaymuahang) = 2006
group by thang
order by thang;

-- 35. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select kh.makh, kh.hoten from khachhang kh, hoadon hd
where kh.MaKH = hd.MaKH 
and hd.makh = (
	select hd.makh from hoadon hd 
	group by hd.makh 
    order by count(hd.sohoadon) desc 
    limit 1)
group by kh.makh;

select kh.makh, kh.hoten from khachhang kh
join hoadon hd on kh.MaKH = hd.makh
group by hd.makh
having count(hd.sohoadon) = (
	select max(temp.sl) from (
		select distinct count(hd.sohoadon) as sl from hoadon hd 
        group by hd.makh) as temp);

-- 36. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select distinct sp.masp, sp.tensp from sanpham sp, cthd
where sp.masp = cthd.masp 
and cthd.masp = (
	select cthd.masp from cthd, hoadon hd
    where cthd.sohd = hd.sohoadon and year(hd.ngaymuahang) = 2006
	group by cthd.masp
    order by sum(cthd.soluong) asc
    limit 1
);
-- 37. Tháng mấy trong năm 2006, doanh số bán hàng thấp nhất ?
select month(hd.ngaymuahang) as month_min, sum(hd.trigia) as doanhso_min from hoadon hd
group by month_min
order by doanhso_min asc
limit 1;
-- 38. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
select sp.nuocsx, sp.masp, sp.tensp from sanpham sp
join (
	select nuocsx, max(gia) as max_gia from sanpham
    group by nuocsx
) as sp1 
ON sp.nuocsx = sp1.nuocsx AND sp.gia = sp1.max_gia;
-- 39. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
select distinct kh.makh, kh.hoten from khachhang kh, hoadon hd
where kh.makh = hd.makh 
and kh.makh in (
	select khnew.makh from (
		select makh from khachhang
        order by DoanhSo desc
        limit 10) as khnew
        )    
and kh.makh = (
	select hd.makh from hoadon hd
	group by hd.makh
	order by count(hd.SoHoaDon) desc
	limit 1 
);
-- 40. *Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau
select nuocsx from sanpham
group by nuocsx
having count(distinct gia) >=3 and count(masp) >= 3;
