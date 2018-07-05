<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VA Charts</title>
<link href="../../css/chart.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- body container -->
<div class="chart-container">
    <canvas id="myChart"></canvas>
</div>
<!-- end body container -->
<!-- Start script -->
<script type="text/javascript" src="chart.min.js"></script>
<script type="text/javascript">
	//https://jsfiddle.net/ta9ogpvj/1/  dynamic change chart type
	var ctx = document.getElementById("myChart").getContext("2d");
	var data = {
			  labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"],
			  datasets: [{
			    label: "Dataset #1",
			    backgroundColor: "rgba(255,99,132,0.2)",
			    borderColor: "rgba(255,99,132,1)",
			    borderWidth: 2,
			    hoverBackgroundColor: "rgba(255,99,132,0.4)",
			    hoverBorderColor: "rgba(255,99,132,1)",
			    data: [65,59,20,81,56,55,40,34,50,66,70,90]
			  },{
				    label: "Dataset #2",
				    backgroundColor: "rgba(150,99,155,0.2)",
				    borderColor: "rgba(205,99,132,1)",
				    borderWidth: 2,
				    hoverBackgroundColor: "rgba(205,99,132,0.4)",
				    hoverBorderColor: "rgba(205,99,132,1)",
				    data: [50,50,10,70,40,40,70,66,44,98,29,79]
			}]
	};
	var options = {
			  maintainAspectRatio: false,
			  legend: {position:'top'},
			  title: {
				display:true,
				text:'Chart title goes here'
			  },
			  scales: {
			    yAxes: [{
			      //stacked: true,
			      ticks: { beginAtZero: true },
			      gridLines: {
			        display: true,
			        color: "rgba(255,99,132,0.2)"
			      }
			    }],
			    xAxes: [{
			      gridLines: {
			        display: false
			      }
			    }]
			  }
	};
	var myChart = new Chart(ctx, {
		  type: 'bar',
		  options: options,
		  data: data
	});
</script>
</body>
</html>