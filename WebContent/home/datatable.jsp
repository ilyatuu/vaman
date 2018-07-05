<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRVS-Tables</title>
	<!-- Bootstrap core CSS -->
	 <link href="../css/datatables.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- page container -->
<div class="page-container container-fluid">
<div class="panel panel-default">
	<div class="panel-heading"><h6 class="panel-title"><i class="icon-table"></i> Datatable with selectable rows</h6></div>
	<div class="custom-toolbar  col-sm-12">
	<div class="form-group">
		<div class="row">
			<div class="input-group" style="float:right;margin-top:1em;margin-right:1em">
				<div class="col-sm-4">
					<select class="form-control" id="searchBy">
					    <option value="searchby" >Search By</option>
					    <option value="region">Region</option>
					    <option value="district">District</option>
					    <option value="ward">Ward/Street</option>
	  				</select>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="searchVal">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-default" id="searchBut">Go</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="datatable-tools">
		<table id="mytable" class="display" style="width:100%">
	        <thead>
	        	<tr><th>URI</th><th>Region</th><th>District</th><th>Village</th><th>Event Name</th><th>Interview Date</th><th>Interviewer Name</th><th>Category</th><th>Link</th></tr>
	        </thead>
	        <tbody></tbody>
        </table>
	</div>
</div>
</div>
<!-- /page container -->
<!-- scripts -->



<script type="text/javascript" src="../js/jquery.min.js"></script>
<!-- 
<script type="text/javascript" src="../js/plugins/interface/datatables.min.js"></script>
 -->

<script type="text/javascript" src="../js/dt/datatables.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	loadData();
	function loadData(){
		$("#mytable").dataTable({
			"processing":true,
			"destroy": true,
			"showColumns":true,
			"serverSide":true,
			"searching": false,
			"lengthChange": false,
			"ajax":{
				"url" : "../GetDataTable",
				"type": "post",
				"data": {
						"tablename": "view_individual_va",
						"searchBy" :$("#searchBy").val(),
						"searchVal":$("#searchVal").val()
					}
			},
			"columns":[
			 	{	data:"_URI"				},
			 	{	data: "death_region"	},
			 	{	data: "death_district"	},
			 	{	data: "death_village"	},
			 	{	data: "deceased_name"	},
			 	{	data: "interview_date"	},
			 	{	data: "interviewer_name"},
			 	{	data: "death_category"	}
			           ],
			"aoColumnDefs":[
				{
					"aTargets":[0],
	                "bVisible":false
				}]
		});
	}
	 
	 
	 $("#searchBut").click(function(){
		 loadData();
	 })
});
</script>
</body>
</html>