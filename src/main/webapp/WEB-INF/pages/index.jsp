<%-- 
    Document   : index
    Created on : Jul 25, 2023, 4:05:23 PM
    Author     : ThanhThuyen
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" />

<!DOCTYPE html>
<html>

    <body>

        <c:if test="${pageContext.request.userPrincipal.name != null}">

            <div class="input-timkiem" style="text-align: center">
                <c:url value="/" var="action"/>
                <c:if test="${not empty error}">
                    <p class="error">${error}</p>
                </c:if>
                <form action="${action}" method="GET">
                    <input  class="find custom-input" type="text" name="address" placeholder="Nhập địa chỉ...">
                    <input class="find custom-input" type="text" name="price" placeholder="Nhập giá tiền...">
                    <input class="find custom-input" type="text" name="soNguoi" placeholder="Nhập số người...">

                    <button class="find custom-button" type="submit">Tìm kiếm</button>
                </form>

            </div>
        </c:if>

        <div id="viewed-articles-container">

        </div>
    <center>
        <c:if test="${pages > 1}">
            <ul class="pagination mt-1">
                <c:url value="/" var="pageUrl">
                    <c:param name="page" value="0" /> 
                </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">Tất cả</a></li>
                    <c:forEach begin="1" end="${pages}" var="i">
                        <c:url value="/" var="pageAction">
                            <c:param name="page" value="${i}" /> 
                        </c:url>
                    <li class="page-item"><a class="page-link" href="${pageAction}">${i}</a></li>
                    </c:forEach>

            </ul>
        </c:if>
        <h2>Bài viết cho thuê trọ mới nhất</h2>
    </center>


    
  



    <div class="bangtin">

        <c:forEach items="${baiviet}" var="t">
            <c:if test="${t.loaiTrangThai.id==1}">
                <c:if test="${t.loaiBaiViet.id==1}">
                    <div class="bviet">
                        <div class="bviet_anh">
                            <c:if test="${t.loaiBaiViet.id==1}">
                                <img src="${t.hinhAnh}"/>
                            </c:if>
                        </div>
                        <div class="bviet_ndung">
                            <table class="table_bv" style="width:100%">
                                <c:url value="/thtin_bviet" var="bvietAction">
                                    <c:param name="baivietId" value="${t.id}" />  
                                </c:url>

                                <a  href="${bvietAction}"><h5 class="text-danger">TIN CHO THUÊ</h5>${t.tenBaiViet}</a>

                                <tr>
                                    <th>Khu vực:</th>
                                    <td>${t.phamViCanTim}</td>
                                </tr>
                                <tr>
                                    <th>Giá thuê:</th>
                                    <td>${t.giaThue}/tháng</td>
                                </tr>
                                <tr>
                                    <th>Diện tích:</th>
                                    <td>${t.dienTich}</td>
                                </tr>
                            </table>
                            <c:url value="/thtin_bviet" var="bvietAction">
                                <c:param name="baivietId" value="${t.id}" />  
                            </c:url>
                            <div class="groupbtn"><a href="${bvietAction}"> Đọc thêm</a></div>

                        </div>
                    </div>
                </c:if>
            </c:if>
        </c:forEach>


    </div>

    <center>
        <h2>Bài viết tìm trọ mới nhất</h2>
    </center>

    <div class="bangtin">

        <c:forEach items="${baiviet}" var="t">
            <c:if test="${t.loaiTrangThai.id==1}">
                <c:if test="${t.loaiBaiViet.id==2}">
                    <div class="bviet">
                        <div class="bviet_anh">
                            <img src="https://res.cloudinary.com/dpp5kyfae/image/upload/v1694280790/timtro2_k6dbqd.jpg"/>
                        </div>
                        <div class="bviet_ndung">
                            <table class="table_bv" style="width:100%">
                                <c:url value="/thtin_bviet" var="bvietAction">
                                    <c:param name="baivietId" value="${t.id}" />  
                                </c:url>
                                <a  href="${bvietAction}"><h5 class="text-danger">Tin Tìm Trọ</h5>${t.tenBaiViet}</a>

                                <tr>
                                    <th>Khu vực:</th>
                                    <td>${t.phamViCanTim}</td>
                                </tr>
                                <tr>
                                    <th>Giá thuê:</th>
                                    <td>${t.giaThue}/tháng</td>
                                </tr>
                                <tr>
                                    <th>Diện tích:</th>
                                    <td>${t.dienTich}</td>
                                </tr>

                            </table>
                            <c:url value="/thtin_bviet" var="bvietAction">
                                <c:param name="baivietId" value="${t.id}" />  
                            </c:url>
                            <div class="groupbtn"><a href="${bvietAction}"> Đọc thêm</a></div>

                        </div>
                    </div>
                </c:if>
            </c:if>
        </c:forEach>

    </div>






    <button id="goToTopBtn" class="go-to-top-button" onclick="scrollToTop()">
        <i class="fa-solid fa-up-long">

        </i></button>

</body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

        function saveViewedArticle(baivietId) {
            // Lấy danh sách bài viết đã xem từ Local Storage (nếu có)
            let viewedArticles = JSON.parse(localStorage.getItem('viewedArticles')) || [];

            // Kiểm tra xem bài viết đã tồn tại trong danh sách đã xem chưa
            if (!viewedArticles.includes(baivietId)) {
                // Nếu chưa tồn tại, thêm ID vào danh sách đã xem
                viewedArticles.push(baivietId);
                // Lưu danh sách mới vào Local Storage
                localStorage.setItem('viewedArticles', JSON.stringify(viewedArticles));
            }
        }

</script>
<script>
    // Hàm để hiển thị danh sách bài viết đã xem
    function displayViewedArticles() {
        let viewedArticles = JSON.parse(localStorage.getItem('viewedArticles')) || [];
        let viewedArticlesContainer = document.getElementById('viewed-articles-container');

        // Duyệt qua danh sách bài viết đã xem và hiển thị chúng
        viewedArticles.forEach(function (baivietId) {
            // Tạo các phần tử HTML cho từng bài viết và thêm vào viewedArticlesContainer
            // Lấy thông tin của bài viết từ server (nếu cần) và hiển thị
        });
    }

// Gọi hàm để hiển thị danh sách bài viết đã xem khi trang được tải
    window.onload = function () {
        displayViewedArticles();
    };

</script>

<script src="<c:url value="/js/main.js"/>"></script>
