<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tables</title>
<%@ page import="iact.dev.Settings" %>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/brain-theme.css" rel="stylesheet" type="text/css">
<link href="../css/styles.css" rel="stylesheet" type="text/css">
<link href="../css/bootstrap-table-group-by.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="table">
	<div id="toolbar2" style="margin-bottom:10px; margin-right:5px; float:right;">
			<div class="form-inline" role="form">
			<div class="form-group">
				<button id="btnYearPrev" class="btn btn-default">
        			<i class="glyphicon glyphicon-chevron-left"></i> Prev
        		</button>
				
				<input type="text" class="form-control" id="txtYear" value="2017" size=4 style="text-align:center" readonly>
				
				<button id="btnYearNext" class="btn btn-default">
        			Next <i class="glyphicon glyphicon-chevron-right"></i>
        		</button>
			</div>
		</div>
   	</div>
	<table id="tblVAData" 
			data-row-style="rowStyle"
			data-toolbar="#toolbar"  data-row-style="rowStyle"  data-striped="true">
	</table>
</div>

<script>
	$("#txtYear").val("2018"); //set current year
	var $table = $("#tblVAData");
	
	var admin_level1 = <%=Settings.admin_level1%>;
	var admin_level2 = <%=Settings.admin_level2%>;
	var admin_level3 = <%=Settings.admin_level3%>;
	
	$(function(){
		$table.bootstrapTable({
			url:"../GetBootTable",
			method:"post",
			pagination:true,
			sidePagination: "server",
			contentType: 'application/x-www-form-urlencoded',
			queryParams:function(p){
				return{
					rtype:3,
					tablename:"view_interviewer",
					searchBy:"interview_year",
					searchVal:$("#txtYear").val(),
					limit : this.pageSize,
					offset: this.pageSize * (this.pageNumber - 1),
					orderBy:	this.sortName,
					orderVal:  this.sortOrder
				}
			},
			groupBy: false,
			groupByField: ['interviewer_name'],
			groupBySumGroup:false,
			columns:[{
				field:"interviewer_name",
				title:"Interviewer",
				visible:true,
				sortable: true
			},{
				field:"death_loc_level1",
				title:admin_level1,
				visible:true,
				sortable: true
			},{
				field:"death_loc_level2",
				title:admin_level2,
				visible:true,
				sortable: true
			},{
				field:"jan",
				title:"Jan",
				align:"right"
			},{
				field:"feb",
				title:"Feb",
				align:"right"
			},{
				field:"mar",
				title:"Mar",
				align:"right"
			},{
				field:"apr",
				title:"Apr",
				align:"right"
			},{
				field:"may",
				title:"May",
				align:"right"
			},{
				field:"jun",
				title:"Jun",
				align:"right"
			},{
				field:"jul",
				title:"Jul",
				align:"right"
			},{
				field:"aug",
				title:"Aug",
				align:"right"
			},{
				field:"sep",
				title:"Sep",
				align:"right"
			},{
				field:"oct",
				title:"Oct",
				align:"right"
			},{
				field:"nov",
				title:"Nov",
				align:"right"
			},{
				field:"dece",
				title:"Dec",
				align:"right"
			},{
				field:"tot",
				title:"Total",
				align:"right",
				sortable: true
			}]
		});
	});
	
	//$('select[name="dropdown"]').change(function () {	
	//	$table.bootstrapTable('refreshOptions', {
	//		groupBy: true,
	//		//groupByField: $(this).val() 
	//		groupByField: ['interviewer_name','death_region','death_district','interview_month']
	//		//groupBySumGroup:true
	//	})
	//});
	
	$("#btnYearNext").click(function(e){
		if( $("#txtYear").val()=="2017" ){
			$("#txtYear").val("2018")
		}else{
			$("#txtYear").val("2017")
		}
		//Refresh bootstrap
		$table.bootstrapTable('refresh');
		
	})
	$("#btnYearPrev").click(function(){
		if( $("#txtYear").val()=="2018" ){
			$("#txtYear").val("2017")
		}else{
			$("#txtYear").val("2018")
		}
		//Refresh boostrap
		$table.bootstrapTable('refresh');
	})
	
</script>
</body>
</html>