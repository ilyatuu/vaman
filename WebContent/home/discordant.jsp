<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Discordant VA</title>
<!--uncomment this to run this page by itself. Uncomment the script reference below as well 
<link href="../css/bootstrap-table.min.css" rel="stylesheet">
 -->
<%@ page import="iact.dev.Settings" %>
<%
	int roleid=0,userid=0;
	String fullname="";
	if(session.getAttribute("roleid") != null){
		roleid = Integer.parseInt(session.getAttribute("roleid").toString());
	}
	if(session.getAttribute("userid") != null){
		userid = Integer.parseInt(session.getAttribute("userid").toString());
	}
	if(session.getAttribute("fullname") != null){
		fullname = session.getAttribute("fullname").toString();
	}
	
%>
</head>
<body>
<!-- Main panel -->
<div class="page-container container-fluid" style="padding:0;">
<div class="panel panel-default">
<div class="panel-heading">
	<h6 class="panel-title"><i class="fa fa-list"></i>Discordant VA</h6>
	<div class="pull-right"><h6 id="physician_name" class="panel-title"><i class="fa fa-user"></i>Physician Name</h6></div>
</div>
<div class="panel-body">
<div class="row" style="margin-top:1.5em; padding:0 5px;">
	<table 	id="tblDiscordant" 
			data-row-style="rowStyle" 
			data-pagination="true">
	</table>
</div>
</div>
</div>
</div>
<!-- End main panel -->
<!-- Start Modal Panels -->
<div id="modalDiscordantVA" class="modal fade" role="dialog">
<div class="modal-dialog modal-lg">
<div class="modal-header">
 	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h5 class="modal-title">Discordant VA</h5>
</div>
<!-- Modal Body -->
<div class="modal-body has-padding" style="background-color:#fff;">
<div class="row">
<div class="col-sm-6"> 
   <div class="panel panel-default">
   	<div class="panel-heading"><h6 class="panel-title">VA Document Responses</h6></div>
   	<div class="panel-body" id="va-data" style="height:490px;overflow-y:scroll;">
   		<table 	id="tbl-va-rec"
   				data-pagination="false"
   				data-striped = "true"
   				data-sort-name="id"
   				data-sort-order="asc"
   				data-classes="table table-no-bordered">
   			<thead>
   				<tr>
   					<th data-field="id" data-sortable="true">ID</th>
   					<th data-field="label">Label</th>
   					<th data-field="value">Response</th>
   				</tr>
   			</thead>
   		</table>
   	</div>
   </div>
</div>

<div class="col-sm-3"> 
   <div class="panel panel-default">
   	<div class="panel-heading"><h6 class="panel-title" id="coder1-title">Coder 1</h6></div>
   	<div class="panel-body" style="height:250px;overflow-y:scroll;">
   		<input type="hidden" id="coder1Id" />
   		<input type="hidden" id="coder1Name" />
	   	<div class="row">
	   		<div class="col-sm-2 text-info"><h6>Ca.</h6></div>
	   		<div class="col-sm-10" >
	   			<select id="c1coda" name="c1coda" class="icd10_select2 c1select2" style="width : 100%;">
						<option value=0>None</option>
				</select>
	   		</div>
	   	</div>
	   	<div class="row">
	   		<div class="col-sm-2 text-info"><h6>Cb.</h6></div>
	   		<div class="col-sm-10" >
	   			<select id="c1codb" name="c1codb" class="icd10_select2 c1select2" style="width : 100%;">
						<option value=0>None</option>
				</select>
	   		</div>
	   	</div>
	   	<div class="row">
	   		<div class="col-sm-2 text-info"><h6>Cc.</h6></div>
	   		<div class="col-sm-10" >
	   			<select id="c1codc" name="c1codc" class="icd10_select2 c1select2" style="width : 100%;">
						<option value=0>None</option>
				</select>
	   		</div>
	   	</div>
	   	<div class="row">
	   		<div class="col-sm-2 text-info"><h6>Cd.</h6></div>
	   		<div class="col-sm-10" >
	   			<select id="c1codd" name="c1codd" class="icd10_select2 c1select2" style="width : 100%;">
						<option value=0>None</option>
				</select>
	   		</div>
	   	</div>
	   	<div class="row">
	   		<div class="col-sm-4 text-info"><h6>Comments</h6></div>
	   		<div class="col-sm-8" ><h6 id="c1comments"></h6></div>
	   	</div>
   	</div>
   </div>
