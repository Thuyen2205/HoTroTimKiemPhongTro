<%-- 
    Document   : thtin_bviet
    Created on : Aug 12, 2023, 2:34:35 PM
    Author     : Admins
--%>


<%@page import="com.ntt.pojo.BaiViet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data.min.js"></script>-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-M500zF9hEI3OoOPyK_dVHfWDyZcx5fI&libraries=geometry&callback=initMap" async defer></script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" />


<c:url value="/thtin_bviet_bl" var="action">
    <c:param name="baivietId" value="${BaiViet.id}" />  
</c:url>
<c:url value="/thtin_bviet_fl" var="actionfl">
    <c:param name="baivietId" value="${BaiViet.id}" />  
</c:url>
<c:url value="/thtin_bviet_lt" var="actionlt">
    <c:param name="baivietId" value="${BaiViet.id}" />  
</c:url>
<c:url value="/thtin_bviet_tt" var="actionTrangThai">
    <c:param name="baivietId" value="${BaiViet.id}" />  
</c:url>
<c:url value="/thtin_bviet_tuchoi" var="actionTrangThaiTuChoi">
    <c:param name="baivietId" value="${BaiViet.id}" />  
</c:url>
<c:url value="/tao_binhluan" var="actionTao">
    <c:param name="baivietId" value="${BaiViet.id}" />  
</c:url>


<div style="display: flex; justify-content: start; margin-top:  20px; margin-left: 90px" >
    <c:if test="${BaiViet.loaiTrangThai.id==2}">
        <c:if test="${nguoidung.idLoaiTaiKhoan.id==1}">
            <div style="margin-right: 30px">
                <form:form method="post" action="${actionTrangThai}">
                    <button style="padding: 15px; width: 100%; margin-right: 20%; font-size: 18px;" class="btn btn-danger" type="submit">XÁC NHẬN BÀI VIẾT</button>
                </form:form>
            </div>
            <div>
                <form:form method="post" action="${actionTrangThaiTuChoi}">
                    <button style="padding: 15px; width: 100%; margin-right: 20%; font-size: 18px;" class="btn btn-danger" type="submit">TỪ CHỐI BÀI VIẾT</button>
                </form:form>    
            </div>
        </c:if>
    </c:if>
</div>



