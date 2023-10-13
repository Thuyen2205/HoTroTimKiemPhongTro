<%-- 
    Document   : capnhattaikhoan
    Created on : Sep 6, 2023, 1:04:36 AM
    Author     : ThanhThuyen
--%>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Date" %>

<link href="<c:url value="/css/style.css"/>"rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<!DOCTYPE html>


<html>
    <div class="formcapnhat">
        <c:url value="/capnhattaikhoan" var="updateTaiKhoan"/>

        <form:form action="${updateTaiKhoan}" method="POST" modelAttribute="taikhoan"  enctype="multipart/form-data" >

            <form:hidden path="id" />
            <form:hidden path="idLoaiTaiKhoan" />
            <form:hidden path="kiemDuyet" />
            <form:hidden path="matKhau" />
            <form:hidden path="tenNguoiDung" />
            <form:hidden path="kinhDo" />
            <form:hidden path="viDo" />
            <center><h4 style="color:#005555; font-weight: bold; padding: 25px">CẬP NHẬT THÔNG TIN CÁ NHÂN</h4></center>

            <div class="wrapper">
                <c:if test="${not empty errMsg}">
                    <div class="error-message">
                        ${errMsg}
                    </div>
                </c:if>



                <div class="input-box">
                    <div class="input-bot-p">
                        <p>Email cá nhân</p>
                    </div>
                    <div class="input-box-form">
                        <form:input type="text" id="email" name="email" path="email" placeholder="email"/>
                    </div>
                </div>

                <div class="input-box">
                    <div class="input-bot-p">
                        <p>Số điện thoại </p>    
                    </div>
                    <div class="input-box-form">
                        <form:input type="text" id="sdt" name="sdt" path="sdt" placeholder="So dien thoai"/>
                    </div>                    
                </div>

                <div class="input-box">
                    <div class="input-bot-p">
                        <p>Tên tài khoản</p>
                    </div>
                    <div class="input-box-form">
                        <form:input type="text" id="tenTaiKhoan" name="tenTaiKhoan" path="tenTaiKhoan" placeholder="Tên tài khoan"/>
                    </div>
                </div>

                <div class="input-box">
                    <div class="input-bot-p">              
                        <p for="file">Avatar: </p>
                    </div>
                    <div class="input-box-form">
                        <form:input path="file" type="file" id="imageFile" name="imageFile" onchange="chooseFile(this)"  accept="image/jpg, image/jpeg, image/png"/>
                    </div>
                </div>
                <center>
                    <button class="btn"  type="sumit" style="
                            width: 40%;
                            padding: 10px 20px;
                            font-size: 17px;
                            background-color: #005555;
                            color: white;
                            border: none;
                            border-radius: 5px;
                            transition: all 0.5s;
                            margin-bottom: 20px;">CẬP NHẬT
                    </button>
                </center>
                <center>
                    <button class="btn" style="
                            width: 40%;
                            padding: 10px 20px;
                            font-size: 17px;
                            background-color: #005555;
                            color: white;
                            border: none;
                            border-radius: 5px;
                            transition: all 0.5s;
                            margin-bottom: 20px;">
                        <a style="color:white; text-decoration: none" href="<c:url value ="/doimatkhau"/> ">ĐỔI MẬT KHẨU</a>
                    </button>
                </center>
            </div>
        </form:form>
    </div>
</html>
<script>
    document.querySelector("form").addEventListener("submit", function (e) {
        const fileInput = document.getElementById("imageFile");

        if (fileInput.files.length === 0) {
            e.preventDefault();
            alert("Vui lòng chọn một tệp hình ảnh.");
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
                    locationModal.modal("hide");
                });
            } else {
                console.log("Geolocation không được hỗ trợ trong trình duyệt này.");
                locationModal.modal("hide");
            }
        });
    });

</script>

