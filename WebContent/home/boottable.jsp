<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VA Data</title>
<%@ page import="iact.dev.Settings" %>
<%
	int roleid=0,userid=0,notcoded=0,discordant=0;
	if(session.getAttribute("roleid") != null){
		roleid = Integer.parseInt(session.getAttribute("roleid").toString());
	}
	if(session.getAttribute("userid") != null){
		userid = Integer.parseInt(session.getAttribute("userid").toString());
	}
	
	if(session.isNew()){
		//response.sendRedirect("../index.jsp");
		response.getWriter().write("Your session has expired. Please <a href='../index.jsp'>relogin</a>");
		return;
	}
	if(request.getParameterMap().containsKey("notcoded")){
		notcoded = Integer.parseInt(request.getParameter("notcoded"));
	}
	if(request.getParameterMap().containsKey("discordant")){
		discordant = Integer.parseInt(request.getParameter("discordant"));
	}
%>
</head>
<body>
<div class="page-container container-fluid" style="padding:0;">
<div class="panel panel-default">
	<div class="panel-heading">
		<h6 class="panel-title"><i class="fa fa-list"></i>Individual Data</h6>
		<div class="pull-right"><h6 id="physician_name" class="panel-title"><i class="fa fa-user"></i>Physician Name</h6></div>
	</div>
	<div class="panel-body">
		<div class="row">
		<div class="rtl-inputs" style="padding-right:5px;">
			<div class="col-md-4">
			<div class="input-group">
					<input id = "searchVal" name="search" type="text" class="form-control" placeholder="Search Word">
					<span class="input-group-btn">
	                <button id="searchBtn" class="btn btn-default" type="button"><i class="fa fa-search" aria-hidden="true"></i>F</button>
	                <button id="refreshBtn" class="btn btn-default" type="button"><i class="fa fa-refresh" aria-hidden="true"></i>R</button>
	                </span>
            </div>
			</div>
			<div class="col-md-2">
				<select data-tags="true" id="searchBy" name="searchBy" class="select">
					<option value='va_uri'>VA UUID</option>
				</select>
			</div>
		</div>
		</div>
		<div class="row" style="margin-top:1.5em; padding:0 5px;">
			<table id="tblVAData" data-row-style="rowStyle" ></table>
		</div>
	</div>
</div>
<!-- model display va -->
<div id="divViewVA" class="modal fade" role="dialog" aria-labelledby="divViewVA" aria-hidden="true">
<div class="modal-dialog modal-lg">
<div class="modal-header">
 	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h5 class="modal-title">Display VA Document</h5>
</div>
<div class="modal-body has-padding" style="background-color:#fff;">
	<div class="row">
		<div class="col-sm-7">
			<div class="panel panel-default">
				<div class="panel-heading"><h6 class="panel-title">VA Document</h6></div>
				<div class="panel-body" style="height:445px;overflow-y:scroll;">
					<table 	id="tbl-va-view"
		   				data-pagination="false"
		   				data-striped = "true"
		   				data-sort-name="id"
		   				data-sort-order="asc"
		   				data-classes="table table-no-bordered">
		   			<thead>
		   				<tr>
		   					<th data-field="id" data-sortable="true">ID</th>
		   					<th data-field="label" data-width="60%">Label</th>
		   					<th data-field="value">Response</th>
		   				</tr>
		   			</thead>
		   			</table>
				</div>
			</div>
		</div>
		<div class="col-sm-5">
			<div class="panel panel-default">
				<div class="panel-heading"><h6 class="panel-title">Summary</h6></div>
				<div class="panel-body" id="va-summary" style="height:445px;overflow-y:scroll;">
					<h5>VA ID: 				<span id="summary-va-id" 		class="text-primary"></span> </h5>
					<h5>VA Type: 			<span id="summary-va-type" 		class="text-primary"></span> </h5>
					<h5>Interviewer Name:	<span id="summary-int-name" 	class="text-primary"></span> </h5>
					<h5>Interviewer Phone:	<span id="summary-int-phone" 	class="text-primary"></span> </h5>
					<h5>Respondent Name:	<span id="summary-res-name" 	class="text-primary"></span> </h5>
					<h5>Respondent Phone:	<span id="summary-res-phone" 	class="text-primary"></span> </h5>
					<h5>Interview Start:	<span id="summary-int-start" 	class="text-primary"></span> </h5>
					<h5>Interview End:		<span id="summary-int-end" 		class="text-primary"></span> </h5>
					<h5>Interview Time:		<span id="summary-int-time" 	class="text-primary"></span> </h5>
					<h5>Narrative Section:	<span id="summary-narrative" 	class="text-primary"></span> </h5>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Dismiss</button>
