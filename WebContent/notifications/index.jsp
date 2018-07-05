<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRVS:Notifications</title>
<%@ page import="iact.dev.Settings" %>
<link href="../css/bootstrap-table.min.css" rel="stylesheet">
<link href="../css/bootstrap-datepicker.min.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="../css/brain-theme.css" rel="stylesheet" type="text/css">
<link href="../css/styles.css" rel="stylesheet" type="text/css">

<%
String fullname = "fullname";
%>
</head>
<body>

<!-- navbar -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div class="container-fluid">
	<div class="navbar-header">
		<div class="hidden-lg pull-right">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-right">
			<span class="sr-only">Toggle navigation</span>
            <i class="fa fa-chevron-down"></i>
		</button>
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar">
           <span class="sr-only">Toggle sidebar</span>
           <i class="fa fa-bars"></i>
        </button>
		</div>
		<ul class="nav navbar-nav navbar-left-custom">
			<li><a class="nav-icon sidebar-toggle"><i class="fa fa-bars"></i></a></li>
		</ul>
	</div>
	<ul class="nav navbar-nav navbar-right collapse" id="navbar-right">
		<li><a href="#"><%= fullname %></a> </li>
		<li>
			<a href="#" class="logout">
			<i class="fa fa-sign-out"></i>
			<span>Log out</span>
			</a>
		</li>
	</ul>
</div>
</div>
<!-- end navbar -->

<!-- page container -->
<div class="page-container container-fluid" style="margin-top:10px;">
<!-- side bar -->
<div class="sidebar collapse">
	<ul class="navigation">
		<li class="active"><a href="#"><i class="fa fa-laptop"></i> Menu</a></li>
		<li><a href='#' data-toggle="modal" data-target="#divAddNotification"><i class="fa fa-plus"></i>Create Notification</a></li>
	</ul>
</div><!-- end side bar -->

<!-- page content -->
<div class="page-content">
	<div class="div-notifications">
		<div id="toolbar">
			<div class="btn-group" role="group" aria-label="Options">
				<button type="button" class="btn btn-default" aria-label="Left Align" id="tblExport">
  					<span class="glyphicon glyphicon-export" aria-hidden="true"></span>
				</button>
			</div>
        </div>
		<table id="tblNotifications" data-striped="true"></table>
	</div>
</div><!-- end page-content -->
</div><!-- end page container -->

