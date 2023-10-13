<%-- 
    Document   : adminquarter
    Created on : Aug 26, 2023, 1:49:21 PM
    Author     : ThanhThuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" />
<!DOCTYPE html>
<html>

    <div class="thongketheonam">
        <center><h3 style="margin: 20px 0; color: #005555;">THỐNG KẾ SỐ LƯỢNG NGƯỜI DÙNG THEO QUÝ</h3>

            <form action="${pageContext.request.contextPath}/adminquarter" method="post">

                <div style="display: flex; justify-content: center" >
                    <div style="margin-right: 30px; font-size: 17px">
                        <label for="year">Chọn năm:</label>
                        <select  style="padding: 6px" id="year" name="year" class="year-select">
                            <c:forEach var="year" begin="2020" end="2030">
                                <option value="${year}">${year}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="margin-right: 30px; font-size: 17px">
                        <label for="quarter">Chọn quý:</label>
                        <select style="padding: 6px" id="quarter" name="quarter" class="year-select">
                            <option value="1">Quý 1</option>
                            <option value="2">Quý 2</option>
                            <option value="3">Quý 3</option>
                            <option value="4">Quý 4</option>
                        </select>
                    </div>
                </div>
                <button style="margin-top: 15px" type="submit" class="btn btn-danger custom-button">Thực hiện thống kê</button>
                <br>
                <div class="ketquathongkenam">
                    <h4 style="margin-top: 10px">Kết quả thống kê:</h4>
                    <c:if test="${countChuTro==0}">
                        <input class="custom-input2" value="Không có dữ liệu" readonly="true"/>
                    </c:if>
                    <c:if test="${countChuTro!=0}">
                        <input class="custom-input2" value="Số lượng chủ trọ: ${countChuTro}" readonly="true"/>
                    </c:if>
                    <c:if test="${countKhachHang==0}">
                        <input  class="custom-input2" value="Không có dữ liệu" readonly="true"/>
                    </c:if>
                    <c:if test="${countKhachHang!=0}">
                        <input  class="custom-input2" value="Số lượng khách hàng: ${countKhachHang}" readonly="true"/>
                    </c:if>
                </div>

            </form>
        </center>
    </div>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        var khachHangCount = ${countKhachHang};
        var chuTroCount = ${countChuTro};
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Loại', 'Số lượng'],
                ['Khách hàng', khachHangCount],
                ['Chủ trọ', chuTroCount]
            ]);

            var options = {
                chart: {
                    title: 'Thống kê số lượng',
                    subtitle: 'Số lượng khách hàng và chủ trọ'
                },
                bars: 'vertical'
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));


            chart.draw(data, options);
        }
    </script>

    <center><div id="chart_div" style="width: 60%; height: 350px; margin: 10px; border: 1px solid gray; border-radius: 8px"></div></center>
    <div class="tablethongke">

        <table class="table">

            <thead>
                <tr>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Tên người dùng</th>
                    <th scope="col">Email</th>
                    <th scope="col">Avatar</th>
                    <th scope="col">Ngày tạo tài khoản</th>
                    <th scope="col">Loại tài khoản</th>
                </tr>
                </tr>
            </thead>
            <tbody class="bangtkngdung">
                <c:forEach items="${listNg}" var="p">

                    <tr>
                        <th valign="middle"  scope="row">#${p.id}</th>
                        <td valign="middle">${p.tenNguoiDung}</td>
                        <td valign="middle">${p.email}</td>
                        <td valign="middle"><img src="${p.avatar}" class="rounded-circle" style="width: 50px; height: 50px; border-radius: 25px" alt="${pageContext.request.userPrincipal.name}" /></td>
                        <td valign="middle" >${p.ngayTao}</td>
                        <td valign="middle">${p.idLoaiTaiKhoan.tenLoaiTaiKhoan}</td>
                    </tr>
                </c:forEach>

            </tbody>

        </table>
    </div>

</html>