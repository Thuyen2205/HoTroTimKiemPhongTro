<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/bando_map" var="action"/>


<title>Hien thi Ban Do</title>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-M500zF9hEI3OoOPyK_dVHfWDyZcx5fI&libraries=geometry&callback=initMap" async defer></script>

<div id="map" style="width: 100%; height: 1000px;"></div>

<div class="center-form">
    <form method="post" action="${action}">
        <button class="btn btn-danger" id="submitButton" type="submit">Tìm tro xung quanh</button>
        <input type="hidden" name="diaChiList" id="diaChiListField">
    </form>
</div>
<c:url value="/bando" var="actionUpdate"/>
<form:form action="${actionUpdate}" method="POST" modelAttribute="taikhoan">
    <form:hidden path="id"/>
    <form:hidden path="kiemDuyet"/>
    <form:hidden path="tenTaiKhoan"/>
    <form:input type="text" id="email" name="email" path="email" placeholder="email"/>
    <button class="btn custom-button3" type="sumit">Cập nhật</button>
</form:form>


<div class="bangtin">
    <c:forEach items="${dsBaiViet}" var="b">
        <c:forEach items="${diaChi}" var="c">
            <c:if  test="${b.diaChiCt.toString() eq c.toString()}">

                <div class="bviet">
                    <div class="bviet_anh">
                        <c:if test="${b.loaiBaiViet.id==1}">
                            <img src="${b.hinhAnh}"/>
                        </c:if>
                    </div>

                    <div class="bviet_ndung">
                        <table class="table_bv" style="width:100%">
                            <c:url value="/thtin_bviet" var="bvietAction">
                                <c:param name="baivietId" value="${b.id}" />  
                            </c:url>

                            <a  href="${bvietAction}"><h5 class="text-danger">TIN CHO THUÊ</h5>${b.tenBaiViet}</a>
                            <tr>
                                <th>Khu vuc:</th>
                                <td>${b.phamViCanTim}</td>
                            </tr>
                            <tr>
                                <th>Giá thuê:</th>
                                <td>${b.giaThue}/tháng</td>
                            </tr>
                            <tr>
                                <th>Dien tích:</th>
                                <td>${b.dienTich}</td>
                            </tr>
                        </table>
                        <c:url value="/thtin_bviet" var="bvietAction">
                            <c:param name="baivietId" value="${b.id}" />  
                        </c:url>
                        <div class="groupbtn"><a href="${bvietAction}"> Doc thêm</a></div>
                    </div>
                </div>





            </c:if>
        </c:forEach>

    </c:forEach>
</div>



<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
    var diaChiList = [
    <c:forEach items="${dsBaiViet}" var="p">
        "${p.diaChiCt}",
    </c:forEach>
    ];
    var kinhDo = ${nguoidung.kinhDo};
    var viDo = ${nguoidung.viDo};
    var redMarker = 'http://maps.google.com/mapfiles/ms/icons/red-dot.png';
    var greenMarker = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png';
    var yellowMarker = 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png';
    var map;
    var directionsService;
    var directionsDisplay;
    var diaChiLists = [];

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: kinhDo, lng: viDo},
            zoom: 14
        });

        directionsService = new google.maps.DirectionsService();
        directionsDisplay = new google.maps.DirectionsRenderer();

        var geocoder = new google.maps.Geocoder();

        var redMarker = 'http://maps.google.com/mapfiles/ms/icons/red-dot.png';

        var marker = new google.maps.Marker({
            position: {lat: kinhDo, lng: viDo},
            map: map,
            title: 'Vi trí cua ban',
            icon: redMarker
        });
        marker.setAnimation(google.maps.Animation.BOUNCE);

        var infoWindow = new google.maps.InfoWindow({
            content: 'Dây là vi tri cua ban'
        });

        marker.addListener('mouseover', function () {
            infoWindow.open(map, marker);
        });

        marker.addListener('mouseout', function () {
            infoWindow.close(map, marker);
        });

        var circle = new google.maps.Circle({
            strokeColor: '#0000FF',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: 'transparent',
            fillOpacity: 0,
            map: map,
            center: {lat: kinhDo, lng: viDo},
            radius: 1000
        });

        diaChiList.forEach(function (diaChi) {
            geocoder.geocode({'address': diaChi}, function (results, status) {

                if (status === 'OK') {
                    var toaDo = results[0].geometry.location;

                    var khoangCach = google.maps.geometry.spherical.computeDistanceBetween(circle.getCenter(), toaDo);

                    if (khoangCach <= circle.getRadius()) {
                        var marker = new google.maps.Marker({
                            position: toaDo,
                            map: map,
                            title: diaChi,
                            icon: redMarker
                        });

                        marker.addListener('click', function () {
                            var infoWindow = new google.maps.InfoWindow({
                                content: diaChi
                            });
                            infoWindow.open(map, marker);
                            calculateAndDisplayRoute(toaDo);
                        });
                        console.log("Gia tri cua diaChi: " + diaChi);

                        diaChiLists.push(diaChi);

                        $("#submitButton").click(function (e) {
                            var diaChiListJSON = JSON.stringify(diaChiLists);

                            var diaChiListField = document.getElementById("diaChiListField");
                            diaChiListField.value = diaChiListJSON;
                            console.log(diaChiListJSON);
                        });

                    } else {
                        var marker = new google.maps.Marker({
                            position: toaDo,
                            map: map,
                            title: diaChi,
                            icon: yellowMarker
                        });
                        marker.addListener('click', function () {
                            var infoWindow = new google.maps.InfoWindow({
                                content: diaChi
                            });
                            infoWindow.open(map, marker);
                            calculateAndDisplayRoute(toaDo);
                        });
                    }



                }
            });
        });
    }


</script>


