<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2023
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css"
          integrity="sha512-rt/SrQ4UNIaGfDyEXZtNcyWvQeOq0QLygHluFQcSjaGB04IxWhal71tKuzP6K8eYXYB6vJV4pHkXcmFGGQ1/0w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.min.js"
            integrity="sha512-7rusk8kGPFynZWu26OKbTeI+QPoYchtxsmPeBqkHIEXJxeun4yJ4ISYe7C6sz9wdxeE1Gk3VxsIWgCZTc+vX3g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.5/sweetalert2.all.min.js"
            integrity="sha512-2JsZvEefv9GpLmJNnSW3w/hYlXEdvCCfDc+Rv7ExMFHV9JNlJ2jaM+uVVlCI1MAQMkUG8K83LhsHYx1Fr2+MuA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="/assets/style.css">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-6">
            <c:if test="${requestScope.errors !=null}">
                <div class="alert alert-danger">
                    <ul>
                        <c:forEach items="${requestScope.errors}" var="e">
                            <li>${e}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <c:if test="${requestScope.message!=null}">
                <script>
                    window.onload = function () {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    }
                </script>
            </c:if>
            <form method="post">
                <div class="row mb-2">
                    <label class="col-4">Name</label>
                    <input name="name" class="col-8 form-control" value="${requestScope.student.getName()}" required/>
                </div>
                <div class="row mb-2">
                    <label class="col-4">Date Of Birth</label>
                    <input name="dob" type="date" class="col-8 form-control" value="${requestScope.student.getDob()}" required/>
                </div>
                <div class="row mb-2">
                    <label class="col-4">Address</label>
                    <input name="address" class="col-8 form-control" value="${requestScope.student.getAddress()}" required/>
                </div>
                <div class="row mb-2">
                    <label class="col-4">Phone Number</label>
                    <input name="phone" type="number" class="col-8 form-control"
                           value="${requestScope.student.getPhone()}" required/>
                </div>
                <div class="row mb-2">
                    <label class="col-4">Email</label>
                    <input name="email" class="col-8 form-control"
                           value="${requestScope.student.getEmail()}" required/>
                </div>
                <div class="row mb-2">
                    <label class="col-4">Class</label>
                    <select name="classroom" class="form-control col-8">
                        <c:forEach items="${requestScope.classrooms}" var="c">
                            <option value="${c.getIdClassroom()}">${c.getNameClassroom()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="row">
                    <input type="submit" class="mybutton offset-4 btn btn-primary"/>
                    <a href="/students">
                        <button type="button" class="mybutton btn btn-dark">Back</button>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
