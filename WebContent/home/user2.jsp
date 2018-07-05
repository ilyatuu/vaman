<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Management</title>
<link href="../css/bootstrap-table.min.css" rel="stylesheet">
</head>
<body>
<div class="page-container container-fluid" style="padding:0;">
	<div class="panel panel-default">
		<div class="panel-heading"><h6 class="panel-title"><i class="fa fa-plus"></i>Add User</h6></div>
		<div class="panel-body">
			<form id="frmAddUser" action="../UserMethods" method="post" role="form">
			<div class="form-group">
				<div class="row">
					<div class="col-sm-3">
           				<input name="uname" type="text" placeholder="Your Email" class="form-control">
            		</div>
            		<div class="col-sm-2">
           				<input name="passwd" type="password" placeholder="password" class="form-control" id="passwd">
            		</div>
            		<div class="col-sm-2">
           				<input name="passwd2" type="password" placeholder="Confirm password" class="form-control">
            		</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-3">
						<input name="fullname" type="text" placeholder="Full Name" class="form-control">
					</div>
					<div class="col-sm-2">
						<input name="phone" type="text" placeholder="Phone" class="form-control">
					</div>
					<div class="col-sm-2">
						<input name="org" type="text" placeholder="Organization" class="form-control">
					</div>
					<div class="col-sm-2">
						<select name="role" class="select2" style="width : 100%;">
							<option></option>
							<option value="0">Read Only</option>
							<option value="1">Data Manager</option>
							<option value="2">Coder 1</option>
							<option value="3">Coder 2</option>
							<option value="4">Administrator</option>
						</select>
					</div>
					<div class="col-sm-3">
						<button type="submit" class="btn btn-default">Add</button>
						<button type="reset" class="btn btn-default">Reset</button>
						<input type="hidden" name="rtype" value="11">
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading"><h6 class="panel-title"><i class="fa fa-list"></i>List Users</h6></div>
		<div class="panel-body">
		<table id="tblUsers" data-striped="true"></table>
		</div>
	</div>
</div><!-- end body -->
<!-- modal div -->
<div id="editUserModal" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog modal-md">
<form id="frmUpdateUser" action="../UserMethods" method="post" role="form">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h5 class="modal-title">Edit Record</h5>
</div>
<div class="modal-body has-padding" style="background-color:#fff;">
	<div class="form-group">
		<div class="row">
			<div class="col-sm-4">
           		<label for="update_username">User name</label>
           		<input name="update_username" type="text" placeholder="Username" class="form-control" readonly>
            </div>
            <div class="col-sm-4">
           		<label for="update_organization">Organization</label>
           		<input name="update_organization" type="text" placeholder="Organization" class="form-control">
            </div>
		</div>
	</div>
	<div class="form-group">
		<div class="form-check">
    		<label class="form-check-label small">
      		<input name="update_passwd_chk" type="checkbox" class="form-check-input">
     		Update Password
    		</label>
  		</div>
		<div class="row">            
            <div class="col-sm-4">
           		<input name="update_passwd" type="password" placeholder="*********" class="form-control">
            </div>
            <div class="col-sm-4">
           		<input name="update_passwd2" type="password" placeholder="**********" class="form-control">
            </div>
		</div>
	</div>
	<div class="form-group">	
		<div class="row">
			<div class="col-sm-4">
           		<label for="update_fullname">Full name</label>
           		<input name="update_fullname" type="text" placeholder="Fullname" class="form-control">
            </div>
            <div class="col-sm-4">
           		<label for="update_phone">Phone</label>
           		<input name="update_phone" type="text" placeholder="Phone" class="form-control">
            </div>
            <div class="col-sm-4">
           		<label for="udpate_roleid">Role</label>
           		<select id="update_roleid" name="update_roleid" class="select2" style="width : 100%;">
           			<option value="0">Read Only</option>
           			<option value="1">Data Manager</option>
					<option value="2">Coder 1</option>
					<option value="3">Coder 2</option>
					<option value="4">Administrator</option>
           		</select>
            </div>
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-default" aria-hidden="true">Update</button>
	<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
