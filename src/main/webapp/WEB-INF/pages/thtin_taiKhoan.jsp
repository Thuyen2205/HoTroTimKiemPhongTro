<%-- 
    Document   : thtin_bviet
    Created on : Aug 12, 2023, 2:34:35 PM
    Author     : Admins
--%>


<%@page import="com.ntt.pojo.BaiViet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" />

<c:url value="/thtin_taiKhoan" var="actionTaiKhoan">
    <c:param name="taiKhoanId" value="${taikhoanduyet.id}" />  
</c:url>
<c:url value="/thtin_taiKhoanDele" var="actionTaiKhoanDele">
    <c:param name="taiKhoanId" value="${taikhoanduyet.id}" />  
</c:url>
<html>
    <sesion class="body-duyettk">
        <div class="duyettk-nguoi">
            <center>
                <div class="nguoi-anh">
                    <img src="${taikhoanduyet.avatar}"/>
                </div>
                <div class="nguoi-thtin">
                    <c:if test="${taikhoanduyet.idLoaiTaiKhoan.id==2}">
                        <p><strong>CHỦ TRỌ </strong>(#${taikhoanduyet.id})</p>
                    </c:if>
                    <c:if test="${taikhoanduyet.idLoaiTaiKhoan.id==3}">
                        <p><strong>KHÁCH HÀNG </strong>(#${taikhoanduyet.id})</p>
                    </c:if>
            </center>

            <div class="thtinflex">
                <div class="thtinflex1">
                    <p>Tên người dùng</p>
                </div>
                <div class="thtinflex2">
                    ${taikhoanduyet.tenNguoiDung}
                </div>
            </div>     
            <div class="thtinflex">
                <div class="thtinflex1">
                    <p>Email</p>
                </div>
                <div class="thtinflex2">
                    ${taikhoanduyet.email}
                </div>
            </div>     
            <div class="thtinflex">
                <div class="thtinflex1">
                    <p>Tên tài khoản</p>
                </div>
                <div class="thtinflex2">
                    ${taikhoanduyet.tenTaiKhoan}
                </div>
            </div>     
            <div class="thtinflex">
                <div class="thtinflex1">
                    <p>Số điện thoại</p>
                </div>
                <div class="thtinflex2">
                    ${taikhoanduyet.sdt}
                </div>
            </div>     
            <div class="thtinflex">
                <div class="thtinflex1">
                    <p>Ngày tạo</p>
                </div>
                <div class="thtinflex2">
                    ${taikhoanduyet.ngayTao}
                </div>
            </div>     

        </div>
    </div>
    <div class="duyettk-phong">
        <div class="phong-anh">
            <div class="phong-anh-name">
                <center><h5>ẢNH PHÒNG TRỌ</h5></center>
            </div>
            <div class="phong-anh-img">
                <img src="${taikhoanduyet.hinhAnh}"/>
            </div>
        </div>
    </div>

</sesion>
<center>
    <form:form method="post" action="${actionTaiKhoan}">
        <button class="btn btn-danger custom-button3" type="submit">XÁC NHẬN DUYỆT TÀI KHOẢN</button>
    </form:form>

    <form:form method="post" action="${actionTaiKhoanDele}">
        <button class="btn btn-danger custom-button3" type="submit">XÓA TÀI KHOẢN</button>
    </form:form>
</center>
</html>








<script>
    window.onload = function () {
        let dates = document.getElementsByClassName("commentDate")
        for (let i = 0; i < dates.length; i++)
        {
            dates[i].innerText = moment(dates[i].innerText).fromNow()
        }
    }

</script>
<script src="<c:url value="/js/main.js"/>"></script>


