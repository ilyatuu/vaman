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
		<img src= "images/logo.svg" style="display:block;margin:auto;" alt="VMan Management Dashboard">
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
		<div class="well well-sm" style="margin-top:20px; overflow:auto;">
			<ul>
				<li>Download user manual &rArr; <a href="docs/manual.pdf" target="_blank">link</a></li>
			</ul>
		</div>
	</div>
</div>
<section>
<div class="row">
	<div class="row">
		<div class="col-sm-offset-1 col-sm-10">
			<h2>Basic configurations</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-1 col-sm-4">
			<h5>1. Configure database connection</h5>
			<p>
				Navigate to &lt;web root folder &gt;/WEB-INF/classes. Use any text editor to edit 
				the file db.properties. Input the appropiate values as shown below
			</p>
			<div class="well" style="margin-top:20px; overflow:auto;">
				# for mysql database			<br />
				db.driver=com.mysql.jdbc.Driver	<br />
				db.url=jdbc:mysql://localhost	<br /><br />
												
				# comment above and uncomme below for postgres database <br />
				#db.driver=org.postgresql.Driver						<br />
				#db.schema=public										<br />
				#db.url=jdbc:postgresql://localhost:5432/				<br /><br />
				
				## Database credentials		<br />
				db.name=dbname				<br />
				db.user=dbuser				<br />
				db.pass=dbpassword			<br />
			</div>
		</div>
		<div class=" col-sm-offset-1 col-sm-4">
			<h5>2. Configure settings</h5>
			<p>
				Navigate to &lt;web root folder &gt;/WEB-INF/classes. Use any text editor to edit 
				the file st.properties. Input the appropiate values as shown below
			</p>
			<div class="well" style="margin-top:20px; overflow:auto;">
				app.name = crvs												<br />
				app.page_title = 'The United Republic of Tanzania'			<br />
				app.page_sub_title = 'Verbal Autopsy Management Dashboard'	<br /><br />
				
				## VA Data Mapping types. 1 = WHOVA and 2 = SmartVA			<br />
				app.va_type = 1												<br /><br />
				
				## Administration structure levels							<br />
				app.admin_level1 = 'Region'									<br />
				app.admin_level2 = 'District'								<br />
				app.admin_level3 = 'Ward'									<br />
				app.admin_level4 = 'Village'								<br /><br />
				
				## Interviewer's source data								<br />
				app.interviewers_name_table = 'va_table_name'				<br />
				app.interviewers_name_column = 'respondent_column_name'		<br />
				app.interviewers_phone_column = 'responded_phone_no'		<br />
			</div>
		</div>
	</div>
</div>
</section>
</div>
<!-- end page container -->
<!-- footer -->
<footer class="footer" style="margin-top:20px;">
	<div class="row">
	  	<div class="col-sm-offset-3 col-sm-2 text-primary">
	  		<h4>Support comes from</h4>
	  	</div>
	  	<div class="col-sm-2">
	  		<img src="images/crvs_tz.png" style="width:200px; display:block;">
	  	</div>
	  	<div class="col-sm-2">
	  		<img src="images/d4h.png" style="width:400px; display:block;">
	  	</div>
  	</div>
	<div class="row text-center" style="margin-top:20px;">
  		<span><strong>&copy; CRVS 2018</strong></span>
  	</div>
</footer>
<!-- end of footer section -->

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