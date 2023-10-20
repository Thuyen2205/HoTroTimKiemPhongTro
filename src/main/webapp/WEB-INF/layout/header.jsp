<%-- 
Document   : header
Created on : Jul 25, 2023, 9:33:27 PM
Author     : ThanhThuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/css/style.css"/>"rel="stylesheet">

<nav class="navbar navbar-expand-sm navbar-dark">
    <div class="container-fluid">
        <a style="font-weight: bold" class="navbar-brand"">ALO NHÀ TRỌ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mynavbar">

            <ul class="navbar-nav me-auto">
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <div class="nav-signlog">

                        <li class="nav-item">
                            <a style="color: whitesmoke" class="nav-link" href="<c:url value ="/dangnhap"/>"> ĐĂNG NHẬP </a>                       
                        </li>
                        <li class="nav-item">
                            <a style="color: whitesmoke" class="nav-link" href="<c:url value ="/dangki"/>"> ĐĂNG KÝ </a>                       
                        </li>
                    </div>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <c:if test="${nguoidung.idLoaiTaiKhoan.id.toString() eq '1'}">
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
                    </c:if>
                    <c:if test="${nguoidung.idLoaiTaiKhoan.id.toString() ne '1'}">
                        <div class="nav-page">
                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link0" href="<c:url value ="/"/> ">TRANG CHỦ</a>
                            </li>
                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link0" href="<c:url value ="/canhan"/> ">TRANG CÁ NHÂN</a>
                            </li>
                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link0" href="<c:url value ="/dangbai"/> ">ĐĂNG BÀI VIẾT</a>
                            </li>

                            <li class="nav-item">
                                <a style="color: whitesmoke" class="nav-link link0" href="<c:url value ="/bando"/> ">BẢN ĐỒ</a>
                            </li>
                        </div>


                    </c:if>
                    <div class="nav-ngdung">
                        <li class="nav-item">
                            <a style="color: orange" class="nav-link " href="<c:url value ="/canhan" />">Xin chào, ${pageContext.request.userPrincipal.name} </a>                       
                        </li>

                        <a class="navbar-brand" href="<c:url value ="/canhan" />">
                            <img src="${taikhoan.avatar}" alt="${pageContext.request.userPrincipal.name}" style="width:30px;" class="rounded-pill"> 
                        </a>

                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value ="/logout" />"> Đăng xuất </a>                       
                        </li>
                    </div>
                </c:if>

            </ul>

        </div>
    </div>
</nav>