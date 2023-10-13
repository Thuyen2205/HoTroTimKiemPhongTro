<%-- 
    Document   : doimatkhau
    Created on : Sep 4, 2023, 10:41:51 PM
    Author     : Admins
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="<c:url value="/css/style.css"/>"rel="stylesheet">

<html>
    <div class="formdoimatkhau">
        <c:url value="/doimatkhau" var="actionDoiMatKhau">
            <c:param name="idNguoiDung" value="${taikhoan.id}" />
        </c:url>
        <center><h4 style="color:#005555; font-weight: bold; padding: 25px">ĐỔI MẬT KHẨU TÀI KHOẢN</h4></center>
        <div class="wrapper" style="text-align: center; ">
            <c:if test="${not empty errMsg}">
                <div class="error-message">
                    ${errMsg}
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <p style="color: red; font-size: 20px; font-weight: bold">${error}</p>
            </c:if>

            <c:if test="${not empty success}">
                <p style="color: green; font-size: 20px; font-weight: 400">${success}</p>
            </c:if>
        </div>

        <div class="change-password">
            <form action="${actionDoiMatKhau}" method="post">
                <div class="input-box">
                    <div class="input-bot-p">               
                        <label for="matKhauCu">Mật khẩu cũ:</label>
                    </div>
                    <div class="input-box-form">
                        <input type="password" id="matKhauCu" name="matKhauCu" required>
                    </div>
                </div>

                <div class="input-box">
                    <div class="input-bot-p">
                        <label for="matKhauMoi">Mật khẩu mới:</label>
                    </div>
                    <div class="input-box-form">
                        <input type="password" id="matKhauMoi" name="matKhauMoi" required>
                    </div>
                </div>

                <div class="input-box">
                    <div class="input-bot-p">
                        <label for="xacNhanMatKhauMoi">Xác nhận mật khẩu mới :</label>
                    </div>
                    <div class="input-box-form">
                        <input type="password" id="xacNhanMatKhauMoi" name="xacNhanMatKhauMoi" required>
                    </div>
                    
                </div>
                <center>
                    <input type="submit" class="btn custom-button3" value="ĐỔI MẬT KHẨU">
                </center>
            </form>

        </div>

    </div>
</html>