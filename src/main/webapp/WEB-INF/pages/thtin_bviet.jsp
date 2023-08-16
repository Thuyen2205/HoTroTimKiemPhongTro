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
        <div class="ct-anh">
            <center>
                <img src="${BaiViet.hinhAnh}"" style="width:100%" > 

            </center>
        </div>
        <div class="ndung-chitiet">
            <h4 style="color: tomato; font-weight: bold">${BaiViet.tenBaiViet}</h4>
            <c:if test="${BaiViet.loaiBaiViet.id==1}">
                <p>Địa chỉ: ${BaiViet.diaChiCt}</p>
                <div class="chitiet-3tt">
                    <p>Giá: ${BaiViet.giaThue}</p>
                    <p>Diện tích: ${BaiViet.dienTich}</p>
                    <p> #${BaiViet.id}</p>
                </div>
            </c:if>
            <h4>Thông tin mô tả:</h4>
            <p>${BaiViet.noiDung}</p>

            <!--DAC DIEM TIN DANG-->
            <h4>Đặc điểm tin đăng:</h4>
            <div class="dacdiemtin">
                <table style="width:100%">
                    <tr>
                        <th>Mã tin:</th>
                        <td>#${BaiViet.id}</td>
                    </tr>
                    <tr>
                        <c:if test="${BaiViet.loaiBaiViet.id==1}">
                            <th>Khu vực cho thuê trọ:</th>

                        </c:if>
                        <c:if test="${BaiViet.loaiBaiViet.id==2}">
                            <th>Khu vực cần tìm trọ:</th>
                        </c:if>
                        <td>${BaiViet.phamViCanTim}</td>
                    </tr>
                    <tr>
                        <th>Ngày đăng:</th>
                        <td>${BaiViet.ngayDang}</td>
                    </tr>
                    <tr>
                        <th>Ngày hết hạn:</th>
                        <td>${BaiViet.ngayDang}</td>
                    </tr>
                </table>
            </div>

        </div>
    </div>

    <div class="chitiettin-col2">
        <div class="ct-thtinngdung">
            <center>
                <img src="${BaiViet.idNguoiDung.avatar}" class="rounded-circle" style="width: 150px;" alt="${pageContext.request.userPrincipal.name}" />
                <p>${BaiViet.idNguoiDung.tenNguoiDung}</p>
                <p>${BaiViet.idNguoiDung.sdt}</p>
            </center>
        </div>
        <div class="ct-tinnoibat">
            <center><p>Tin vừa đăng</p></center>

        </div>
    </div>


</section>