<!-- begin modal classes -->
<div id="divAddNotification" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog modal-lg">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h5 class="modal-title">Create Notification</h5>
	</div>
	<form id="frmCreateNotification" action="../Notifications" method="post" role="form" autocomplete="off">
	<div class="modal-body has-padding" style="background-color:#fff;">
			<div class="form-group">
				<div class="row">
				<div class="col-sm-2">
					<label for="event_fname">First Name(s)</label>
           			<input name="event_fname" type="text" placeholder="First and second name" class="form-control">
            	</div>
            	<div class="col-sm-2">
            		<label for="event_lname">Surname</label>
           			<input name="event_lname" type="text" placeholder="Surname" class="form-control">
            	</div>
            	<div class="col-sm-2">
            		<label for="event_sex">Sex</label>
           			<select name="event_sex" class="select2_ctl" style="width : 100%;">
           					<option></option>
          					<option value="male">Male</option>
          					<option value="female">Female</option>
          					<option value="unknown">Unknown</option>
          			</select>
      	 		</div>
            	<div class="col-sm-2">
            		<label for="event_age">Age</label>
           			<input name="event_age" type="text" placeholder="Age" class="form-control">
      	 		</div>
      	 		<div class="col-sm-2">
            		<label for="age_unit">Age Unit</label>
           			<select name="age_unit" class="select2_ctl" style="width : 100%;">
           					<option></option>
          					<option value="Years">Years</option>
          					<option value="Months">Months</option>
          					<option value="Days">Days</option>
          			</select>
      	 		</div>
			</div>
			</div>
			<div class="form-group">
			<div class="row">
				<div class="col-sm-2">
            		<label for="event_type">Event Type</label>
           			<select name="event_type" class="select2_ctl" style="width : 100%;">
          					<option value="death">Death</option>
          					<option value="birth">Birth</option>
          			</select>
      	 		</div>
      	 		<div class="col-sm-2">
      	 			<label for="event_date">Event Date</label>
           			<input name="event_date" type="text" placeholder="yyyy-mm-dd" class="datepicker_ctl form-control" autocomplete="off" />
      	 		</div>
            	<div class="col-sm-2">
            		<label for="notified_by">Notified by name</label>
           			<input name="notified_by" type="text" placeholder="first and last name" class="form-control">
      	 		</div>
      	 		<div class="col-sm-2">
      	 			<label for="notified_by_phone">Notified by phone</label>
           			<input name="notified_by_phone" type="text" placeholder="+255765999999" class="form-control">
           			<input name="notified_by_method" type="hidden" value="Web">
      	 		</div>
            	<div class="col-sm-2">
            		<label for="notification_date">Notification Date</label>
           			<input name="notification_date" type="text" placeholder="yyyy-mm-dd" class="datepicker_ctl form-control" autocomplete="off" />
           			<input name="rtype" type="hidden" value="2">
      	 		</div>
			</div>
			</div>
			<div class="form-group">
			<div class="row">
				<div class="col-sm-2">
           			<input name="notification_id" type="text" placeholder="Notification ID" class="form-control">
            	</div>
				<div class="col-sm-2">
           			<input name="location_level1" type="text" placeholder=<%= Settings.admin_level1 %> class="form-control">
            	</div>
            	<div class="col-sm-2">
           			<input name="location_level2" type="text" placeholder=<%= Settings.admin_level2 %> class="form-control" id="passwd">
            	</div>
            	<div class="col-sm-2">
           			<input name="location_level3" type="text" placeholder=<%= Settings.admin_level3 %> class="form-control">
      	 		</div>
      	 		<div class="col-sm-2">
           			<input name="location_details" type="text" placeholder="Location Details" class="form-control">
      	 		</div>
			</div>
			</div>
			
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-default" aria-hidden="true">Add</button>
		<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
	</div>
	</form>
</div>
</div>

