<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Profile</title>
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
<!-- Panel 1 -->
<div class="panel panel-default">
<div class="panel-heading"><h6 class="panel-title"><i class="fa fa-address-card-o"></i>Update User Details</h6></div>
<div class="panel-body">
<form id="frmUpdateUser" action="../UserMethods" method="post" role="form">
	<div class="form-group">
		<div class="row">
			<div class="col-sm-4">
           		<label for="update_username">User name</label>
           		<input name="update_username" type="text" placeholder="Username" class="form-control" readonly id="update_username">
            </div>
            <div class="col-sm-4">
           		<label for="update_organization">Organization</label>
           		<input name="update_organization" type="text" placeholder="Organization" class="form-control">
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
		</div>
	</div>
	<button type="submit" class="btn btn-default">Update Details</button>
	<input type="hidden" name="rtype" value="17">
</form>
<hr />
<form class="form-inline" id="frmUpdatePasswd" action="../UserMethods" method="post" role="form">
	<div class="form-group">
    	<label>Change Password:</label>
  	</div>
	<div class="form-group">
		<input type="password" class="form-control" id="password1" placeholder="Password" name="password1">
	</div>
	<div class="form-group">
		<input type="password" class="form-control" id="password2" placeholder="Confirm Password" name="password2" >
	</div>
  	<button type="submit" class="btn btn-default">Update Password</button>
  	<input type="hidden" name="rtype" value="18">
</form>
</div>
</div>
<!-- end Panel 1 -->
<!-- start script -->
<script type="text/javascript">
$(document).ready(function(){
	$("#frmUpdateUser").validate({
		rules:{
			update_fullname:{required:true},
			update_organization:{required:true},
			update_phone:{required:true}
		},
		submitHandler:function(form){
			var validator = this;
			var $form = $("#frmUpdateUser");
			$.ajax({
				url: $form.attr('action'),
				type:$form.attr('method'),
				data:$form.serialize(),
				success:function(data){
					alert(data.message);
					//$form.trigger('reset');
				},error:function(xhr, ajaxOptions, thrownError){
					validator.showErrors(xhr.status+" "+thrownError);
				}
			})
			return false;
		}
	})
	$("#frmUpdatePasswd").validate({
		rules:{
			password1:{required:true,minlength:5},
			password2:{equalTo:"#password1"}
		},
		messages:{
			password2:{equalTo:"Password do not match"}
		},
		submitHandler:function(form){
			var validator = this;
			var $form = $("#frmUpdatePasswd");
			$.ajax({
				url: $form.attr('action'),
				type:$form.attr('method'),
				data:$form.serialize()+"&username="+$("#update_username").val(),
				success:function(data){
					alert(data.message);
					$form.trigger('reset');
				},error:function(xhr, ajaxOptions, thrownError){
					validator.showErrors(xhr.status+" "+thrownError);
				}
			})
			
		}
	})
})
</script>
<!-- end script -->
</body>
</html>