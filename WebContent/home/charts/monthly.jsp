<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat Monthly Total</title>
<link href="../css/chart.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- body container -->
<div id="toolbar2" style="margin-bottom:10px; margin-right:5px; float:right;">
			<div class="form-inline" role="form">
			<div class="form-group">
				<button id="btnGraphYearPrev" class="btn btn-default">
        			<i class="glyphicon glyphicon-chevron-left"></i> Prev
        		</button>
				
				<input type="text" class="form-control" name="txtGraphYear" id="txtGraphYear" value="2018" size=4 style="text-align:center" readonly>
				
				<button id="btnGraphYearNext" class="btn btn-default">
        			Next <i class="glyphicon glyphicon-chevron-right"></i>
        		</button>
			</div>
		</div>
</div>
<div class="chart-container" style="clear:both;">
    <canvas id="myChart"></canvas>
</div>
<!-- end body container -->
<!-- Start script -->
<script type="text/javascript">
$(document).ready(function(){
	var myChart;
	var graphdata;
	var graphoptions;
	
	var postdata = {
		rtype:1,
		tablename:"view_interviewer",
		wherecolumn:"interview_year",
		wherevalue: $("#txtGraphYear").val()
	}
	
	//Get graph data and also draw graph
	getGraphData();
	
	$("#btnGraphYearNext").click(function(e){		
		if( +$("#txtGraphYear").val()+1 > "2019" ){
			return;
		}else{
			$("#txtGraphYear").val( +$("#txtGraphYear").val()+1 )
		}
		//Refresh graph
		postdata.wherevalue = $("#txtGraphYear").val();
		updateGraph(postdata);
	})
	$("#btnGraphYearPrev").click(function(){
		
		if( +$("#txtGraphYear").val() - 1 < 2017 ){
			return;
		}else{
			$("#txtGraphYear").val(+$("#txtGraphYear").val() - 1)
		}
		//Refresh graph
		postdata.wherevalue = $("#txtGraphYear").val();
		updateGraph(postdata);
	})
	function getGraphData(){
		$.ajax({
			url:"../GetChartData",
			method:"post",
			data:postdata,
			dataType:"json",
			success: function(data){
				drawGraph(data)
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		})
	}
	function updateGraph(postdata){
		$.ajax({
			url:"../GetChartData",
			method:"post",
			data:postdata,
			dataType:"json",
			success: function(rdata){
				graphdata = {
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
				myChart.config.data = graphdata;
				myChart.update()
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		})
	}
	function drawGraph(rdata){
		var ctx = document.getElementById("myChart").getContext("2d");	
		graphdata = {
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
		graphoptions = {
				  maintainAspectRatio: false,
				  legend: {position:'top',display:false},
				  title: {
					display:false,
					text:'VA Submission Summary '+ $("#txtGraphYear").val()
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
		myChart = new Chart(ctx, {
			  type: 'bar',
			  options: graphoptions,
			  data: graphdata
		});
	}	
	
})
</script>
</body>
</html>