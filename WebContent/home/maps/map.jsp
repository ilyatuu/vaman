<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Map</title>
</head>
<body>
<div id="map-canvas" style="width:100%;height:600px;background:grey"></div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3_DTfoa67pA6kh6Azrzkc1l2PfPNzZl0"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
	var markerImage = "../../images/sort_asc.png";
	var iringa = new google.maps.LatLng(-7.8, 36)
    var returnGoogleLatLng = function(point) {
        return new google.maps.LatLng(
          point.latitude,
          point.longitude
        );
    };
    
    var icon = {
    	url: "http://maps.google.com/mapfiles/ms/icons/red-dot.png", // url
    	scaledSize: new google.maps.Size(15, 15), // scaled size
    	origin: new google.maps.Point(0,0), // origin
    	anchor: new google.maps.Point(0, 0) // anchor
    };
    
    var drawMarker = function(map, point) {
        var marker = new google.maps.Marker({
          map: map,
          position: returnGoogleLatLng(point),
          title: point.id,
          icon:icon
        });
    };
    
    var drawPoints = function(points) {
        var map = new google.maps.Map(document.getElementById('map-canvas'), {
          center: iringa,
          zoom: 8
        });
        for (var i = 0; i < points.length; i++) {
          drawMarker(map, points[i]);
        }
    };
    
    $(document).ready(function() {
    	navigator.geolocation.getCurrentPosition(function() {
    		$.ajax({
    			url:"../../Maps",
    			method:"POST",
    			header:"application/json",
    			data:{
    				rtype:1
    			},success:function(data){
    				drawPoints(data)
    			}
    		});
    	});
    });
	
</script>
</body>
</html>