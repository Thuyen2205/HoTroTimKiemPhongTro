<%-- 
    Document   : doimatkhau
    Created on : Sep 4, 2023, 10:41:51 PM
    Author     : Admins
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/css/trangchu.css"/>"rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<c:url value="/doimatkhau" var="actionDoiMatKhau">
    <c:param name="idNguoiDung" value="${taikhoan.id}" />
</c:url>
<div class="wrapper">
    <c:if test="${not empty error}">
        <p style="color: red">${error}</p>
    </c:if>

    <c:if test="${not empty success}">
        <p style="color: green">${success}</p>
    </c:if>
    <div class="change-password">
        <p class="change-password-title">Thay Đổi Mật Khẩu</p>

        <form action="${actionDoiMatKhau}" method="post">
            <div class="input-box">
                <label for="matKhauCu">Mật Khẩu Cũ:</label>
                <input type="password" id="matKhauCu" name="matKhauCu" required><br><br>
            </div>

            <div class="input-box">
                <label for="matKhauMoi">Mật Khẩu Mới:</label>
                <input type="password" id="matKhauMoi" name="matKhauMoi" required><br><br>
            </div>

            <div class="input-box">
                <label for="xacNhanMatKhauMoi">Xác Nhận Mật Khẩu Mới:</label>
                <input type="password" id="xacNhanMatKhauMoi" name="xacNhanMatKhauMoi" required><br><br>
            </div>

            <input type="submit" class="btn btn-danger" value="Đổi Mật Khẩu">
        </form>

    </div>



</div>

