<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat Monthly Total</title>
<link href="../../css/chart.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- body container -->
<div class="chart-container">
    <canvas id="myChart"></canvas>
</div>
<!-- end body container -->
<!-- Start script -->
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="chart.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var postdata = {
		rtype:1,
		tablename:"view_interviewer",
	}
	//get data
	
	getData();
	
	function getData(){
		$.ajax({
			url:"../../GetChartData",
			method:"post",
			data:postdata,
			dataType:"json",
			success: function(data){
				drawGraph(data);
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		});	
	}
	
	//Graph parameters
	
	function drawGraph(rdata){
		var ctx = document.getElementById("myChart").getContext("2d");	
		var data = {
				  labels: rdata.labels,
				  datasets: [{
				    label: rdata.dataset.name,
				    backgroundColor: "rgba(255,99,132,0.2)",
				    borderColor: "rgba(255,99,132,1)",
				    borderWidth: 2,
				    hoverBackgroundColor: "rgba(255,99,132,0.4)",
				    hoverBorderColor: "rgba(255,99,132,1)",
				    data: rdata.dataset.data
				  }]
		};
		var options = {
				  maintainAspectRatio: false,
				  legend: {position:'top'},
				  title: {
					display:true,
					text:'VA Monthly Submission'
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
	}	
	
})
</script>
</body>
</html>