<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VMan Demo</title>
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
<body class="full-width">
<!-- page container -->
<div class="container">
<section>
<div class="row" style="margin-top:100px;">
	<div class="col-sm-offset-2 col-sm-5">
		<img src= "images/logo.svg" style="width:300px; display:block;margin:auto;" alt="VMan Management Dashboard">
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
<div class="row">
	<div class="col-sm-offset-1 col-sm-6">
		<h2>Install your own instance of VMan</h2>
		<h4>1. Prerequisite</h4>
		<h5>
			You need username and password (with write access) to the machine that runs ODK Aggregate.
			You also need database access.
		</h5>
	
		<h4>2. Instructions</h4>
		<h5>
			Download the file <a href="docs/vman.war">vman.war</a>. Deploy the file in your tomcat container. VMan.war also deploys two additional
			files,  1.install_tables and 2.install_views (mysql and pgsql). The two files are located in the root folder. Run install_tables 
			script to install necessary tables for VMan.
		</h5>
		<code>
			$ mysql -u &lt;dbuser&gt; -p &lt;dbpass&gt; dbname &lt; install_tables.sql
		</code>
		<h5>Install backend views</h5>
		<h5>
			Run install_views (mysql or pgsql). You only need to run one of the two. The choice depends whether your ODK Aggregate is running
			on mysql or pgsql. 
		</h5>
		<code>
			$ mysql -u &lt;dbuser&gt; -p &lt;dbpass&gt; dbname &lt; install_views_mysql.sql
		</code>
	</div>
	<div class="col-sm-3">
		<div class="well">
			<h4>VMan Demo using WHOVA 2016 sample data</h4>
			<p>Default user name and password is admin and t@n3an1A</p>
		</div>
		<div class="well" style="margin-top:20px; overflow:auto;">
			<h4>ODK collect settings</h4>
			<p>URL: http://www.vatools.net/whova<br />Username: ODK<br />Password: Pass@321</p>
		</div>
		<div class="well well-sm">
			<ul>
				<li>Download user manual &rArr; <a href="docs/manual.pdf" target="_blank">link</a></li>
			</ul>
		</div>
	</div>
</div>
<section>
<div class="row">
<div class="col-sm-offset-1 col-sm-6">
	<h2>Basic configurations</h2>
	<h5>Configure database connection file</h5>
	<p>
		Navigate to &lt;web root folder &gt;/WEB-INF/classes. Use any text editor to edit the file db.properties. Input the appropiate values
		as shown below
	</p>
<pre>## Database connection, comment below if postgres db
db.driver=com.mysql.jdbc.Driver
db.url=jdbc:mysql://localhost

## Postgresql Connection, Comment below if mysql db
#db.driver=org.postgresql.Driver
#db.schema=public
#db.url=jdbc:postgresql://localhost:5432/

## Database credentials
db.name=dbname
db.user=dbuser
db.pass=dbpassword
</pre>
	<h5>Configure setting file</h5>
	<p>
		Navigate to &lt;web root folder &gt;/WEB-INF/classes. Use any text editor to edit the file st.properties. Input the appropiate values
		as shown below
	</p>
<pre>## Settings file
app.name = crvs
app.page_title = 'The Republic of Tanzania'
app.page_sub_title = 'Verbal Autopsy Management Dashboard'
app.page_logo_file = 'crvs.png'

## Type of the VA Data Mapping vile 1 = WHOVA and 2 = SmartVA
app.va_type = 1

## Administration structure levels
app.admin_level1 = 'Region'
app.admin_level2 = 'District'
app.admin_level3 = 'Ward'
app.admin_level4 = 'Village'

## Interviewer's source data
app.interviewers_name_table = '`VAWHOV151_CORE`'
app.interviewers_name_column = '`RESPONDENT_BACKGR_ID10010`'
app.interviewers_phone_column = '`PHONENUMBER`'
</pre>
	
</div>
</div>
</section>
<br />
<footer class="navbar-default navbar-fixed-bottom">
  <div class="container-fluid text-center">
    <span>&copy; CRVS 2018</span>
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