</form>
</div>
</div>
<!-- end modal div -->
<div id="divAssignVA" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog modal-lg">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h5 class="modal-title">Assign VA to a coder</h5>
</div>
<div class="modal-body has-padding" style="background-color:#fff;">
	<div class="row">
		<!-- Left side -->
		<div class="col-sm-4">
			<div class="panel panel-default">
			<div class="panel-heading has-padding">Physician Details</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="frmAssignVA" name="frmAssignVA">
					<div class="form-group">
					<label for="coderName" class="col-sm-4 control-label">Name</label>
					<div class="col-sm-8">
          				<input type="text" class="form-control" name="coderName" placeholder="Name" readonly>
          				<input type="hidden" name="coderId" value="0" >
          				<input type="hidden" name="rtype" value="31">
      				</div>
					</div>
					<div class="form-group">
					<label for="coderType" class="col-sm-6 control-label">Assign As</label>
					<div class="col-sm-6">
          				<select id="coderType" name="coderType" class="select2" style="width : 100%;">
          					<option value="1">Coder 1</option>
          					<option value="2">Coder 2</option>
          				</select>
      				</div>
					</div>
					<div class="form-group">
					<label for="pastAssignment" class="col-sm-6 control-label">Past Assignment</label>
					<div class="col-sm-6">
          				<input type="text" class="form-control text-right" name="pastAssignment" placeholder="0" readonly>
      				</div>
					</div>
					<div class="form-group">
					<label for="totalCompleted" class="col-sm-6 control-label">Total Completed</label>
					<div class="col-sm-6">
          				<input type="text" class="form-control text-right" name="totalCompleted" placeholder="0" readonly>
      				</div>
					</div>
					<div class="form-group">
					<label for="newAssignment" class="col-sm-6 control-label">New Assignment</label>
					<div class="col-sm-6">
          				<input type="text" class="form-control text-right" name="newAssignment" placeholder="0" readonly>
      				</div>
					</div>
				</form>
			</div>
			</div>
		</div>
		<!-- Right side -->
		<div class="col-sm-8">
			<div class="panel panel-default">
			<div class="panel-heading has-padding">List of VA Records</div>
			<div class="panel-body">
				<div class="row" style="margin-top:-.5em; padding:0 5px;">
					<div id="toolbar">
        				<button id="btnAssign" class="btn btn-default" disabled>
            				<i class="glyphicon glyphicon-tags"></i> Assign
        				</button>
    				</div>
					<table id="tblAssignment" 
						data-row-style="rowStyle"
						data-toolbar="#toolbar" >
					</table>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
</div>
</div>
</div>
<!-- modal assign va -->

