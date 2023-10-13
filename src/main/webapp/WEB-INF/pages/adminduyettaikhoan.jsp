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
    <center><h3 style="margin: 20px 0; color: red;">DANH SÁCH TÀI KHOẢN CHỦ TRỌ CHƯA DUYỆT</h3></center>

    <div class="body-duyettk">

        <c:forEach items="${tkChuaDuyet}" var="t" >
            <c:if test="${t.kiemDuyet == 'KIEM_DUYET_1'}">
                <c:if test="${t.idLoaiTaiKhoan.id==2}">

                    <c:url value="/thtin_taiKhoan" var="taiKhoanAction">
                        <c:param name="taiKhoanId" value="${t.id}" />  
                    </c:url>
                    <div class="item-tkchuaduyet">
                        <a href="${taiKhoanAction}" class="bt-docthem" style="text-decoration: none;">
                            <div class="tkchuaduyet-anh">
                                <img src="${t.avatar}"/>
                            </div>
                            <div class="tkchauduyet-thtin">
                                <center>
                                    <h5 style="color:black" href="${taiKhoanAction}">CHỦ TRỌ</h5>
                                    <p style="color: #005555; font-size: 17px">${t.tenNguoiDung}</p>


                                </center>
                            </div>
                        </a>
                    </div>
                </c:if>
            </c:if>
        </c:forEach>


    </div>

</html>