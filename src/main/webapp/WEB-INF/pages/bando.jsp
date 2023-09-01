<%-- 
    Document   : bando
    Created on : Aug 22, 2023, 2:07:58 AM
    Author     : ThanhThuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
<head>
    <title>Hiển thị Bản đồ</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWTx7bREpM5B6JKdbzOvMW-RRlhkukmVE&callback=initMap" async defer></script>
    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>
</head>
<body>
    
    <div id="map"></div>

    <script>
        var map;
        var DEFAULT_LATITUDE = 10.8231; // Vị trí Thành phố Hồ Chí Minh
        var DEFAULT_LONGITUDE = 106.6297; // Vị trí Thành phố Hồ Chí Minh
        var DEFAULT_ZOOM = 15; // Độ zoom mặc định

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: DEFAULT_LATITUDE, lng: DEFAULT_LONGITUDE},
                zoom: DEFAULT_ZOOM
            });

            var danhSachBaiViet = ${dsBaiViet}; // Danh sách bài viết từ controller
            danhSachBaiViet.forEach(function(baiViet) {
                // Sử dụng Geocoding API để lấy tọa độ từ địa chỉ
                var geocoder = new google.maps.Geocoder();
                geocoder.geocode({ 'address': baiViet.diaChiCt }, function(results, status) {
                    if (status === google.maps.GeocoderStatus.OK) {
                        var marker = new google.maps.Marker({
                            position: results[0].geometry.location,
                            map: map,
                            title: baiViet.tieuDe
                        });
                    }
                });
            });
        }
    </script>
</body>
</html>
