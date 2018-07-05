<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Record</title>
<%@ page import="iact.dev.Settings" %>
</head>
<body>
<!-- first row -->
<div class="row">
	<div class="col-sm-6">
		<div class="panel panel-default">
		<div class="panel-heading"><h6 class="panel-title"><i class="fa fa-list-ul"></i>List of interviewer <small>(along with total number of VA submission)</small></h6></div>
		<div class="panel-body">
			<div class="row" style="margin-top:-1em; padding:0 5px;">
				<table id="tblInterviewer" data-row-style="rowStyle" ></table>
			</div>
		</div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="panel panel-default">
		<div class="panel-heading"><h6 class="panel-title"><i class="fa fa-bar-chart"></i>Total VA submission <small>(Select specific interviewer on the left for individual details)</small></h6></div>
		<div class="panel-body">
			<div class="toolbar" style="margin-top:-0.6em;">
				<div class="form-inline" role="form">
				<div class="form-group">
					<button class="btn btn-default btn-nxt-year">
	        			<i class="glyphicon glyphicon-chevron-left"></i> Prev
	        		</button>
					<input type="text" class="form-control" name="txtGraphYear" id="txtGraphYear" value="2018" size=4 style="text-align:center" readonly>
					<button class="btn btn-default btn-nxt-year">
	        			Next <i class="glyphicon glyphicon-chevron-right"></i>
	        		</button>
				</div>
					<input type="hidden" id="interviewer_name" value="">
				</div>
			</div>
			<div class="row" style="margin-top:3em; padding:0 5px;">
				<div class="chart-container" style="min-height: 250px;clear:both;">
		    		<canvas id="myChart"></canvas>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
<!-- end first row -->
<!-- second row -->
<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading"><h6 class="panel-title"><i class="fa fa-pencil-square-o"></i>Merge &amp; Update interviewer names to match similar records</h6></div>
<div class="panel-body">
<div class="row">
	<div class="col-sm-4">
		<div class="row" style="margin-top:-1em; padding:0 5px;">
			<table id="tblInterviewer2" data-row-style="rowStyle" ></table>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="row" style="margin-top:-1em; padding:0 5px;">
			<table id="tblInterviewer3" data-row-style="rowStyle" ></table>
		</div>
	</div>
	<div class="col-sm-4">
		<form class="form-inline" role="form">
			<h5>Merge &amp; update duplicate interviewer name</h5>
			<h6>Remove name duplicate records. Use table A as your source. Select name or names from table A and match to new name in table B</h6>
			<div class="input-group">
				<button id="btnUpdate1" class="btn btn-default">Update selected</button>
				<h6 id="errorText1" class="text-warning">&nbsp;</h6>
			</div>
			<div style="display:block;padding-top:5px;">
				<h5>OR provide name below to match</h5>
			</div>
			<div class="input-group">
				<input type="text" class="form-control" id="txtUpdateName">
			</div>
			<div class="input-group">
				<button id="btnUpdate2" class="btn btn-default">Update selected</button>
				<h6 id="errorText2" class="text-warning">&nbsp;</h6>
			</div>
		</form>
	</div>
