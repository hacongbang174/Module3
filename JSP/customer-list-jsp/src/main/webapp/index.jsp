<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>
    h3 {
        text-align: center;
    }
</style>
<body>
<div class="container-fluid">
    <h3>Danh sách khách hàng</h3><br>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.customers}" var="c">
            <tr>
                <td>${c.getId()}</td>
                <td>${c.getFullName()}</td>
                <td>${c.getBirthDay()}</td>
                <td>${c.getAddress()}</td>
                <td>
                    <img src="${c.getImg()}" width="50px" height="50px">
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>



</body>
</html>