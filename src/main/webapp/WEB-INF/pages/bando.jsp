<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Hi?n th? B?n ??</title>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-M500zF9hEI3OoOPyK_dVHfWDyZcx5fI&libraries=geometry&callback=initMap" async defer></script>
        
        <!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-M500zF9hEI3OoOPyK_dVHfWDyZcx5fI&callback=initMap" async defer></script>-->
    </head>
    <body>
        
        <div id="map" style="width: 100%; height: 1000px;"></div>

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
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: kinhDo, lng: viDo},
                    zoom: 14
                });


                var geocoder = new google.maps.Geocoder();

                var redMarker = 'http://maps.google.com/mapfiles/ms/icons/red-dot.png';

                var marker = new google.maps.Marker({
                    position: {lat: kinhDo, lng: viDo},
                    map: map,
                    title: 'V? trí c?a ng??i dùng',
                    icon: redMarker
                });
                marker.setAnimation(google.maps.Animation.BOUNCE);

                var infoWindow = new google.maps.InfoWindow({
                    content: 'Day la vi tri cua ban'
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
                                });
                            }
                        } else {
                            console.log('Không th? tìm th?y t?a ?? cho: ' + diaChi);
                        }
                    });
                });

            }
        </script>
    </body>
</html>
