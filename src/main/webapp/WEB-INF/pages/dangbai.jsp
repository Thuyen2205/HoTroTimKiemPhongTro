<%-- 
    Document   : DangBai
    Created on : Aug 6, 2023, 8:58:16 PM
    Author     : ThanhThuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<html>
    <h1 class="text-center text-danger">Đăng bài </h1>
    <c:url value="/dangbai" var="action"/>
    <div>

        <form:form method="post" action="${action}" var="p" modelAttribute="baiviet" enctype="multipart/form-data" >




            <div>
                <label for="file">Người Đăng Bài:  </label>
                <form:input type="text" id="file" path="tenNguoiDangBai" value="${pageContext.request.userPrincipal.name}"  readonly="true"  cssClass="form -control"/>

                <br></br>
            </div>
            <c:if test="${nguoidung.idLoaiTaiKhoan.id==2}">
                <div>
                    <label for="file">Ảnh nhà trọ: </label>
                    <br></br>
                    <form:input type="file" id="file" path="file" cssClass="form -control"/>
                </div>    
                <div>
                    <label for="file">Gia thue</label>
                    <br></br>
                    <form:input type="text"  path="giaThue" cssClass="form -control"/>
                </div>

                <div>
                    <label for="file">So nguoi</label>
                    <br></br>
                    <form:input type="text"  path="soNguoi" cssClass="form -control"/>
                </div>
                <div>
                <label for="file">Dien Tich</label>
                <br></br>
                <form:input type="text"  path="dienTich" cssClass="form -control"/>
            </div>

            <div>
                <label for="file">Dia Chi Chi Tiet</label>
                <br></br>
                <form:input type="text"  path="diaChiCt" cssClass="form -control"/>
            </div>




            </c:if>
            <c:if test="${nguoidung.idLoaiTaiKhoan.id==3}">
                <div>
                    <label for="file">Pham vi can tim</label>
                    <br></br>
                    <form:input type="text"  path="phamViCanTim" cssClass="form -control"/>
                </div>


            </c:if>

            <div>
                <label for="file">Tên bài viết </label>
                <br></br>
                <form:input type="text"  path="tenBaiViet" cssClass="form -control" />
            </div>

            <br></br>

            <div>
                <label for="file">Noi dung</label>
                <br></br>
                <form:input type="text"  path="noiDung" cssClass="form -control"/>
            </div>





            
            <br></br>
            <div >
                <%--<form:select class="role" name="role" id="role" path="loaiBaiViet">--%>
                <%--<c:forEach items="${baiviet_role}" var="c" >--%>
                    <!--<option value="${c.id}" selected>${c.tenLoaiBaiViet}</option>-->
                <%--</c:forEach>--%>
                <%--</form:select>--%>
            </div>

            <c:if test="${nguoidung.idLoaiTaiKhoan.id==2}">
                <div>

                    Tin cho thue
                    <form:input type="text" id="file" path="loaiBaiViet" value="1" readonly="true"  cssClass="form -control"/>

                </div>    

            </c:if>
            <c:if test="${nguoidung.idLoaiTaiKhoan.id==3}">
                <div>
                    Tin tìm tro
                    <form:input type="text" id="file" path="loaiBaiViet" value="2" readonly="true"  cssClass="form -control"/>

                </div>    

            </c:if>

            <br></br>
            <div class="form-group">
                <input type="submit" value="Them Bai Viet" class="btn btn-danger"/>
            </div>
        </form:form>
    </div>

</html>
