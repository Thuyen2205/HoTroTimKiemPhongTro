<%-- 
    Document   : trangchu
    Created on : Jul 26, 2023, 12:46:58 PM
    Author     : ThanhThuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value="/css/trangchu.css"/>"rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<%--<c:url value="/quenmatkhau" var="action"/>--%>
<%--<c:url value="/quenmatkhau_xacnhan" var="actionXacNhan"/>--%>


<c:url value="/quenmatkhau" var="action">
    <c:param name="user" value="${user.id}" />
</c:url>


<body>

    <div class="wrapper">
        <c:if test="${param.error!=null}">
            <div class="alert alert-danger" >ĐANG CÓ MỘT VÀI SỰ CỐ XẢY RA! VUI LÒNG QUAY TRỞ LẠI SAU!!! </div>
        </c:if>

        <form id="form1" method="post" action="${action}">
            <h1>Xác nhận tài khoản</h1>

            <center>
                <c:if test="${param.accessDenied != null}">
                    <center><div style="margin-top: 15px; color: #45FFCA ">Tài khoản của bạn đang đợi được duyệt!</div></center>
                    </c:if>

                <div class="input-box">
                    <input type="text" name="username" placeholder="Tên tài khoản" required>
                </div>

            </center>                
            <button  class="btn" type="submit" >Xác thực</button>


        </form>




    </div>

</body>

