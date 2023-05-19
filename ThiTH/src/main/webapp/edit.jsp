<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/5/2023
  Time: 10:37 AM
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
  <link rel="stylesheet" type="text/css" href="admin/css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
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
            <form method="POST">
              <div class="modal-body">
                <div class="row">
                  <div class="form-group  col-md-12">
                                        <span class="thong-tin-thanh-toan">
                                            <h5>Chỉnh sửa thông tin sinh viên</h5>
                                        </span>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <label class="control-label">Name</label>
                    <input class="form-control" type="text" required
                           name="name" value="${requestScope.student.getName()}">
                  </div>

                  <div class="form-group col-md-6">
                    <label class="control-label">Day Of Birth</label>
                    <input class="form-control" type="date" name="dob"
                           required value="${requestScope.student.getDob()}">
                  </div>
                  <div class="form-group col-md-6">
                    <label class="control-label">Address</label>
                    <input class="form-control" name="address"
                           required value="${requestScope.student.getAddress()}">
                  </div>
                  <div class="form-group col-md-6">
                    <label class="control-label">Phone</label>
                    <input class="form-control" name="phone" type="number"
                           value="${requestScope.student.getPhone()}">
                  </div>

                  <div class="form-group col-md-6">
                    <label class="control-label">Email</label>
                    <input class="form-control" name="email" type="text"
                           value="${requestScope.student.getEmail()}">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="exampleSelect1" class="control-label">Class</label>
                    <select name="classroom" class="form-control"
                            id="exampleSelect1">
                      <c:forEach items="${requestScope.classrooms}" var="c">
                        <c:if test="${requestScope.student.getIdClassroom()==c.getIdClassroom()}">
                          <option>${c.getNameClassroom()}</option>
                        </c:if>
                      </c:forEach>
                      <c:forEach items="${requestScope.classrooms}" var="c">
                        <option value="${c.getIdClassroom()}">${c.getNameClassroom()}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
              </div>
              <c:if test="${requestScope.errors !=null}">
                <div class="alert alert-danger">
                  <ul>
                    <c:forEach items="${requestScope.errors}" var="e">
                      <li>${e}</li>
                    </c:forEach>
                  </ul>
                </div>
              </c:if>
              <BR>

              <button class="btn btn-save" type="submit">Lưu lại</button>

              <a class="btn btn-cancel" data-dismiss="modal" href="students">Hủy bỏ</a>
              <BR>
            </form>

      <!--
      MODAL
      -->
<script>
  function handleDelete(id, title) {
    document.getElementById("txtDeleteId").value = id;
    Swal.fire({
      title: 'Bạn có muốn xóa?',
      text: title,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes!'
    }).then((result) => {
      if (result.isConfirmed) {
        document.getElementById("frmDelete").submit();
      }
    })

  }
</script>
<!-- Essential javascripts for application to work-->
<script src="admin/js/jquery-3.2.1.min.js"></script>
<script src="admin/js/popper.min.js"></script>
<script src="admin/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="admin/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="admin/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
  $('#sampleTable').DataTable();

  //Thời Gian
  function time() {
    var today = new Date();
    var weekday = new Array(7);
    weekday[0] = "Chủ Nhật";
    weekday[1] = "Thứ Hai";
    weekday[2] = "Thứ Ba";
    weekday[3] = "Thứ Tư";
    weekday[4] = "Thứ Năm";
    weekday[5] = "Thứ Sáu";
    weekday[6] = "Thứ Bảy";
    var day = weekday[today.getDay()];
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    nowTime = h + " giờ " + m + " phút " + s + " giây";
    if (dd < 10) {
      dd = '0' + dd
    }
    if (mm < 10) {
      mm = '0' + mm
    }
    today = day + ', ' + dd + '/' + mm + '/' + yyyy;
    tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
    document.getElementById("clock").innerHTML = tmp;
    clocktime = setTimeout("time()", "1000", "Javascript");

    function checkTime(i) {
      if (i < 10) {
        i = "0" + i;
      }
      return i;
    }
  }
</script>
<script>
  $(document).ready(function () {
    $("#sampleTable").on("click", ".trash", function () {
      swal({
        title: "Cảnh báo",
        text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
        buttons: ["Hủy bỏ", "Đồng ý"],
      }).then((willDelete) => {
        if (willDelete) {
          var productId = $(this).attr("value");
          var requestData = {
            action: "deleteProduct",
            product_id: productId
          };
          $.ajax({
            url: "/productManager?action=deleteProduct",
            type: "POST",
            data: requestData,
            success: function () {
              swal("Đã xóa thành công!", {
                // Các cài đặt swal khi xóa thành công
              }).then(() => {
                location.reload(); // Load lại trang
              });
            }
          });
        }
      });
    });
  });
  // $(document).ready(jQuery(function () {
  //     jQuery(".trash").click(function () {
  //         swal({
  //             title: "Cảnh báo",
  //             text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
  //             buttons: ["Hủy bỏ", "Đồng ý"],
  //         })
  //                 .then((willDelete) => {
  //                     if (willDelete) {
  //                         window.location = "/productManager?action=deleteProduct&product_id=" + $(this).attr("value");
  //                         swal("Đã xóa thành công.!", {
  //                         });
  //                     }
  //                 });
  //     });
  // }));
</script>
<script>
  var myApp = new function () {
    this.printTable = function () {
      var tab = document.getElementById('sampleTable');
      var win = window.open('', '', 'height=700,width=700');
      win.document.write(tab.outerHTML);
      win.document.close();
      win.print();
    }
  }
</script>
</body>
</html>
