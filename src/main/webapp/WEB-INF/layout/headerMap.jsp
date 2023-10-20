<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-M500zF9hEI3OoOPyK_dVHfWDyZcx5fI&libraries=geometry&callback=initMap" async defer></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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