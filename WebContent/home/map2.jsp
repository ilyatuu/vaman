<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Map</title>
</head>
<body>
<div id="map" style="width:800px;height:600px;background:yellow"></div>
<script>
function initMap() {
  var mapCanvas = document.getElementById("map");
  var location = new google.maps.LatLng(-5.5, 35)
  var mapOptions = {
    center: location, 
    zoom: 6,
    mapTypeId: 'terrain',
    styles:[{
    	featureType: "all",
    	elementType: "labels",
    	stylers:[{
    		visibility:"off"
    	}]
    }]
  };
  var map = new google.maps.Map(mapCanvas, mapOptions);
  
  var markerImage = '../images/sort_desc.png';

  var marker = new google.maps.Marker({
      position: location,
      map: map,
      icon: markerImage
  });
  
  //Draw popup
  var contentString = '<div class="info-window">' +
  '<h3>Info Window Content</h3>' +
  '<div class="info-content">' +
  '<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>' +
  '</div>' +
  '</div>';
  
  var infowindow = new google.maps.InfoWindow({
      content: contentString,
      maxWidth: 400
  });
  
  marker.addListener('click', function () {
      infowindow.open(map, marker);
  });
  
  google.maps.event.addDomListener(window, 'load', initMap);
  
  //Draw Location circles
  var deathLocs ={
	loc1:{
		center:{lat: -6.8333303, lng: 37.6525151},
		population:100000
	},
	loc2:{
		center:{lat: -7.3663408, lng: 39.0650173},
		population:100000
	}
  };
  
  for (var loc in deathLocs){
	  var locCircle = new google.maps.Circle({
		  strokeColor: '#FF0000',
		  strokeOpacity: 0.8,
		  strokeWeight: 2,
		  fillColor: '#FF0000',
		  fillOpacity: 0.35,
		  map: map,
		  center: deathLocs[loc].center,
		  radius: Math.sqrt(deathLocs[loc].population) * 100
	  })
  }
}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfmiPr-m_nk6YJUho8UPMuD-rROnl7qh8&callback=initMap"
  type="text/javascript"></script>
</body>
</html>