</div>
</div>
</div>
</div>
</div>
<!-- end second row -->
<script type="text/javascript">
$(document).ready(function(){

	
	var interviewers_name_table = <%=Settings.interviewers_name_table%>;
	var interviewers_name_column = <%=Settings.interviewers_name_column%>;
	var interviewers_phone_column = <%=Settings.interviewers_phone_column%>;
	
	
	//Chart area
	var myChart;
	var graphdata;
	var graphoptions;
	var ctx = document.getElementById("myChart").getContext("2d");
	
	//Table data
	$table2 = $("#tblInterviewer2");
	$table3 = $("#tblInterviewer3");
	
	initSummar();
	initChart()
	
	
	//On check event
	$("#tblInterviewer").on('check.bs.table', function(e, row, $element){
		$("#interviewer_name").val( row['interviewer_name'] );
		updateChart();
	})
	
	//On uncheck
	$("#tblInterviewer").on('uncheck.bs.table', function(e, row, $element){
		$("#interviewer_name").val( "" )
		updateChart();
	})
	
	$(".btn-nxt-year").click(function(e){
		switch( parseInt($("#txtGraphYear").val()) ){
			case 2017:
				$("#txtGraphYear").val("2018");
				break;
			case 2018:
				$("#txtGraphYear").val("2017");
				break;
		}
		//Refresh graph
		//Check if there is any selection
		if( $("#tblInterviewer").bootstrapTable('getSelections').length < 1)
			$("#interviewer_name").val( "" );
		updateChart();
		
	})
	
	$("#btnUpdate1").click(function(e){
		e.preventDefault();
		$("#errorText1").html( "&nbsp;" );
		
		if( $table2.bootstrapTable('getSelections').length < 1){
			$("#errorText1").text("Error: No source record selected");
			return;
		}
		
		if( $table3.bootstrapTable('getSelections').length < 1){
			$("#errorText1").text("Error: No destination name selected");
			return;
		}
		
		//Collect data
		var oldvalue = [];
		$.each($table2.bootstrapTable('getSelections'), function(i,v){
			oldvalue.push(v.interviewer_name);
		})
		
		var updatedata = {
			rtype:31,
			dataarray:oldvalue,
			newvalue:$table3.bootstrapTable('getSelections')[0].interviewer_name,
			tablename:interviewers_name_table,
			colname:interviewers_name_column
		};
		
		updateInterviewerNameOnVA(updatedata);
	});
	
	$("#btnUpdate2").click(function(e){
		e.preventDefault();
		$("#errorText2").html( "&nbsp;" );
		if( $table2.bootstrapTable('getSelections').length < 1){
			$("#errorText2").text("Error: No source record selected");
			return;
		}
		if( $("#txtUpdateName").val()=="" ){
			$("#errorText2").text("Please provide new interviewer name to be applied");
			$("#txtUpdateName").focus();
			return;
		}
		
		//Collect data
		var oldvalue = [];
		$.each($table2.bootstrapTable('getSelections'), function(i,v){
			oldvalue.push(v.interviewer_name);
		})
		
		var updatedata = {
			rtype:31,
			dataarray:oldvalue,
			newvalue:$("#txtUpdateName").val(),
			tablename:interviewers_name_table,
			colname:interviewers_name_column
		};
		
		updateInterviewerNameOnVA(updatedata);
		
	});
	
	function initChart(){
		var postdata = {
				rtype:1,
				wherecolumn:"interview_year",
				wherevalue:$("#txtGraphYear").val(),
				tablename: "view_interviewer"
		};
		$.ajax({
			url:"../GetChartData",
			method:"post",
			data:postdata,
			dataType:"json",
			success: function(data){
				graphdata = {
						labels: data.labels,
						datasets: [{
							    label: data.dataset.name,
							    backgroundColor: "rgba(255,99,132,0.2)",
							    borderColor: "rgba(255,99,132,1)",
							    borderWidth: 2,
							    hoverBackgroundColor: "rgba(255,99,132,0.4)",
							    hoverBorderColor: "rgba(255,99,132,1)",
							    data: data.dataset.data
							  }]
				},
				graphoptions = {
						responsive: true,
						maintainAspectRatio: true,
						legend: {	position:'top', display:false	},
						title: {
							display:true,
							text:'VA Total Submission '
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
							 	gridLines: { display: false },
							 	ticks:{ minRotation: 90 }
							    }]
						}
				},
				myChart = new Chart(ctx, {
					  type: 'bar',
					  options: graphoptions,
					  data: graphdata
				});
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		});
	}
	function initSummar(){
		var postdata = {
				rtype:101,
				tablename:interviewers_name_table,
				colname:interviewers_name_column,
				groupby:interviewers_name_column
		};
		$.ajax({
			url:"../GetBootTable",
			method:"post",
			data:postdata,
			dataType:"json",
			success: function(data){
				drawTable1(data);
				drawTable2(data);
				drawTable3(data);
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		})
	}
	function updateChart(){
		var postdata = {
				rtype:1,
				wherecolumn:"interviewer_name",
				wherevalue:$("#interviewer_name").val(),
				filtercolumn:"interview_year",
				filtervalue:$("#txtGraphYear").val(),
				tablename: "view_interviewer"
		};
		
		$.ajax({
			url:"../GetChartData",
			method:"post",
			data:postdata,
			dataType:"json",
			success: function(data){
				graphdata = {
						labels: data.labels,
						datasets: [{
							    label: data.dataset.name,
							    backgroundColor: "rgba(255,99,132,0.2)",
							    borderColor: "rgba(255,99,132,1)",
							    borderWidth: 2,
							    hoverBackgroundColor: "rgba(255,99,132,0.4)",
							    hoverBorderColor: "rgba(255,99,132,1)",
							    data: data.dataset.data
							  }]
				};
				myChart.config.data = graphdata;
				myChart.update();
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		});
	}
	function updateInterviewerNameOnVA(postdata){
		$.ajax({
			url:"../VAMethods",
			method:"post",
			data:postdata,
			dataType:"json",
			success: function(data){
				if(data)
					alert("Record updated successful. Refresh page");
				else
					alert("Something went wrong. Report this to system administrator: Update function");
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		});
	}
	function drawTable1(data){
		$("#tblInterviewer").bootstrapTable({
			data:data.rows,
			height:330,
			singleSelect: true,
			clickToSelect:true,
			search: true,
			columns: [{
				checkbox:true
			},{
			   	field: 'interviewer_name',
		    	title: 'Interviewer Name',
		    	sortable: true
		    },{
			   	field: 'total_va',
		    	title: 'Total VA',
		    	align:'right',
		    	sortable: true
		    }]
		});
	}
	function drawTable2(data){
		$table2.bootstrapTable({
			data:$.extend(true, [], data.rows),
			height:330,
			singleSelect: false,
			clickToSelect:true,
			search: true,
			columns: [{
				checkbox:true
			},{
			   	field: 'interviewer_name',
		    	title: 'Interviewer Name (Table A)',
		    	sortable: true
		    }]
		});
	}
	function drawTable3(data){
		$table3.bootstrapTable({
			data:$.extend(true, [], data.rows),
			height:330,
			singleSelect: true,
			clickToSelect:true,
			search: true,
			columns: [{
				checkbox:true
			},{
			   	field: 'interviewer_name',
		    	title: 'Interviewer Name (Table B)',
		    	sortable: true
		    }]
		});
	}
	
	
});
</script>
</body>
</html>