</div>
</div>
</div>
<!-- end modal display va v2 -->
<!-- modal edit cod -->
<div id="divEditCoD" class="modal fade" role="dialog" aria-labelledby="divEditCoD" aria-hidden="true">
<div class="modal-dialog modal-lg">
<div class="modal-header">
 	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h5 class="modal-title">Assign Cause of Death Information</h5>
</div>
<div class="modal-body has-padding" style="background-color:#fff;">
	<div class="row">
	<div class="col-sm-7">
	<div class="panel panel-default">
	<div class="panel-heading"><h6 class="panel-title">VA Document Responses</h6></div>
	<div class="panel-body" id="va-data" style="height:445px;overflow-y:scroll;">
		<table 	id="tbl-va-rec"
   				data-pagination="false"
   				data-striped = "true"
   				data-sort-name="id"
   				data-sort-order="asc"
   				data-classes="table table-no-bordered">
   			<thead>
   				<tr>
   					<th data-field="id" data-sortable="true">ID</th>
   					<th data-field="label" data-width="50%">Label</th>
   					<th data-field="value">Response</th>
   				</tr>
   			</thead>
   		</table>
	</div>
	</div>
	</div>
	<div class="col-sm-5">
		<!-- start panel -->
		<div class="panel panel-default">
		<div class="panel-heading"><h6 class="panel-title">Coding Sheet</h6></div>
		<div class="panel-body">
			<form class="form-horizontal" id="frmAssignCoD" action="../UserMethods" role="form" method="post">
			<input type="hidden" name="uname" id="uname">
			<input type="hidden" name="rtype" value="32">
			<div class="form-group">
				<label class="control-label col-sm-4" for="coder">Coder's Name:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="coder" id="coder" placeholder="Coder's Name" readonly>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-12" for="notes">Notes</label>
				<div class="col-sm-12"><textarea class="form-control" id="notes" name="notes" rows=3 maxlength="1000"></textarea></div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-12" for="cod_a">Disease or condition leading to death</label>
				<label class="col-sm-1">a.</label>
				<div class="col-sm-11">
					<select id="cod_a" name="cod_a" class="icd10_select2" style="width : 100%;">
					<option value=0>Select probable cause of death 1</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-1">b.</label>
				<div class="col-sm-11">
					<select id="cod_b" name="cod_b" class="icd10_select2" style="width : 100%;">
					<option value=0>Select probable cause of death 2</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-1">c.</label>
				<div class="col-sm-11">
					<select id="cod_c" name="cod_c" class="icd10_select2" style="width : 100%;">
						<option value=0>Select probable cause of death 3</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-1">d.</label>
				<div class="col-sm-11">
					<select id="cod_d" name="cod_d" class="icd10_select2" style="width : 100%;">
						<option value=0>Select probable cause of death 4</option>
					</select>
				</div>
			</div>
		</form>
		</div>
		</div>
		<!-- end panel -->
		
	</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" id="btnAssignCoD">Assign CoD Info</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">Dismiss</button>
