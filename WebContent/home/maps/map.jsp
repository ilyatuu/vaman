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
function initMap() {
	  var mapCanvas = document.getElementById("map");
	  var location = new google.maps.LatLng(-6, 35)
	  var mapOptions = {
	    center: location, 
	    zoom: 5,
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
	//Draw Location circles
	  var markerImage = '../images/sort_asc.png';
	  var deathLocs ={
	 	loc1:{
	 		center:{lat: -6.8333303, lng: 37.6525151},
	 		population:100000,
	 		title:'Location1',
	 		text:'Location: Morogoro <br />Total Events 233 <br />Last Event: 9/11/2007'
	 	},
	 	loc2:{
	 		center:{lat: -7.3663408, lng: 39.0650173},
	 		population:200000,
	 		title:'Location2',
	 		text:'Location: Pwani <br />Total Events 209 <br />Last Event: 28/11/2007'
	 	},
	 	loc3:{
	 		center:{lat: -5.2870652, lng: 38.951072},
	 		population:200000,
	 		title:'Location2',
	 		text:'Location: Tanga <br />Total Events 199 <br />Last Event: 3/12/2007'
	 	}
	  };
	  
	  for (var loc in deathLocs){
		  var marker = new google.maps.Marker({
		      position: deathLocs[loc].center,
		      map: map,
		      icon: markerImage,
		      text: deathLocs[loc].text
		  });
		  
		  var infowindow = new google.maps.InfoWindow({
		      content: deathLocs[loc].text,
		      maxWidth: 100
		  });
		  
		  google.maps.event.addListener(marker,'click', function () {
			  //infowindow.open(map, marker);
			  infowindow.setContent(this.text);
			  infowindow.open(map, this);
		  });
	  }
	  google.maps.event.addDomListener(window, 'load', initMap);
	}
</script>
</body>
</html>