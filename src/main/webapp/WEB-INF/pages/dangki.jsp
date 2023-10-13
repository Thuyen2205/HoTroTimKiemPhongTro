<%-- 
    Document   : dangki
    Created on : Jul 26, 2023, 4:02:50 PM
    Author     : ThanhThuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Date" %>

<link href="<c:url value="/css/trangchu.css"/>"rel="stylesheet">
<!--<link href="<c:url value="/css/style.css"/>" rel="stylesheet" />-->

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<c:url value="/dangki" var="action"/>


<div class="modal fade" id="locationModal" tabindex="-1" role="dialog" aria-labelledby="locationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="locationModalLabel">Yêu cầu cung cấp vị trí</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn có muốn cung cấp vị trí của mình không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                <button type="button" class="btn btn-primary" id="getLocationButton">Có</button>
            </div>
        </div>
    </div>
</div>


<body>

    <div class="wrapper">
        <form:form method="post" action="${action}" modelAttribute="user"  enctype="multipart/form-data">
            <h1>ĐĂNG KÍ TÀI KHOẢN</h1>
            <center>
                <c:if test="${not empty errMsg}">
                    <div class="error-message">
                        ${errMsg}
                    </div>
                </c:if>

                <div class="input-box">
                    <form:input type="text" placeholder="Họ và tên" path="tenNguoiDung" />
                </div>
                <div class="input-box">
                    <form:input type="text" placeholder="Email" path="email" />
                </div>
                <div class="input-box">
                    <form:input type="text" placeholder="Số điện thoại" path="sdt" />
                </div>

                <div class="input-box">
                    <form:input type="text" placeholder="Tên tài khoản" path="tenTaiKhoan" />
                </div>
                <div class="input-box">
                    <form:input type="password" placeholder="Mật khẩu" path="matKhau" />           
                </div>
                <div class="input-box">
                    <form:input type="password" placeholder="Xác nhận lại mật khẩu" path="xacNhanMatKhau" />           
                </div>

                <div class="input-box chonloaiTK">
                    <form:select class="role" name="role" id="role" path="idLoaiTaiKhoan">
                        <c:forEach items="${user_role}" var="c">
                            <option class="option" value="${c.id}" selected>${c.tenLoaiTaiKhoan}</option>
                        </c:forEach>
                    </form:select>
                </div> 

                <div class="upload-avatar" id="upload-avatar-div" style="display: none; margin: 0 auto;">
                    <h5 style="width: 30%; padding: 10px; border-radius:40px; margin-right: 10px;">Ảnh trọ</h5>                   
                    <div class="upload-avatar-input" style=" margin: 0 auto; width: 100%; padding: 10px;">
                        <form:input type="file" id="file2" path="file2" placeholder="Upload ảnh phòng trọ"/> 
                    </div>
                </div>

                <div class="upload-avatar">
                    <h5 style="width: 30%; padding: 10px; border-radius:40px; margin-right: 10px;">Avatar</h5>                   

                    <div class="upload-avatar-input">
                        <form:input type="file" id="fileInput" path="file" placeholder="Upload Avatar"/>
                    </div>
                </div>

            </center>



            <script>
                document.getElementById('role').addEventListener('change', function () {
                    var selectedValue = this.value;
                    var uploadAvatarDiv = document.getElementById('upload-avatar-div');
                    if (selectedValue === '2') {
                        uploadAvatarDiv.style.display = 'block';
                        document.querySelector("form").addEventListener("submit", function (e) {
                            const fileInput = document.getElementById("file2");

                            if (fileInput.files.length === 0) {
                                e.preventDefault();
                                alert("Vui lòng chọn một tệp hình ảnh trọ của bạn.");
                            }
                        });

                    } else {
                        uploadAvatarDiv.style.display = 'none';
                    }
                });
            </script>
            <button class="btn-dangki" type="submit" >Đăng kí tài khoản</button>
            <div  class="register-link">
                <p class="register-link-p">
                    Bạn đã có tài khoản?  <a href="<c:url value ="/dangnhap"/>">  Đăng nhập ngay </a>
                </p>
            </div>
            <div  class="register-link">
                <p class="register-link-p">
                    Quay trở về  <a href="<c:url value ="/"/>">  Trang chủ </a>
                </p>
            </div>
            <form:input type="hidden" path="kinhDo" />
            <form:input type="hidden" path="viDo" />

        </form:form>

    </div>

</body>
<script>
    document.querySelector("form").addEventListener("submit", function (e) {
        const fileInput = document.getElementById("fileInput");

        if (fileInput.files.length === 0) {
            e.preventDefault();
            alert("Vui lòng chọn một avatar.");
        }
    });
    document.addEventListener("DOMContentLoaded", function () {
        var locationModal = $("#locationModal");

        locationModal.modal("show");

        $("#getLocationButton").click(function () {
            if ("geolocation" in navigator) {
                navigator.geolocation.getCurrentPosition(function (position) {

                    var latitude = position.coords.latitude;
                    var longitude = position.coords.longitude;

                    document.querySelector("input[name='kinhDo']").value = latitude;
                    document.querySelector("input[name='viDo']").value = longitude;

                    locationModal.modal("hide");
                }, function (error) {
                    console.log("Lỗi khi lấy vị trí: " + error.message);
                });
            } else {
                console.log("Geolocation không được hỗ trợ trong trình duyệt này.");
            }
        });
    });
</script>