<!-- end modal classes -->

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/collapsible.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/bootstrap-table.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/bootstrap-table-export.js"></script>
<script type="text/javascript" src="../js/plugins/interface/tableExport.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="../js/plugins/forms/select2.min.js"></script>
<script type="text/javascript" src="../js/plugins/forms/validate.min.js"></script>
<!-- script -->
<script>
$(document).ready(function(){
	var row;
	var $table = $("#tblNotifications");
	var admin_level1 = <%=Settings.admin_level1%>;
	var admin_level2 = <%=Settings.admin_level2%>;
	var admin_level3 = <%=Settings.admin_level3%>;
	
	$(".select2_ctl").select2({
		placeholder: "Select",
		minimumResultsForSearch: Infinity
	});
	
	$('.datepicker_ctl').datepicker({
		endDate: new Date(),
		format: 'yyyy-mm-dd',
		autoclose: true
	});
		
	$('.sidebar-toggle').click(function () {
		$('.page-container').toggleClass('hidden-sidebar');
	});
	
	$.validator.addMethod("lessThan", function(value, element, param) {
		var i = parseFloat(value);
	  	var j = parseFloat(param);
	  	return (i < j) ? true : false;
		}
	 );
	
	$("#tblExport").click(function () {
		//$table.tableExport({
		//     type: 'cvs',
		//      escape: false
		//});
		$table.tableExport({
			fileName: "notifications"
		});
	});
	
	$("#frmCreateNotification").validate({
		rules:{
			event_fname:{required:true},
			event_lname:{required:true},
			event_sex:{required:true},
			event_date:{required:true},
			notified_by:{required:true},
			notified_by_phone:{required:true},
			notification_id:{
				required:true,
				maxlength:10
			},
			notification_date:{ required:true},
			event_age:{	
				required:true,
				number:true,
				lessThan:"150"
			},
			age_unit:{required:true},
			location_level1:{required:true},
			location_level2:{required:true},
			location_level3:{required:true},
			location_details:{required:true}
		},
		messages:{
			notificaiton_id:{
				maxlength:"Too many characters"
			},
			event_age:{ 
				number:"Age must be in complete numbers",
				lessThan:"Invalid age, max is 150"
			}
		},
		submitHandler:function(form){
			var validator = this;
			var $form = $("#frmCreateNotification");
			$.ajax({
				url: $form.attr('action'),
				type:$form.attr('method'),
				data:$form.serialize(),
				success:function(data){
					row = {
							notif_id 	: $("input[name=notification_id]").val(),
							notif_date 	: $("input[name=notification_date]").val(),
							event_date 	: $("input[name=event_date]").val(),
							event_type 	: $("select[name=event_type]").val(),
							event_fname : $("input[name=event_fname]").val(),
							event_lname : $("input[name=event_lname]").val(),
							event_sex 	: $("select[name=event_sex]").val(),
							event_age 	: $("input[name=event_age]").val(),
							age_unit 	: $("select[name=age_unit]").val(),
							loc_level1 	: $("input[name=location_level1]").val(),
							loc_level2 	: $("input[name=location_level2]").val(),
							loc_level3 	: $("input[name=location_level3]").val(),
							loc_details : $("input[name=location_details]").val()
					}
					$table.bootstrapTable('insertRow',{index: 0, row: row});
					$form.trigger("reset");
					$("#divAddNotification").modal("hide");
					
				},error:function(xhr, ajaxOptions, thrownError){
					validator.showErrors(xhr.status+" "+thrownError);
					alert(data.message);
				}
			})
		}
	})
	
	loadNotifications();
	
	
	function loadNotifications(){
		$table.bootstrapTable({
			url:"../Notifications",
			method:"post",
			toolbar:"#toolbar",
			toolbarAlign:"right",
			pagination: true,
			sidePagination: "server",
			showColumns: false,
			contentType: 'application/x-www-form-urlencoded',
			idField:'id',
			clickToSelect:true,
			search: false,
			pageSize: 10,  
	    	pageList: [10, 25, 50],      
	    	showExport:false,
	    	sortName:"notif_date",
	    	sortOrder:"desc",
	    	exportOptions: {
	    		fileName: "notifications"
	    	},
	    	exportTypes:["csv","xml","json"],
			queryParams: function(p){              
				return{
					rtype: 0,
					tablename: "_web_notifications",
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
	        },
			columns: [{
			   	field: 'id',
		    	title: 'ID',
		    	visible: false
		    },{
		    	field: 'notif_id',
		    	title:	'NotificationId'
		    },{
		    	field: 'notif_method',
		    	title: 'NotificationMethod',
		    	visible:false
		    },{
		    	field: 'notif_date',
		    	title: 'NotificationDate',
		    	visible:true,
		    	sortable:true
		    },{
		    	field: 'event_date',
		    	title: 'EventDate',
		    	visible:true,
		    	sortable:true
		    },{
		    	field: 'event_type',
		    	title: 'EventType',
		    	visible:true,
		    	sortable:true
		    },{
			   	field: 'event_fname',
		    	title: 'FirstName',
		    	sortable: true
		    },{
			   	field: 'event_lname',
		    	title: 'Surname',
		    	sortable: true
		    },{
		    	field:'event_sex',
		    	title:'Sex'
		    },{
		    	field: 'event_age',
		    	title: 'Age',
		    	align: 'right'
		    },{
		    	field:'age_unit',
		    	title:'AgeUnit'
		    },{
			   	field: 'loc_level1',
		    	title: admin_level1,
		    	sortable: true
		    },{
			   	field: 'loc_level2',
		    	title: admin_level2,
		    	sortable: true
		    },{
			   	field: 'loc_level3',
		    	title: admin_level3,
		    	sortable: true
		    },{
			   	field: 'loc_details',
		    	title: 'LocationDetails'
		    }]
		});
	}
})
</script>
<!-- end script -->
</body>
</html>