<section class="chitiettin" >
    <div class="chitiettin-col1">
        <div class="ct-anh">
            <center>
                <img src="${BaiViet.hinhAnh}"" style="width:100%" > 
            </center>
        </div>
        <div class="ndung-chitiet">

            <c:if test="${BaiViet.loaiBaiViet.id==1}">
                <h5 class="text-danger">TIN CHO THUÊ</h5>            
                <h4 style="color: #005555; font-weight: bold">${BaiViet.tenBaiViet}</h4>
            </c:if>
            <c:if test="${BaiViet.loaiBaiViet.id==2}">
                <h5 class="text-warning">TIN TÌM TRỌ</h5>            
                <h4 style="color: #005555; font-weight: bold">${BaiViet.tenBaiViet}</h4>

            </c:if>
            <c:if test="${BaiViet.loaiBaiViet.id==1}">
                <p>Địa chỉ: ${BaiViet.diaChiCt}</p>
                <div class="chitiet-3tt">
                    <p>Giá: ${BaiViet.giaThue} VNĐ</p>
                    <p>Diện tích: ${BaiViet.dienTich} m2</p>
                    <p>Số người tối đa: ${BaiViet.soNguoi}</p>
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

                </table>
            </div>
        </div>
        <c:if test="${BaiViet.loaiBaiViet.id==1}">
            <div id="map" style="margin: 5px 0px; width: 100%; height: 300px; background-color: wwhite; border: 1px solid black;"></div>
        </c:if>
        <script>
            var diaChiCt = "${BaiViet.diaChiCt}";

            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 10.7769, lng: 106.7009},
                    zoom: 14
                });

                var geocoder = new google.maps.Geocoder();

                geocoder.geocode({'address': diaChiCt}, function (results, status) {
                    if (status === 'OK') {
                        var toaDo = results[0].geometry.location;

                        var marker = new google.maps.Marker({
                            position: toaDo,
                            map: map,
                            title: diaChiCt,
                            icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
                        });

                        marker.addListener('click', function () {
                            var infoWindow = new google.maps.InfoWindow({
                                content: diaChiCt
                            });
                            infoWindow.open(map, marker);
                        });
                        map.setCenter(toaDo);
                    } else {
                        console.log('Không thể tìm thấy tọa độ cho: ' + diaChiCt);
                    }
                });
            }
        </script>

        <div class="ndung-binhluan">
            <c:if test="${BaiViet.loaiTrangThai.id==1}">
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <form:form method="post" action="${action}" var="p" modelAttribute="binhluan" enctype="multipart/form-data" >
                        <form:input type="hidden" id="file" path="tenNguoiDangBai" value="${pageContext.request.userPrincipal.name}"  readonly="true"  cssClass="form -control"/>
                        <form:input type="hidden" id="file" path="idBaiVietBinhLuan" value="${BaiViet.id}"  readonly="true"  cssClass="form -control"/>
                        <form:input type="text" path="noiDung"/>
                        <input type="submit" value="Bình Luận" class="btn btn-danger" disabled/>
                    </form:form>
                </c:if>

                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <form:form method="post" action="${action}" var="p" modelAttribute="binhluan" enctype="multipart/form-data" >
                        <form:input type="hidden" id="file" path="tenNguoiDangBai" value="${pageContext.request.userPrincipal.name}"  readonly="true"  cssClass="form -control"/>
                        <form:input type="hidden" id="file" path="idBaiVietBinhLuan" value="${BaiViet.id}"  readonly="true"  cssClass="form -control"/>
                        <form:input class="custom-input5" type="text" path="noiDung"/>
                        <input style="padding: 8px " type="submit" value="Bình Luận" class="btn btn-danger"/>
                    </form:form>
                </c:if>
            </c:if>
            <c:forEach items="${binhluans}" var="b">
                <c:if test="${b.hoiDap eq null}">

                    <c:url value="/api/thtin_bvietBinhLuan/${b.id}" var="apiDelete"/>
                    <div class="comtent row">

                        <div class="cmted">
                            <div class="cmted-thtin">
                                <div class="cmted-thtin-avatar">
                                    <center> <img src="${b.idNguoiDung.avatar}" style="width:60px; height: 60px; border-radius: 30px " /></center>
                                    <p class="commentDate">${b.ngayBinhLuan}</p>
                                </div>
                                <div class="cmted-thtin-noidung">
                                    <div class="cmted-thtin-noidungchinh">
                                        <h6>${b.idNguoiDung.tenNguoiDung}(#${b.id})</h6>
                                        <p>${b.noiDung}</p>
                                    </div>
                                </div>
                            </div>


                            <c:if test="${nguoidung.id.toString() eq b.idNguoiDung.id}">
                                <div class="edit-controls">
                                    <button class="btn btn-info text-center edit-button" onclick="enableEditModeUpdate('${b.id}')">Chỉnh sửa</button>
                                    <button class="btn btn-danger text-center" onclick="deleteBinhLuanwpr('${apiDelete}')">Xóa</button>
                                    <form:form id="updateForm_${b.id}" style="display: none;" method="post"  action="${action}" var="p" modelAttribute="binhluan" enctype="multipart/form-data">
                                        <form:hidden path="id" value="${b.id}" />
                                        <form:input class="custom-input" type="text" path="noiDung" value="${b.noiDung}" />
                                        <input type="submit" value="Cập nhật" class="btn btn-success" />
                                    </form:form>

                                </div>
                            </c:if>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <button class="btn btn-primary" onclick="showReplyForm('${b.id}')">Phản hồi</button>

                            </c:if>

                            <form:form id="replyForm_${b.id}" style="display: none;" method="post" action="${action}" var="p" modelAttribute="binhluan" enctype="multipart/form-data" >

                                <form:input  type="hidden" id="file" path="tenNguoiDangBai" value="${pageContext.request.userPrincipal.name}"  readonly="true"  cssClass="form -control"/>
                                <form:input type="hidden" id="file" path="idBaiVietBinhLuan" value="${BaiViet.id}"  readonly="true"  cssClass="form -control"/>
                                <form:input path="hoiDap" type="hidden" value="${b.id}" />
                                <form:input class="custom-input5" type="text" path="noiDung"/>
                                <input  type="submit" value="Gửi phản hồi" class="btn btn-success"/>
                            </form:form>
                            <c:set var="parentId" value="${b.id}" />
                            <c:forEach items="${binhluans}" var="reply">
                                <c:if test="${reply.hoiDap eq parentId}">

                                    <div class="comtent row" style="margin-left: 18%;">
                                        <div class="cmted-thtin2">
                                            <div class="cmted-thtin-avatar2">
                                                <center> <img src="${reply.idNguoiDung.avatar}" style="width:60px; height: 60px; border-radius: 30px " /></center>
                                                <p class="commentDate">${reply.ngayBinhLuan}</p>
                                            </div>
                                            <div class="cmted-thtin-noidung2">
                                                <div class="cmted-thtin-noidungchinh2">
                                                    <h6>${reply.idNguoiDung.tenNguoiDung}</h6>
                                                    <p>${reply.noiDung}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${nguoidung.id.toString() eq reply.idNguoiDung.id}">
                                            <c:url value="/api/thtin_bvietBinhLuan/${reply.id}" var="apiDelete"/>
                                            <div class="edit-controls" style="margin-top: -15px; margin-bottom: 5px">
                                                <button class="btn btn-info text-center edit-button" onclick="enableEditModeUpdate('${reply.id}')">Chỉnh sửa</button>
                                                <button class="btn btn-danger text-center" onclick="deleteBinhLuanwpr('${apiDelete}')">Xóa</button>
                                                <form:form id="updateForm_${reply.id}" style="display: none;" method="post"  action="${action}" var="p" modelAttribute="binhluan" enctype="multipart/form-data">
                                                    <form:hidden path="id" value="${reply.id}" />
                                                    <form:input class="custom-input6" type="text" path="noiDung" value="${reply.noiDung}" />
                                                    <input type="submit" value="Cập nhật" class="btn btn-success" />
                                                </form:form>

                                            </div>
                                        </c:if>
                                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                                            <button class="btn btn-primary" onclick="showReplyForm('${reply.id}')">Phản hồi</button>

                                        </c:if>

                                        <form:form id="replyForm_${reply.id}" style="display: none;" method="post" action="${action}" var="p" modelAttribute="binhluan" enctype="multipart/form-data" >
                                            <form:input  type="hidden" id="file" path="tenNguoiDangBai" value="${pageContext.request.userPrincipal.name}"  readonly="true"  cssClass="form -control"/>
                                            <form:input type="hidden" id="file" path="idBaiVietBinhLuan" value="${BaiViet.id}"  readonly="true"  cssClass="form -control"/>
                                            <form:input path="hoiDap" type="hidden" value="${reply.id}" />
                                            <form:input class="custom-input6" type="text" path="noiDung"/>
                                            <input type="submit" value="Gửi phản hồi" class="btn btn-success"/>
                                        </form:form>
                                        <c:set var="grandparentId" value="${reply.id}" />
                                        <c:forEach items="${binhluans}" var="grandreply">
                                            <c:if test="${grandreply.hoiDap eq grandparentId}">
                                                <div class="comtent row"  margin-left: 60px;">
                                                    <div class="cmted-thtin3">
                                                        <div class="cmted-thtin-avatar">
                                                            <center> <img src="${grandreply.idNguoiDung.avatar}" style="width:60px; height: 60px; border-radius: 30px " /></center>
                                                            <p class="commentDate">${grandreply.ngayBinhLuan}</p>
                                                        </div>
                                                        <div class="cmted-thtin-noidung3">
                                                            <div class="cmted-thtin-noidungchinh2">
                                                                <h6>${grandreply.idNguoiDung.tenNguoiDung}</h6>
                                                                <p>${grandreply.noiDung}</p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <c:url value="/api/thtin_bvietBinhLuan/${grandreply.id}" var="apiDelete"/>

                                                <c:if test="${nguoidung.id.toString() eq grandreply.idNguoiDung.id}">
                                                    <div class="edit-controls">
                                                        <button class="btn btn-info text-center edit-button" onclick="enableEditModeUpdate('${grandreply.id}')">Chỉnh sửa</button>
                                                        <button class="btn btn-danger text-center" onclick="deleteBinhLuanwpr('${apiDelete}')">Xóa</button>
                                                        <form:form id="updateForm_${grandreply.id}" style="display: none;" method="post"  action="${action}" var="p" modelAttribute="binhluan" enctype="multipart/form-data">
                                                            <form:hidden path="id" value="${grandreply.id}" />
                                                            <form:input class="custom-input" type="text" path="noiDung" value="${grandreply.noiDung}" />
                                                            <input type="submit" value="Cập nhật" class="btn btn-success" />
                                                        </form:form>

                                                    </div>
                                                </c:if>
                                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                                    <button class="btn btn-primary" onclick="showReplyForm('${grandreply.id}')">Phản hồi</button>
                                                </c:if>
                                                <form:form id="replyForm_${grandreply.id}" style="display: none;" method="post" action="${action}" var="p" modelAttribute="binhluan" enctype="multipart/form-data" >
                                                    <form:input  type="hidden" id="file" path="tenNguoiDangBai" value="${pageContext.request.userPrincipal.name}"  readonly="true"  cssClass="form -control"/>
                                                    <form:input type="hidden" id="file" path="idBaiVietBinhLuan" value="${BaiViet.id}"  readonly="true"  cssClass="form -control"/>
                                                    <form:input path="hoiDap" type="hidden" value="${grandreply.id}" />
                                                    <form:input class="custom-input6" type="text" path="noiDung"/>
                                                    <input type="submit" value="Gửi phản hồi" class="btn btn-success"/>
                                                </form:form>
                                            </c:if>
                                        </c:forEach>
                                    </div>

                                </c:if> 
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>


    <div class="chitiettin-col2">
        <div class="ct-thtinngdung">
            <center>
                <h5 class="text-danger">TÁC GIẢ BÀI VIẾT</h5>
                <img src="${BaiViet.idNguoiDung.avatar}" class="rounded-circle" alt="${pageContext.request.userPrincipal.name}" />
                <p style="margin-bottom: 5px">${BaiViet.idNguoiDung.tenNguoiDung}</p>
                <p style="margin-bottom: 5px">${BaiViet.idNguoiDung.sdt}</p>
                <c:forEach items="${followlist}" var="list">
                    <c:if test="${list.idChuTro.id.toString() eq BaiViet.idNguoiDung.id.toString()}">
                        <c:url value="/api/thtin_bviet/${list.id}" var="apiDelete"/>
                        <button class="btn btn-danger text-center" onclick="deleteFollowpr('${apiDelete}')">Hủy Follow</button>
                        <button class="btn btn-danger" disabled="">Follow</button>
                    </c:if>
                </c:forEach>

                <form:form method="post" action="${actionfl}" var="p" modelAttribute="follow" >
                    <c:if test="${nguoidung.idLoaiTaiKhoan.id==3}">
                        <c:choose>
                            <c:when test="${empty flChuTro}">
                                <button class="btn btn-danger">Follow</button>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${empty followlist}">
                                        <button class="btn btn-danger">Follow</button>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="shouldShowFollowButton" value="true" />
                                        <c:forEach items="${flChuTro}" var="chuTro">
                                            <c:if test="${shouldShowFollowButton && followlist.contains(chuTro)}">
                                                <c:set var="shouldShowFollowButton" value="false" />
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${shouldShowFollowButton}">
                                            <button class="btn btn-danger">Follow</button>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <form:input type="hidden" id="file" path="tenNguoiDangBai" value="${pageContext.request.userPrincipal.name}"  readonly="true"  cssClass="form -control"/>
                    <form:input type="hidden" id="file" path="idChuBaiViet" value="${BaiViet.idNguoiDung.id}"  readonly="true"   cssClass="form -control"/>
                </form:form>
            </center>
        </div>
        <div class="ct-thtinngdung">
            <center>                
                <h5 class="text-danger">CÁC TIN CỦA TÁC GIẢ</h5>
            </center>
            <div class="tinkhac">
                <c:forEach items="${dsBaiViet}" var="t">
                    <c:if test="${BaiViet.idNguoiDung.id == t.idNguoiDung.id}">
                        <c:if test="${t.loaiTrangThai.id==1}">
                            <c:if test="${BaiViet.id != t.id}">
                                <div class="tinkhac-item" style="display: flex; margin: auto 0">
                                    <c:url value="/thtin_bviet" var="bvietAction">
                                        <c:param name="baivietId" value="${t.id}" />  
                                    </c:url>
                                    <div style="display: flex;">
                                        <i class="fa-brands fa-google-play"></i>
                                        <a style="text-decoration: none; margin-left: 5px" href="${bvietAction}">Tin số: #${t.id} (Khu vực: ${t.phamViCanTim})</a>
                                    </div>

                                </div>
                            </c:if>


                        </c:if>
                    </c:if>

                </c:forEach>
            </div>
        </div>
        <div class="ct-thtinngdung">
            <center>                
                <h5 class="text-danger">CÁC TIN TRỌ CÙNG KHU VỰC</h5>
            </center>
            <div class="tinkhac">
                <c:forEach items="${dsBaiViet}" var="t">
                    <c:if test="${BaiViet.phamViCanTim == t.phamViCanTim}">
                        <c:if test="${t.loaiTrangThai.id==1}">
                            <c:if test="${BaiViet.id != t.id}">
                                <div class="tinkhac-item" style="display: flex; margin: auto 0">
                                    <c:url value="/thtin_bviet" var="bvietAction">
                                        <c:param name="baivietId" value="${t.id}" />  
                                    </c:url>
                                    <div style="display: flex;">
                                        <i class="fa-brands fa-google-play"></i>
                                        <a style="text-decoration: none; margin-left: 5px" href="${bvietAction}">Tin số: #${t.id} (Khu vực: ${t.phamViCanTim})</a>
                                    </div>

                                </div>
                            </c:if>


                        </c:if>
                    </c:if>

                </c:forEach>
            </div>
        </div>

    </div>

    <script>
        moment.tz.setDefault("Asia/Ho_Chi_Minh");

        window.onload = function () {
            let dates = document.getElementsByClassName("commentDate");
            for (let i = 0; i < dates.length; i++) {
                dates[i].innerText = moment(dates[i].innerText).fromNow();
            }
        }
    </script>
    <script>
        var replyButtons = document.querySelectorAll('.reply-button');
        var replyForms = document.querySelectorAll('.reply-form');

        replyButtons.forEach(function (button, index) {
            button.addEventListener('click', function () {

                replyForms.forEach(function (form) {
                    form.style.display = 'none';
                });


                replyForms[index].style.display = 'block';
            });
        });
    </script>

    <script>
        function showReplyForm(commentId) {
            // Tìm form trả lời dựa trên commentId
            var replyForm = document.getElementById("replyForm_" + commentId);

            // Bật/tắt form trả lời
            if (replyForm.style.display === "none" || replyForm.style.display === "") {
                replyForm.style.display = "block";
            } else {
                replyForm.style.display = "none";
            }
        }
    </script>

    <script>
        function enableEditModeUpdate(commentId) {
            // Tìm form trả lời dựa trên commentId
            var replyForm = document.getElementById("updateForm_" + commentId);

            // Bật/tắt form trả lời
            if (replyForm.style.display === "none" || replyForm.style.display === "") {
                replyForm.style.display = "block";
            } else {
                replyForm.style.display = "none";
            }
        }
    </script>



    <script src="<c:url value="/js/main.js"/>"></script>



</section>