</div>
</div>
</div>
<!-- end modal edit cod -->
</div><!-- end page container -->
<script>
$(document).ready(function(){			
	var rowIndex, coderType, vadata;
	var rowId, tableId;
	var userId = <%= userid %>;
	
	// VAType 1=WHOVA, 2=SmartVA
	var vatype = <%=Settings.va_type%>;
	
	var admin_level1 = <%=Settings.admin_level1%>;
	var admin_level2 = <%=Settings.admin_level2%>;
	var admin_level3 = <%=Settings.admin_level3%>;
	
	var classes = ['active', 'success', 'info', 'warning', 'danger'];
	
	//Initial Load
	loadICD10();
	loadSearchBox();
	
	//Initial set
	$("#searchBy").select2({
		width:'100%',
		minimumResultsForSearch: Infinity,
	});
	//Start select class
	$(".icd10_select2").select2();
	
	// On row click, store URI (row unique ID)
	 $("#tblVAData").on('click-row.bs.table', function(e, row, $element){
	    	rowId = row['va_uri'];
	    	tableId = row['va_table'];
	 });
	
	//On displaying modal, get the VA document
	$('#divEditCoD').on('show.bs.modal', function () {
		getVAData(rowId,tableId);
	});
	
	//On viewing modal, view the VA document
	$('#divViewVA').on('show.bs.modal', function () {
		viewVAData(rowId,tableId);
	});
	
	//Load VA Data
	switch( <%= roleid %> ){
		case 1://Data Viewer
			break;
		case 2://Coder
			loadVADataByCoder( userId );
			break;
		default: //administrator
			loadVAData();
				//Add option values for administrator
			//$("#searchBy").append("<option value='c1name'>Physician Name</option>");
			break;
	}	
	$("#searchBtn").click(function(){
		if( !$("#searchVal").val() ){
			alert("Search string is emtpy");
			return;
		}
		$("#tblVAData").bootstrapTable('refresh');
	});
	$("#refreshBtn").click(function(){
		$("#searchVal").val("");
		$("#tblVAData").bootstrapTable('refresh');
	});
	
	
	$("#btnAssignCoD").click(function(){
		//var vaid = rowId;
		//var userid = <%= userid %>;
		assignCoD(rowId,userId);
		//Update table cell according to corder type
		
		if( $("#cod_a").val() > 0)
			updateTableCell(RowIndex,"coda",$("#cod_a").select2('data').text);
		else
			updateTableCell(RowIndex,"coda","-");
		
		if( $("#cod_b").val() > 0)
			updateTableCell(RowIndex,"codb",$("#cod_b").select2('data').text);
		else
			updateTableCell(RowIndex,"codb","-");
		
		if( $("#cod_c").val() > 0)
			updateTableCell(RowIndex,"codc",$("#cod_c").select2('data').text);
		else
			updateTableCell(RowIndex,"codc","-");
		
		if( $("#cod_d").val() > 0)
			updateTableCell(RowIndex,"codd",$("#cod_d").select2('data').text);
		else
			updateTableCell(RowIndex,"codd","-");
		
		//updateTableCell(RowIndex,"c"+coderType+"ucd",returnUnderline());
		//Close modal
		$("#divEditCoD").modal("hide");
	});
	
	$("#tblVAData").on('click-row.bs.table', function(e, row, $element){
		//Assign
		$("#summary-va-id").text( row['va_uri'] );
		
		RowIndex = $element.index();
		resetForm();
		//Update coding sheet area
		if(userId==row['coder1_id']){
			//coder1
			if(row['coder1_comments'] != null)
				$("#notes").text( row['coder1_comments'] );
			else
				$("#notes").val("");
				
			//Update CoD
			if(row['coder1_coda']!=null)
		    	$("#cod_a").select2('val',row['coder1_coda']);
			if(row['coder1_codb']!=null)
			    $("#cod_b").select2('val',row['coder1_codb']);
			if(row['coder1_codc']!=null)
				$("#cod_c").select2('val',row['coder1_codc']);
			if(row['coder1_codd']!=null)
				$("#cod_d").select2('val',row['coder1_codd']);
			coderType=1;
		}
		if(userId==row['coder2_id']){
			//coder2
			if(row['coder2_comments'] != null)
				$("#notes").text( row['coder2_comments'] );	
			else
				$("#notes").val("");
			//Update CoD
			if(row['coder2_coda']!=null)
		    	$("#cod_a").select2('val',row['coder2_coda']);
			if(row['coder2_codb']!=null)
			    $("#cod_b").select2('val',row['coder2_codb']);
			if(row['coder2_codc']!=null)
				$("#cod_c").select2('val',row['coder2_codc']);
			if(row['coder2_codd']!=null)
				$("#cod_d").select2('val',row['coder2c_odd']);
			coderType=2;
		}
	});//end table click event
	
	function resetForm(){
		$("#cod_a").select2('val',0);
		$("#cod_b").select2('val',0);
		$("#cod_c").select2('val',0);
		$("#cod_d").select2('val',0);
		$("#notes").text( "" );
	}
	//function assign VA
	function assignCoD(vaid,userid){
		$.ajax({
			url:"../UserMethods",
			type:"post",
			data:$("#frmAssignCoD").serialize()+"&vaid="+vaid+"&userid="+userid,
			success:function(data){
				
			}
		})
	}
	//function pre-load search box
	function loadSearchBox(){
		//$("#searchBy").append("<option value='death_loc_level2'>"+admin_level2+"</option>");
		//$("#searchBy").append("<option value='death_loc_level3'>"+admin_level3+"</option>");
	}
	
	//load VA data by coder: getAssginedVA
	function loadVADataByCoder(userId){
		$("#tblVAData").bootstrapTable({
			url:"../GetBootTable",
			method:"post",
			pagination: true,
			sidePagination: "server",
			contentType: 'application/x-www-form-urlencoded',
			formatLoadingMessage: function () {
	             return '<span class="glyphicon glyphicon glyphicon-repeat glyphicon-animate"></span>'},
			singleSelect: true,
			search: false,
			pageSize: 10,
	    	pageList: [10, 25, 50, 100],
			queryParams: function(p){
				return{
					rtype: 104,
					tablename: "not_used", //V2 does not use this parameter
					notcoded:<%= notcoded %>,
					discordant:<%= discordant %>,
					limit : this.pageSize,
					offset: this.pageSize * (this.pageNumber - 1),
					//search: this.searchText,
					searchBy : $("#searchBy").val(),
					searchVal: $("#searchVal").val(),
					orderBy:	this.sortName,
					orderVal:  this.sortOrder,
					userId: userId
				}
			},onDblClickRow: function (row, $element) {
				//alert( row['_URI'] );
	            //var key = row["key"];               
	            $("#divViewVA").modal("show");
	        },
			columns: [{
			   	field: 'va_uri',
		    	title: 'VA ID',
		    	sortable: false
		    },{
			   	field: 'assigned_date',
		    	title: 'Date Assigned',
		    	sortable: true
		    },{
			   	field: 'coda',
		    	title: 'Cause A',
		    	width: 150,
		    	sortable: true
		    },{
			   	field: 'codb',
		    	title: 'Cause B',
		    	width: 150,
		    	sortable: true,
		    },{
			   	field: 'codc',
		    	title: 'Cause C',
		    	width: 150,
		    	sortable: true
		    },{
			   	field: 'codd',
		    	title: 'Cause D',
		    	width: 150,
		    	sortable: true
		    },{
			   	field: 'va_table',
		    	title: 'VA Table',
		    	visible: false
		    },{
			   	field: 'va_uri',
		    	title: 'Options',
		    	align: 'center',
		    	formatter: formatEditColumn
		    }]
		});//end bootrap table
	}
	function loadVAData(){
		$("#tblVAData").bootstrapTable({
			url:"../GetBootTable",
			method:"post",
			pagination: true,
			sidePagination: "server",
			contentType: 'application/x-www-form-urlencoded',
			singleSelect: true,
			search: false,
			showColumns:false,
			pageSize: 10,
	    	pageList: [10, 25, 50, 100],
	    	formatLoadingMessage: function () {
	             	return '<span class="glyphicon glyphicon glyphicon-repeat glyphicon-animate"></span>'
	             },
			queryParams: function(p){
				return{
					rtype: 2,
					tablename: "view_individual_va",
					limit : this.pageSize,
					offset: this.pageSize * (this.pageNumber - 1),
					//search: this.searchText,
					searchBy : $("#searchBy").val(),
					searchVal: $("#searchVal").val(),
					orderBy:	this.sortName,
					orderVal:  this.sortOrder
				}
			},onDblClickRow: function (row, $element) {
				//alert( row['_URI'] );
	            //var key = row["key"];               
	            $("#divViewVA").modal("show");
	        },
	        rowStyle: function(row,index){
	        	if ( row['c1ucd'] == null & row['c2ucd'] == null){
	        			//both empty
	        			return {};
	        	}else{
	        		if(row['c1ucd']==row['c2ucd']){
	        			return { classes: classes[3] };		//coder 1 matches coder 2, YELLOW color
	        		}else{
	        			return { classes: classes[4] };		//coder 1 do not match coder 2
	        		}
	        	}
	        	return {};
	        },
			columns: [{
			   	field: 'death_loc_level1',
		    	title: admin_level1,
		    	sortable: true
		    },{
			   	field: 'death_loc_level2',
		    	title: admin_level2,
		    	sortable: true
		    },{
			   	field: 'death_loc_level3',
		    	title: admin_level3,
		    	sortable: true
		    },{
			   	field: 'deceased_name',
		    	title: 'Deceased',
		    	sortable: true
		    },{
			   	field: 'interviewer_name',
		    	title: 'Interviewer',
		    	sortable: true
		    },{
			   	field: 'interviewer_phone',
		    	title: 'Intv Phone',
		    	visible:false,
		    	sortable: true
		    },{
			   	field: 'death_category',
		    	title: 'VA Type',
		    	sortable: true
		    },{
			   	field: 'c1name',
		    	title: 'Coder 1',
		    	sortable: true
		    },{
			   	field: 'c2name',
		    	title: 'Coder 2',
		    	sortable: true
		    },{
			   	field: 'c1ucd',
		    	title: 'C1 UCD',
		    	sortable: true
		    },{
			   	field: 'c2ucd',
		    	title: 'C2 UCD',
		    	sortable: true
		    },{
			   	field: '_URI',
		    	title: 'Options',
		    	align: 'center',
		    	formatter: formatEditColumn
		    }]
		});//end bootrap table
	}
	//Load ICD10 to select options
	function loadICD10(){
		$.ajax({
			url:"../ICD10",
			method:"post",
			data:"rtype=1",
			dataType:"json",
			success:function(data){
				$.each(data,function(key,value){
					$("#cod_a").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#cod_b").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#cod_c").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#cod_d").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
				})
			},error:function(xhr, ajaxOptions, thrownError){
				alert(xhr.status+" "+thrownError);
			}
		})
	}//end function load ICD10
	//set summary
	function setSummary(va_array){
		var timeStart,timeEnd;
		setSummaryReset();
		$.each(va_array,function(key,obj){
			switch(obj.id){
			case "ID00000":
				$("#summary-va-type").text( obj.value );
				break;
			case "TIME_START":
				$("#summary-int-start").text( obj.value );
				timeStart = obj.value;
				break;
			case "TIME_END":
				$("#summary-int-end").text( obj.value );
				timeEnd = obj.value;
				break;
			case "ID10010":
				$("#summary-int-name").text( obj.value );
				break;
			case "ID10010_PHONE":
				$("#summary-int-phone").text( obj.value );
				break;
			case "ID10007":
				$("#summary-res-name").text( obj.value );
				break;
			case "ID10007_PHONE":
				$("#summary-res-phone").text( obj.value );
				break;
			case "ID10476":
				$("#summary-narrative").text( obj.value );
				break;
			}
		})
		
		//set time difference
		setTimeDifference(timeStart,timeEnd);
		
	}
	function setTimeDifference(tStart,tEnd){
		 var d1 = new Date(tStart);
		 var d2 = new Date(tEnd);
		 var min =  Math.floor((d2 - d1)/(1000*60));
		 
		 $("#summary-int-time").text( min.toString() + " minutes" );
	}
	function setSummaryReset(){
		$("#summary-va-type").text("");
		$("#summary-int-start").text("");
		$("#summary-int-end").text("");
		$("#summary-int-name").text("");
		$("#summary-int-phone").text("");
	}
	//Get VA
	function getVAData(recid,tableid){
		$.ajax({
			url:"../UserMethods",
			method:"post",
			data:"rtype=3&uri="+recid+"&tableid="+tableid,
			dataType:"json",
			success: function(data){
				switch(vatype){
				case 1:
					vadata = renderWHOVA(data)
					setSummary(vadata);
					break
				case 2:
					vadata = renderSmartVA(data)
					break;
				}
				
				$("#tbl-va-rec").bootstrapTable('destroy');
				$("#tbl-va-rec").bootstrapTable({
					data:vadata
				})
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		});
	}
	function viewVAData(recid,tableid){
		$.ajax({
			url:"../UserMethods",
			method:"post",
			data:"rtype=3&uri="+recid+"&tableid="+tableid,
			dataType:"json",
			success: function(data){
				switch(vatype){
				case 1:
					vadata = renderWHOVA(data);
					setSummary(vadata);
					break
				case 2:
					vadata = renderSmartVA(data);
					break;
				}
				$("#tbl-va-view").bootstrapTable('destroy');
				$("#tbl-va-view").bootstrapTable({
					data:vadata
				})
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		});
	}
	function formatUCD(value,row,index){
		//Return the appropiate UCD
		if(row['c1id']==userId){
			return row['c1ucd'];
		}
		if(row['c2id']==userId){
			return row['c2ucd'];
		}
		
	}
	function formatEditColumn(value, row, index){
		switch( <%= roleid %> ){
		case 2: //Coder
			return [
			        "<a href='#' data-toggle='modal' data-target='#divViewVA'>",
			        "<i class='fa fa-eye' aria-hidden='true'></i>",
			        "</a> &nbsp; ",
			        "<a href='#' data-toggle='modal' data-target='#divEditCoD'>",
			        "<i class='fa  fa-stethoscope' aria-hidden='true'></i>",
			        "</a>"].join('');
			break;
		case 3: //Administrator
			return [
			        "<a href='#' data-toggle='modal' data-target='#divViewVA'>",
			        "<i class='fa fa-eye' aria-hidden='true'></i>",
			        "</a>"].join('');
			break;
		default://Only view
			return [
			        "<a href='#' data-toggle='modal' data-target='#divViewVA'>",
			        "<i class='fa fa-eye' aria-hidden='true'></i>",
			        "</a>"].join('');
				break;
		}
	}//end edit column function
	
	//Update table cell
	function updateTableCell(index,colid,cellval){
		$("#tblVAData").bootstrapTable('updateCell', {
			index: index,
			field: colid,
			value: cellval
		});
	}
	//end Update table cell
	//Calcualte the underline
	function returnUnderline(){
		switch(coderType){
		case 1:
			if( $("#cod_d").val() > 0)
				return $("#cod_d").select2('data').text;	
			if( $("#cod_c").val() > 0)
				return $("#cod_c").select2('data').text;	
			if( $("#cod_b").val() > 0)
				return $("#cod_b").select2('data').text;	
			if( $("#cod_a").val() > 0)
				return $("#cod_a").select2('data').text;	
			break;
		case 2:
			if( $("#cod_d").val() > 0)
				return $("#cod_d").select2('data').text;	
			if( $("#cod_c").val() > 0)
				return $("#cod_c").select2('data').text;	
			if( $("#cod_b").val() > 0)
				return $("#cod_b").select2('data').text;	
			if( $("#cod_a").val() > 0)
				return $("#cod_a").select2('data').text;	
			break;
		default:
			return "default";
		}
	}
	//end calculate the underline
})
</script>
</body>
</html>