<%-- 
    Document   : DangBai
    Created on : Aug 6, 2023, 8:58:16 PM
    Author     : ThanhThuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<html>
    <center><h3 style="margin: 20px 0; color: orange;">ĐĂNG BÀI VIẾT</h3></center>

    <section class="body-dangbai">

        <c:if test="${not empty errMsg}">
            <div class="error-message">
                ${errMsg}
            </div>
        </c:if>
        <c:url value="/dangbai" var="action"/>
        <c:if test="${not empty errors}">
            <div class="alert alert-danger">
                <ul>
                    <c:forEach items="${errors}" var="error">
                        <li>${error.defaultMessage}</li>
                        </c:forEach>
                </ul>
            </div>
        </c:if>
        <div class="dangbai">
            <!-- PHẦN ĐĂNG BÀI -->

            <div class="dangbai-col1">
                <div class="catngang">
                    <h5 style="color: white; padding: 10px;">THÔNG TIN CƠ BẢN</h5>
                </div>
                <div style="padding: 10px 20px;">
                    <form:form method="post" action="${action}" var="p" modelAttribute="baiviet" enctype="multipart/form-data" >
                        <%--<form:errors path="*" element="div" cssClass="alert alert-danger" />--%>

                        <div class="dangbai-tincodinh">
                            <c:if test="${nguoidung.idLoaiTaiKhoan.id==2}">
                                <h5 class="text-danger">Danh mục tin đăng: <strong>Tin cho thuê</strong></h5>
                                <form:input type="hidden" path="loaiBaiViet" value="1" readonly="true"  cssClass="form -control"/>
                            </c:if>

                            <c:if test="${nguoidung.idLoaiTaiKhoan.id==3}">
                                <p class="text-danger">Danh mục tin đăng: <strong>Tin tìm trọ</strong></p>
                                <form:input type="hidden" path="loaiBaiViet" value="2" readonly="true"  cssClass="form -control"/>
                            </c:if>
                            <h5 class="text-danger">Người đăng tin:                 
                                <form:input type="text" path="tenNguoiDangBai" value="${pageContext.request.userPrincipal.name}"  readonly="true"  cssClass="form -control"/>
                            </h5>
                        </div>

                        <div class="dangbai-tinnhaplieu">
                            <div class="input-bigsize">
                                <h5>Tiêu đề bài đăng </h5>
                                <form:input type="text" id="tenbv" name="tenbv" path="tenBaiViet" placeholder="Tiêu đề bài đăng"/>
                                <%--<form:errors path="tenBaiViet" element="div" cssClass="text-danger" />--%>
                            </div>

                            <div class="input-bigsize">
                                <h5>Ngày đăng: </h5>
                                <form:input type="text" id="ngaydangbv" name="ngaydangbv" path="ngayDang"  placeholder="${date}" disabled="true"/>
                            </div>

                            <!--BÀI CỦA CHỦ TRỌ-->
                            <c:if test="${nguoidung.idLoaiTaiKhoan.id==2}">
                                <div class="input-smallsize">
                                    <div class="input-smallsize1">                            
                                        <h5>Khu vực(quận/huyện/thành phố) </h5>
                                        <form:input type="text" id="khuvucbv" name="khuvucbv" path="phamViCanTim" placeholder="Nhập khu vực (VD: Gò Vấp)"/>
                                    </div>

                                    <div class="input-smallsize2">
                                        <h5>Giá cho thuê </h5>
                                        <form:input type="text" id="giathuebv" name="giathuebv" path="giaThue" placeholder="Nhập giá cho thuê (VD: 3000000)"  /> 
                                    </div>
                                </div>
                                <div class="input-smallsize">
                                    <div class="input-smallsize1">
                                        <h5>Số lượng người </h5>
                                        <form:input type="text" id="slnguoibv" name="slnguoibv" path="soNguoi" placeholder="Nhập số người (VD: 3)" /> 
                                    </div>

                                    <div class="input-smallsize2">
                                        <h5>Diện tích phòng (m2) </h5>
                                        <form:input type="text" id="dientichbv" name="dientichbv" path="dienTich" placeholder="Nhập diện tích (VD: 30)"/>
                                    </div>

                                </div>


                                <div class="input-bigsize">                            
                                    <h5>Địa chỉ chi tiết: </h5>
                                    <form:input type="text" id="dchibv" name="dchibv" path="diaChiCt"/>
                                </div>

                                <script>
                                    function chooseFile(fileInput) {
                                        if (fileInput.files && fileInput.files[0]) {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                $('#image').attr('src', e.target.result);
                                            }
                                            reader.readAsDataURL(fileInput.files[0]);
                                        }
                                    }

                                </script>
                                <div class="dangbai-anhphongtro">  
                                    <div style="display: flex">
                                        <h5 style="margin-right: 20%" for="file">Hình ảnh phòng trọ: </h5>
                                        <form:input path="file" multiple="multiple" type="file" id="imageFile" name="imageFile" onchange=   "chooseFile(this)" accept="image/jpg, image/jpeg, image/png"/>
                                    </div>
                                    <img src =""  id="image" width="200" height="200"/>

                                </div>
                            </c:if>

                            <!--BÀI CỦA KHÁCH HÀNG-->
                            <c:if test="${nguoidung.idLoaiTaiKhoan.id==3}">
                                <div>                            
                                    <h5>Phạm vi cần tìm: </h5>
                                    <form:input type="text" id="khuvucbv" name="khuvucbv" path="phamViCanTim"/>
                                </div>
                            </c:if>
                            <div class="input-bigsize" style="margin-top: 10px">
                                <h5>Mô tả chi tiết </h5>     
                                <form:textarea type="text" id="motabv" name="motabv"  path="noiDung" placeholder="Mô tả chi tiết"/>

                            </div>
                        </div>    
                        <div class="input-box btn-danger" hidden="true">
                            <form:select class="role" name="role" id="role" path="loaiTrangThai">
                                <c:forEach items="${trangThai_role}" var="c" >
                                    <option value="${c.id}" selected>${c.tenLoaiTrangThai}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <br></br>
                        <div class="form-group" >
                            <center><input style="font-size: 20px; padding: 10px; font-weight: bold" type="submit" value="ĐĂNG BÀI" class="btn custom-button2"/></center>
                        </div>
                    </form:form>
                </div>
            </div>

            <!-- PHẦN HƯỚNG DẪN -->
            <div class="dangbai-col2">
                <div class="catngang">
                    <h5 style="color: white; padding: 10px;">HƯỚNG DẪN</h5>
                </div>
                <div class="huongdandangtin" style="padding: 10px">
                    <ul>
                        <li><strong>Nội dung phải viết bằng tiếng Việt có dấu.</strong></li>
                        <li><strong>Tiêu đề: </strong> tin không dài quá 100 kí tự.</li>
                        <li>Để tin đăng có hiệu quả hơn các bạn cần điền đầy đủ thông tin vào các mục.</li>
                        <li>Để tăng độ tin cậy và tin đăng được nhiều người quan tâm hơn, hãy sửa vị trí tin rao của bạn trên bản đồ
                            bằng cách kéo điểm đỏ tới đúng vị trí của tin rao.
                        </li>
                        <li>Tin đăng phải có ít nhất một hình ảnh rõ ràng.
                        </li>
                    </ul>
                </div>
            </div>
        </div>



    </section>


</html>
<script>
    document.querySelector("form").addEventListener("submit", function (e) {
        const fileInput = document.getElementById("imageFile");

        if (fileInput.files.length === 0) {
            e.preventDefault(); // Ngăn chặn gửi yêu cầu nếu không có tệp nào được chọn
            alert("Vui lòng chọn một tệp hình ảnh.");
        }
    });
</script>