</div>

<div class="col-sm-3"> 
   <div class="panel panel-default">
   	<div class="panel-heading"><h6 class="panel-title" id="coder2-title">Coder 2</h6></div>
   	<div class="panel-body" style="height:250px;overflow-y:scroll;">
   		<input type="hidden" id="coder2Id" />
   		<input type="hidden" id="coder2Name" />
   		<div class="row">
	   		<div class="col-sm-2 text-info"><h6 style="margin-left:-1px;">Ca.</h6></div>
	   		<div class="col-sm-10" >
	   			<select id="c2coda" name="c2coda" class="icd10_select2 c2select2" style="width : 100%;">
						<option value=0>None</option>
				</select>
	   		</div>
	   	</div>
	   	<div class="row">
	   		<div class="col-sm-2 text-info"><h6>Cb.</h6></div>
	   		<div class="col-sm-10" >
	   			<select id="c2codb" name="c2codb" class="icd10_select2 c2select2" style="width : 100%;">
						<option value=0>None</option>
				</select>
	   		</div>
	   	</div>
	   	<div class="row">
	   		<div class="col-sm-2 text-info"><h6>Cc.</h6></div>
	   		<div class="col-sm-10" >
	   			<select id="c2codc" name="c2codc" class="icd10_select2 c2select2" style="width : 100%;">
						<option value=0>None</option>
				</select>
			</div>
	   	</div>
	   	<div class="row">
	   		<div class="col-sm-2 text-info"><h6>Cd.</h6></div>
	   		<div class="col-sm-10" >
	   			<select id="c2codd" name="c2codd" class="icd10_select2 c2select2" style="width : 100%;">
						<option value=0>None</option>
				</select>
	   		</div>
	   	</div>
	   	<div class="row">
	   		<div class="col-sm-4 text-info"><h6>Comments</h6></div>
	   		<div class="col-sm-8" ><h6 id="c2comments"></h6></div>
	   	</div>
   </div>
</div>
</div>
<div class="col-sm-6">
	<div class="panel panel-default">
	<div class="panel-heading"><h6 class="panel-title">Exchange messages with the other coder</h6></div>
	<div class="panel-body msg_panel" id="msg_panel">
		<p>Some text in the panel</p>
	</div>
	<div class="panel-footer">
		<div class="row">
			<div class="col-sm-10">
				<textarea id="msg_text" rows=2 class="msg_text" placeholder="enter message" maxlength="1000"></textarea><br />
			</div>
			<div class="col-sm-2">
				<a href="#" id="msg_send">Send</a>
			</div>
		</div>
	</div>
	</div>
</div>
</div>
</div>
<!-- end modal body -->
<!-- modal Footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
<!-- end modal footer -->
</div>
</div>
<!-- end Modal panels -->
<!-- start scripts -->
<!--uncomment this to run this page by itself. Uncoment the css above as well 
<script type="text/javascript" src="../js/plugins/interface/bootstrap-table.min.js"></script>
<script type="text/javascript" src="../js/va-dashboard.js"></script>
 -->
