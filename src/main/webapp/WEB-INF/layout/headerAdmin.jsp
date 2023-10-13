<%-- 
    Document   : headerAdmin
    Created on : Aug 26, 2023, 1:05:13 PM
    Author     : ThanhThuyen
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/css/style.css"/>"rel="stylesheet">

<nav class=" navbar navbar-expand-sm navbar-dark">
    <div class="container-fluid">
        <a style="font-weight: bold" class="navbar-brand">ALO NHÀ TRỌ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mynavbar">

            <ul class="navbar-nav me-auto">

                <div class="nav-page">
                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link1" href="<c:url value ="/admin"/> ">TK THEO NĂM </a>
                            </li>
                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link1" href="<c:url value ="/adminmonth"/> ">TK THEO THÁNG</a>
                            </li>
                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link1" href="<c:url value ="/adminquarter"/> ">TK THEO QUÝ</a>
                            </li>

                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link1" href="<c:url value ="/adminduyetbai"/> ">DUYỆT BÀI VIẾT</a>
                            </li>
                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link1" href="<c:url value ="/adminduyettaikhoan"/> ">DUYỆT TÀI KHOẢN</a>
                            </li>
                        </div>

                <div class="nav-ngdung">
                    <li class="nav-item">
                        <a style="color: red" class="nav-link" href="<c:url value ="/admin" />">${pageContext.request.userPrincipal.name} </a>                       
                    </li>
                    <a class="navbar-brand" href="<c:url value ="/admin" />">
                        <img src="${taikhoan.avatar}" alt="${pageContext.request.userPrincipal.name}" style="width:30px;" class="rounded-pill"> 
                    </a>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value ="/logout" />"> Đăng xuất </a>                       
                    </li>
                </div>


            </ul>


        </div>
    </div>
</nav>