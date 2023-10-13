<%-- 
    Document   : adminduyetbai
    Created on : Aug 31, 2023, 2:58:18 AM
    Author     : ThanhThuyen
--%>

<%@page import="com.ntt.pojo.BaiViet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" />
<!DOCTYPE html>
<html>
    <center><h3 style="margin: 20px 0; color: red;">DANH SÁCH BÀI VIẾT CHƯA DUYỆT</h3></center>


    <div class="body-duyetbai">
        <div class="duyetbaichothue">
            <center><h5 style="margin-bottom: 20px; color: red;">TIN CHO THUÊ</h5></center>

            <c:forEach items="${bvChuaDuyet}" var="t" >
                <c:if test="${t.loaiBaiViet.id==1}" >
                    <c:if test="${t.loaiTrangThai.id==2}">
                        <div class="bviet2">
                            <div class="bviet2_anh">
                                <img src="${t.hinhAnh}"/>
                            </div>
                            <div class="bviet2_ndung">
                                <table style="width:100%">
                                    <c:url value="/thtin_bviet" var="bvietAction">
                                        <c:param name="baivietId" value="${t.id}" />  
                                    </c:url>
                                    <a style="text-transform: uppercase" href="${bvietAction}" >${t.tenBaiViet}</a>
                                    <tr>
                                        <th>Khu vực:</th>
                                        <td>${t.phamViCanTim}</td>
                                    </tr>
                                    <tr>
                                        <th>Ngày đăng:</th>
                                        <td>${t.ngayDang}</td>
                                    </tr>
                                    <tr>

                                        <th></th>
                                        <td>   
                                            <c:url value="/thtin_bviet" var="bvietAction">
                                                <c:param name="baivietId" value="${t.id}" />  
                                            </c:url>
                                            <div class="groupbtn"><a href="${bvietAction}"> Đọc thêm</a></div>                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </c:forEach>

        </div>

        <div class="duyetbaitimtro">
            <center><h5 style="margin-bottom: 20px; color: red;">TIN TÌM TRỌ</h5></center>
                <c:forEach items="${bvChuaDuyet}" var="t" >
                    <c:if test="${t.loaiBaiViet.id==2}" >
                        <c:if test="${t.loaiTrangThai.id==2}">
                        <div class="bviet2">
                            <div class="bviet2_anh2">
                                <img src="https://res.cloudinary.com/dpp5kyfae/image/upload/v1694280790/timtro2_k6dbqd.jpg"/>                            </div>
                            <div class="bviet2_ndung2">
                                <table style="width:100%">
                                    <c:url value="/thtin_bviet" var="bvietAction">
                                        <c:param name="baivietId" value="${t.id}" />  
                                    </c:url>
                                    <a style="text-transform: uppercase" href="${bvietAction}" >${t.tenBaiViet}</a>
                                    <tr>
                                        <th>Khu vực:</th>
                                        <td>${t.phamViCanTim}</td>
                                    </tr>
                                    <tr>
                                        <th>Ngày đăng:</th>
                                        <td>${t.ngayDang}</td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td>   
                                            <c:url value="/thtin_bviet" var="bvietAction">
                                                <c:param name="baivietId" value="${t.id}" />  
                                            </c:url>
                                            <div class="groupbtn"><a href="${bvietAction}"> Đọc thêm</a></div>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </c:forEach>
        </div>
    </div>

</html>