<script>
$(document).ready(function(){
	var rowId,to,from;
	var userId = <%= userid %>;
	var vatype = <%=Settings.va_type%>;
	
	var admin_level1 = <%=Settings.admin_level1%>;
	var admin_level2 = <%=Settings.admin_level2%>;
	var admin_level3 = <%=Settings.admin_level3%>;

	//Select2 Class Initialitzation
	$(".icd10_select2").select2();
	
	//Load Main Panel
	loadDiscordantVA(userId);
	
	//Preload ICD10
	loadICD10()
	
	//On row click event
	$("#tblDiscordant").on('click-row.bs.table', function(e, row, $element){
    	rowId = row['_URI'];
    	
    	//Complete COD
    	if(row['c1codaid']!=null){
    		$("#c1coda").select2('val',row['c1codaid']);	
    	}
    	if(row['c1codbid'] != null){
    		$("#c1codb").select2('val',row['c1codbid']);	
    	}
    	if(row['c1codcid'] != null){
    		$("#c1codc").select2('val',row['c1codcid']);	
    	}
    	if(row['c1coddid'] != null){
    		$("#c1codd").select2('val',row['c1coddid']);	
    	}
    	$("#c1comments").text( row['c1comments'] );
    	$("#coder1Id").val( row['c1id'] );
    	$("#coder1Name").val( row['c1name'] );
    	
    	//Coder 2
    	if(row['c2codaid']!=null){
    		$("#c2coda").select2('val',row['c2codaid']);	
    	}
    	if(row['c2codbid'] != null){
    		$("#c2codb").select2('val',row['c2codbid']);	
    	}
    	if(row['c2codcid'] != null){
    		$("#c2codc").select2('val',row['c2codcid']);	
    	}
    	if(row['c2coddid'] != null){
    		$("#c2codd").select2('val',row['c2coddid']);	
    	}
    	$("#c2comments").text( row['c2comments'] );
    	$("#coder2Id").val( row['c2id'] );
    	$("#coder2Name").val( row['c2name'] );
 	});
	
	//On displaying modal, get the VA document
	$('#modalDiscordantVA').on('show.bs.modal', function () {
		getVAData(rowId);
		loadMessages(rowId);
		
		if( $("#coder1Id").val() == userId ){
			//You are coder 1
			from = $("#coder1Id").val();
			to   = $("#coder2Id").val();
			
			$("#coder1-title").text( "You:"+" <%= fullname %> " );
			$("#coder2-title").text( "Another Coder" );
			
			$(".c2select2").select2("enable",false);
			$(".c1select2").select2("enable",true);
		}else{
			//You are coder 2
			from = $("#coder2Id").val();
			to   = $("#coder1Id").val();
			
			$("#coder1-title").text( "Another Coder" );
			$("#coder2-title").text( "You:"+" <%= fullname %> " );
			
			$(".c1select2").select2("enable",false);
			$(".c2select2").select2("enable",true);
		}
		
	});
	//on CoD change event
	$('#c1coda').on("change", function(e) {
		if($('#c1coda').val()!=0){
			UpldateCoD(rowId,userId,"coder1_id","coder1_coda",$('#c1coda').val())	
		}
	});
	$('#c1codb').on("change", function(e) {
		if($('#c1codb').val()!=0){
			UpldateCoD(rowId,userId,"coder1_id","coder1_codb",$('#c1codb').val())	
		}
	});
	$('#c1codc').on("change", function(e) {
		if($('#c1codc').val()!=0){
			UpldateCoD(rowId,userId,"coder1_id","coder1_codc",$('#c1codc').val());	
		}
		
	});
	$('#c1codd').on("change", function(e) {
		//UpldateCoD(vaid,coderid,codertype,colname,colvalue)
		if($('#c1codd').val()!=0){
			UpldateCoD(rowId,userId,"coder1_id","coder1_codd",$('#c1codd').val());	
		}
	});
	//
	//Coder 2
	//
	$('#c2coda').on("change", function(e) {
		if($('#c2coda').val()!=0){
			UpldateCoD(rowId,userId,"coder2_id","coder2_coda",$('#c2coda').val())	
		}
	});
	$('#c2codb').on("change", function(e) {
		if($('#c2codb').val()!=0){
			UpldateCoD(rowId,userId,"coder2_id","coder2_codb",$('#c2codb').val())	
		}
	});
	$('#c2codc').on("change", function(e) {
		if($('#c2codc').val()!=0){
			UpldateCoD(rowId,userId,"coder2_id","coder2_codc",$('#c2codc').val());	
		}
		
	});
	$('#c2codd').on("change", function(e) {
		//UpldateCoD(vaid,coderid,codertype,colname,colvalue)
		if($('#c2codd').val()!=0){
			UpldateCoD(rowId,userId,"coder2_id","coder2_codd",$('#c2codd').val());	
		}
	});
	//end CoD change envent
	//Send message in the text area
	$("#msg_send").click(function(){
		if ($("#msg_text").val() != ""){
			
			sendMessage(to,from,$("#msg_text").val(), rowId );
			
			$("#msg_panel").append("<p>"+$("#msg_text").val()+"</p>");
			$("#msg_text").val("")	
		}
	})
	
	//Update causes of death 
	function UpldateCoD(vaid,coderid,codertype,colname,colvalue){
		$.ajax({
			url:"../VAMethods",
			method:"post",
			data:{"rtype":21,"vaid":vaid,"coderid":coderid,"colname":colname,"colvalue":colvalue,"codertype":codertype},
			dataType:"json",
			success:function(data){
				
			},error:function(xhr, ajaxOptions, thrownError){
				alert(xhr.status+" "+thrownError);
			}
		})
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
					$("#c1coda").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#c1codb").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#c1codc").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#c1codd").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					
					$("#c2coda").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#c2codb").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#c2codc").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
					$("#c2codd").append("<option value='"+value.id+"'>"+value.icdlabel+"</option>");
				})
			},error:function(xhr, ajaxOptions, thrownError){
				alert(xhr.status+" "+thrownError);
			}
		})
	}
	function sendMessage(to,from,msg,vaid){
		//Send message to database
		$.ajax({
			url:"../UserMethods",
			method:"post",
			data:{"rtype":16,"msgto":to,"msgfrom":from,"msgtxt":msg,"msgva":vaid},
			dataType:"json",
			success: function(data){
				
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		});
	}
	function loadMessages(vaid){
		$.ajax({
			url:"../VAMethods",
			method:"post",
			data:{"rtype":17,"vaid":vaid},
			dataType:"json",
			success:function(data){
				//empty
				$("#msg_panel").empty();
				$.each(data,function(key,value){
					$("#msg_panel").append("<p>"+value.msg_text+"</p>");	
				});
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		})
	}
	function getVAData(recid){
		$.ajax({
			url:"../UserMethods",
			method:"post",
			data:"rtype=3&uri="+recid,
			dataType:"json",
			success: function(data){
				switch(vatype){
				case 1:
					vadata = renderWHOVA(data)
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
	function loadDiscordantVA(coderId){
		$.ajax({
			url:"../UserMethods",
			method:"post",
			data:{ "rtype":33,"coderId":coderId},
			dataType:"json",
			success:function(data){
				$("#tblDiscordant").bootstrapTable({
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
					   	field: 'death_category',
				    	title: 'VA Type',
				    	sortable: true
				    },{
				    	field:'c1ucd',
				    	title:'UCD1',
				    	sortable:true
				    },{
				    	field:'c2ucd',
				    	title:'UCD2',
				    	sortable:true
				    },{
				    	field:'c1id',
				    	title:'Coder1ID',
				    	visible:false
				    },{
				    	field:'c2id',
				    	title:'Coder2ID',
				    	visible:false
				    },{
				    	field: '_URI',
				    	title: 'View',
				    	align: 'center',
				    	formatter: formatViewColumn
				    }],
					data:data.rows,
					
				})
			},error:function(){
				
			}
		});
	}
	
	//Format Functoins
	function formatViewColumn(value, row, index){
		return [
					"<a href='#' data-toggle='modal' data-target='#modalDiscordantVA'>",
					"view",
					"</a>"
		        ].join('');
	}
	
});
</script>
<!-- end scripts -->
</body>
</html>