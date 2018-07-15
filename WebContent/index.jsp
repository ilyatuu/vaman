<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VMan</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/brain-theme.css" rel="stylesheet" type="text/css">
<link href="css/styles.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="icon" href="favicon.ico" sizes="16x16 32x32 64x64" type="image/vnd.microsoft.icon">
<%
	String username = "";
	Cookie[] cookies = request.getCookies(); 
	boolean foundCookie = false;
	if(cookies != null && cookies.length > 0){
		for(int i = 0; i < cookies.length; i++){
			Cookie c = cookies[i];
			if (c.getName().equals("username")){
				username= c.getValue();
				foundCookie = true;
			}
		}	
	}
%>
</head>
<body>
<div class="container">
<section id="s1content">
<div class="row" style="margin-top:100px;">
	<div class="col-sm-offset-2 col-sm-5">
		<img src= "images/logo.png" style="display:block;margin:auto;" alt="VMan Management Dashboard">
		<h4>Monitor quality and progress of verbal autopsy data collection processes</h4>
		<ul class="fa-ul">
			<li><i class="fa-li fa fa-check-square"></i>See real time data as submitted by verbal autopsy interviewers</li>
			<li><i class="fa-li fa fa-check-square"></i>Summary distribution of verbal autopsy records by type (infant, child or adult) and interviewer</li>
			<li><i class="fa-li fa fa-check-square"></i>Conduct online physician coding of the verbal autopsies</li>
		</ul>
	</div>
	<div class="col-sm-3">
		<form id="frmLogin" action="UserMethods" method="post" role="form">
			<div class="panel panel-default">
            <div class="panel-heading"><h6 class="panel-title"><i class="fa fa-user"></i> User login</h6></div>
            <div class="panel-body">
            <div class="form-group has-feedback">
            <label>Username</label>
            <input id="username" name="username" type="text" class="form-control" placeholder="Username" value="<% out.print(username);%>">
            <i class="fa fa-user form-control-feedback"></i>
            </div>
            <div class="form-group has-feedback">
            <label>Password</label>
            <input id="password" name="password" type="password" class="form-control" placeholder="Password">
            <i class="fa fa-lock form-control-feedback"></i>
            </div>
           	<div class="row form-actions">
            <div class="col-xs-6">
            <div class="checkbox">
            <label>
            <input id="rememberme" name="rememberme" type="checkbox" class="styled">
            	Remember me
            </label>
            </div>
            </div>
            <div class="col-xs-6">
            	<button type="submit" class="btn btn-warning pull-right"><i class="fa fa-bars"></i> Sign in</button>
            	<input type="hidden" name="rtype" value="1">
            </div>
            </div>
            </div>
        	</div>
		</form>
	</div>
</div>
</section>
<footer class="footer navbar-fixed-bottom">
  <div class="row">
  	<div class="col-sm-offset-3 col-sm-2">
  		<h4>Development support and testing comes from</h4>
  	</div>
  	<div class="col-sm-2">
  		<img src="images/d4h.png" style="width:200px; display:block;">
  	</div>
  </div>
  <div class="container-fluid text-center" style="padding-top:10px;padding-botton:5px;">
    <span><strong>&copy; CRVS 2018</strong></span>
  </div>
</footer>
</div>

<!-- end page container -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/plugins/forms/validate.min.js"></script>
<script>
$(document).ready(function(){
	$("#frmLogin").validate({
			rules:{
				username:{
					required:true,
					minlength:3,
					email:false
				},
				password:{
					required:true,
					minlength:3
				}
			},
			messages: {
				username:{
					required: "username is required",
					minlength:"The minimum length is 3"
				},
				password:{
					required: "password is required",
						minlength:"The minimum length is 3"
				}
			},
			submitHandler: function(form) {
				var validator = this;
				$.ajax({
					type: $(form).attr('method'),
			        url: $(form).attr('action'),
			        data: $(form).serialize(),
			        dataType : 'json'
				}).done(function (data) {
			        if (data.success) {               
			        	window.location.replace("home/index.jsp?sid="+data.sid);
			        } else {
			           validator.showErrors( {"password": data.message});
			        }
			    });
				return false; // required to block normal submit since you used ajax
			}
		});	
});
</script>
</body>
</html>