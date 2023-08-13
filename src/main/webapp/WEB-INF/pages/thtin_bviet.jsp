<%-- 
    Document   : thtin_bviet
    Created on : Aug 12, 2023, 2:34:35 PM
    Author     : Admins
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" />

<section class="chitiettin" >
    <div class="chitiettin-col1">
        <div class="anh-chitiet">

        </div>
        <div class="ndung-chitiet">
            <h2>${BaiViet.tenBaiViet}</h2>
            <p>Địa chỉ: ${BaiViet.phamViCanTim}</p>
            <div class="chitiet-3tt">
                <p>Giá: ${BaiViet.giaThue}</p>
                <p>Diện tích: ${BaiViet.dienTich}</p>
                <p> #${BaiViet.id}</p>
            </div>
            <p>${BaiViet.noiDung}</p>
        </div>
    </div>

    <div class="chitiettin-col2">
        <a class="navbar-brand" href="#">
            <img src="${BaiViet.idNguoiDung.avatar}" alt="${pageContext.request.userPrincipal.name}" style="width:80px;" class="rounded-pill"> 
        </a>
        <h2>${BaiViet.idNguoiDung.tenNguoiDung}</h2>
        <h2>${BaiViet.idNguoiDung.sdt}</h2>

    </div>
</section>