<!-- end modal assign va -->
<!-- start scripts -->
<script type="text/javascript" src="../js/plugins/forms/select2.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/bootstrap-table.min.js"></script>
<script>
$(document).ready(function(){
	var selections = [],
		$tblAssignment = $("#tblAssignment"),
		$btnAssign = $("#btnAssign");
	
	//set select class
	$(".select2").select2({
		placeholder: "Role",
		minimumResultsForSearch: Infinity
	});
	
	$("#editUserModal").on("shown.bs.modal",function(e){
		$("input[name='update_passwd_chk']").attr('checked', false);
	});
	$("#divAssignVA").on("shown.bs.modal",function(e){
		loadAssignments();
	});
	
	//Checkbox click event by a button
	//$(document).on('click', '.checkAssign', function(){ 
		
		//var $row = $(this).closest('tr');
		
		//alert( $row.find("td:nth-child(1)").text() );
		
	     //alert( $(this).is(':checked') );
	     //$(this).attr("checked", returnVal);
	     //$(this).prop("checked", returnVal);
	//});
	
	//$('#tblAssignment').on('click-cell.bs.table', function (e, field, value, row, $element) {
		//alert("e:"+e+" field:"+field+" value:"+value+" row:"+row+" element:"+$element);
		//alert("e:"+e+" field:"+field+" value:"+value+" row:"+row['_URI']+" element:"+$element);
		//alert('getRowByUniqueId: ' + JSON.stringify($tblAssignment.bootstrapTable('getRowByUniqueId', 3)));
	//});
	
	$tblAssignment.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
        $btnAssign.prop('disabled', !$tblAssignment.bootstrapTable('getSelections').length);
        
        selections = getIdSelections();
        
        //update selection
        $("input[name='newAssignment']").val( selections.length  );
	});
	
	$btnAssign.click(function(){
		//alert( getIdSelections() );
		//alert('getSelections: ' + JSON.stringify($tblAssignment.bootstrapTable('getSelections')));
		var rows_text = JSON.stringify($tblAssignment.bootstrapTable('getSelections'));
		var rows = JSON.parse(rows_text);
		var aa  = false;
		var msg = "";
		if( $("#coderType").val()==1 ){
			$.each(rows,function(i,row){
				if(row.hasOwnProperty("coder1")){
					msg = "Invalid selection. Coder 1 is already assigned. Unselect or change assign as to proceed";
					aa  = true;
					//alert("Invalid selection. Coder 1 is already assigned. Ucheck to proceed");
					//return;
				}
			});
			
		}
		if( $("#coderType").val()==2 ){
			$.each(rows,function(i,row){
				if(row.hasOwnProperty("coder2")){
					msg = "Invalid selection. Coder 2 is already assigned. Unselect or change assign as to proceed";
					aa = true;
					//alert("Invalid selection. Coder 1 is already assigned. Ucheck to proceed");
					//return;
				}
			});
			
		}
		
		if(aa){
			//do not assign
			alert(msg);
			return
		}else{
			//assign
			assignVA(selections);
			$("#divAssignVA").modal("hide");
		}
		
		
	});
	//function
	$("#tblUsers").on('click-row.bs.table', function(e, row, $element){
		$("input[name='update_username']").val(row['username']);
		
		$("input[name='update_fullname']").val(row['fullname']);
		$("input[name='update_phone']").val(row['phone']);
		
		$("input[name='update_organization']").val(row['organization']);
		
		//Edit VA Modal
		$("input[name='coderName']").val( row['fullname'] );
		$("input[name='coderId']").val( row['id'] );
		
	});//end table click event
	//Get Users
	listUsers();
	
	
	//Add User
	$("#frmAddUser").validate({
		rules:{ 
			uname:{
				required:true,
				email:true,
				remote:{
					url:"../UserMethods",
					method:"post",
					data:{
						rtype:12,
						uname:function(){return $("input[name='uname']").val(); }
					}
				}
			},
			passwd:{required:true},
			passwd2:{equalTo:"#passwd"},
			fullname:{required:true},
			phone:{
					required:true,
					minlength:10,
					maxlength:13
			},
			org:{required:true}
		},
		messages:{
			uname:{
				required:"required field",
				email:"Invalid username",
				remote:"username already exist"
			},
			passwd:{required:"required field"},
			passwd2:{equalTo:"password does not match"},
			fullname:{required:"required field"},
			phone:{
					required:"required field",
					minlength:"invalid phone number",
					maxlength:"invalid phone number"},
			org:{required:"required field"}
		},
		submitHandler:function(form){
			var validator = this;
			var $form = $("#frmAddUser");
			$.ajax({
				url: $form.attr('action'),
				type:$form.attr('method'),
				data:$form.serialize(),
				success:function(data){
					alert(data.message);
					$form.trigger('reset');
				},error:function(xhr, ajaxOptions, thrownError){
					validator.showErrors(xhr.status+" "+thrownError);
				}
			})
			return false;
		}
	})//end add user function
	//Get selections
	function getIdSelections() {
        return $.map($tblAssignment.bootstrapTable('getSelections'), function (row) {
            return row._URI;
        });
    }
	//Update user
	$("#frmUpdateUser").validate({
		rules:{ 
			update_fullname: {required:true},
			update_phone: {required:true},
			update_organization:{required:true}
		},
		messages:{
			update_fullname:{required:"This field cannot be empty"},
			update_phone:	{required:"This field cannot be empty"},
			update_organization:{required:"This field is required"}
		},
		submitHandler:function(form){
			if( $("input[name='update_passwd_chk']").is(":checked") ){
				//Check if the two passwords match
				if( $("input[name='update_passwd']").val() == $("input[name='update_passwd2']").val() ){
					if( $("input[name='update_passwd']").val() == '' ){
						alert("Password cannot be blank");
					}else{
						//Update User and password
						//Update user then hide modal
						var validator = this;
						var $form = $("#frmUpdateUser");
						$.ajax({
							url: $form.attr('action'),
							type:$form.attr('method'),
							data:$form.serialize()+"&rtype=15",
							success:function(data){
								alert(data.message);
								$form.trigger('reset');
							},error:function(xhr, ajaxOptions, thrownError){
								validator.showErrors(xhr.status+" "+thrownError);
							}
						})
						$("#editUserModal").modal("hide");	
					}
				}else{
					alert("Password does not match");
				}
					
			}else{
				//Update user then hide modal
				var validator = this;
				var $form = $("#frmUpdateUser");
				$.ajax({
					url: $form.attr('action'),
					type:$form.attr('method'),
					data:$form.serialize()+"&rtype=14",
					success:function(data){
						alert(data.message);
						$form.trigger('reset');
					},error:function(xhr, ajaxOptions, thrownError){
						validator.showErrors(xhr.status+" "+thrownError);
					}
				})
				$("#editUserModal").modal("hide");
			}
				
		}
	})
	//end update user function

	//Assign VA function
	function assignVA(vaids){
		$.ajax({
			url:"../UserMethods",
			type:"post",
			data:$("#frmAssignVA").serialize()+"&vaids="+vaids,
			success:function(data){
				
			}
		})
	}
	//list user function
	function loadAssignments(){
		$tblAssignment.bootstrapTable({
			url:"../GetBootTable",
			method:"post",
			pagination: true,
			sidePagination: "server",
			showColumns: true,
			contentType: 'application/x-www-form-urlencoded',
			idField:'_URI',
			clickToSelect:true,
			search: false,
			pageSize: 10,
	    	pageList: [10, 25, 50],
			queryParams: function(p){
				return{
					rtype: 2,
					tablename: "view_assignments",
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
			columns: [{
			   	field: '_URI',
		    	title: 'URI',
		    	visible: false
		    },{
		    	field: 'Assign',
		    	checkbox:true,
		    	align:'center',
		    	valign:'middle'
		    },{
			   	field: 'coder1',
		    	title: 'Coder 1',
		    	sortable: true
		    },{
			   	field: 'coder2',
		    	title: 'Coder 2',
		    	sortable: true
		    },{
			   	field: 'death_region',
		    	title: 'Region',
		    	sortable: true
		    },{
			   	field: 'death_district',
		    	title: 'District',
		    	sortable: true
		    },{
			   	field: 'death_category',
		    	title: 'VA Type',
		    	sortable: true
		    }]
		});
	}
	function listUsers(){
		$.ajax({
			url:"../UserMethods",
			data:"rtype=13",
			type:"post",
			dataType:"json",
			success: function(data){
				$("#tblUsers").bootstrapTable({
					data:data.rows,
					columns: [{
						field:'id',
						title:'UserId',
						visible:false
					},{
					   	field: 'fullname',
				    	title: 'Full Name',
				    	sortable: true
				    },{
					   	field: 'phone',
					   	title: 'Phone',
					   	sortable: true
				    },{
					   	field: 'rolename',
					   	title: 'Role',
					   	sortable:true
				   },{
				    	field: 'username',
				    	title: 'Username',
				    	sortable: true
				    },{
					  	field: 'passwd',
					   	title: 'Password',
					   	align: 'center',
					   	sortable: true
				    },{
					  	field: 'organization',
					   	title: 'Organization',
					   	sortable: true
				    },{
					  	field: 'lastlogin',
					   	title: 'Last login',
					   	sortable: true
				    },{
				    	field: 'rolename',
				    	title: 'Update',
				    	align: 'right',
				    	formatter: formatEditColumn
				    }]
				})
			}
		})
	}//end get users function
	
	//function 
	function formatEditColumn(value, row, index){
		switch(value){
		case "Coder":
			return [
					"<a href='#' data-toggle='modal' data-target='#divAssignVA'>",
					"<i class='fa  fa-user-md' aria-hidden='true'></i>",
					"</a> &nbsp; ",
			        "<a href='#' data-toggle='modal' data-target='#editUserModal'>",
			        "<i class='fa  fa-edit' aria-hidden='true'></i>",
			        "</a>"
			        ].join('');
			break;
		default:
			return [
			        "<a href='#' data-toggle='modal' data-target='#editUserModal'>",
			        "<i class='fa  fa-edit' aria-hidden='true'></i>",
			        "</a>"
			        ].join('');
			break;
		}
	}//end function format
	function formatCoderColumn(value, row, index){
		if(!value){
			return "<input type='checkbox' class='checkAssign'/>";
		}
		return value;
	}//end edit column function
	
})
</script>
<!-- end scripts -->
</body>
</html>