<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRVS-MoH</title>
	<!-- Bootstrap core CSS -->
	<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../../css/brain-theme.css" rel="stylesheet" type="text/css">
	<link href="../../css/styles.css" rel="stylesheet" type="text/css">
	<link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
 
	<link rel="icon" href="../favicon.ico" sizes="16x16 32x32 64x64" type="image/vnd.microsoft.icon">
	<%@ page import="iact.dev.Settings" %>
<%
String uname = "";
String sid1  = "";
String sid2  = "";
String fullname="",org="",phone="";
int roleId = 0, userId=0; //roles 0.ReadOnly 1.Data Manager 2.Coder 3.Administrator
if(!session.isNew() && session.getAttribute("username") != null){
	sid1 = request.getSession().getId();
	sid2 = request.getParameter("sid");
	uname = session.getAttribute("username").toString();
	fullname = session.getAttribute("fullname").toString();
	org = session.getAttribute("organization").toString();
	phone = session.getAttribute("phone").toString();
	roleId = Integer.parseInt(session.getAttribute("roleid").toString());
	
	if(session.getAttribute("userid") != null){
		userId = Integer.parseInt(session.getAttribute("userid").toString());
	}
	
	if(request.getParameterMap().containsKey("sid")){
		if( !sid1.equals(sid2)){
			//response.sendRedirect("../index.jsp");
		}	
	}else{
		//response.sendRedirect("../index.jsp");
	}
	
	
}else{
	//response.sendRedirect("../403.html");
}
%>
</head>
<body>
<!-- body -->
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
<!-- navbar -->
<!-- page header -->
<div class="container-fluid">
<div class="page-header">
	<div style="width: 100%; overflow: hidden;">
		<div style="width: 110px; float: left;">
			<a href="../" title="VAMan">
				<img src="../../images/logo.svg" height="80" alt="Verbal Autopsy Manager">
			</a>
		</div>
	</div>
</div>
</div>
<!-- /page header -->
<!-- page container -->
<div class="page-container container-fluid">
<!-- side bar -->
<div class="sidebar collapse">
	<ul class="navigation">
		<li class="active"><a href="#"><i class="fa fa-laptop"></i> Graph Options</a></li>
		<li>
			<div>
				<a href="#" class="list-group-item">
					<input type="checkbox">&nbsp; bar
					<input type="checkbox">&nbsp; pie
					<input type="checkbox">&nbsp; line
				</a>
			</div>
		</li>
		<li>
            <a href="#" class="expand"><i class="fa fa-table"></i> Data Type</a>
            <ul>
             	<li><a href="#" >
             		<select>
             			<option>Select Indicators</option>
             			<option>VA Indicators</option>
             			<option>Interviewer Indicators</option>
             		</select>
             	</a></li>
             	<li><a href="#" >Value 2</a></li>
        	</ul>
        </li>
        <li>
        	<a href="#" class="expand"><i class="fa fa-table"></i> Period Type</a>
        	<ul>
        		<li><a href="#" >Period 1</a></li>
        		<li><a href="#" >Period 2</a></li>
        	</ul>
        </li>
        <li>
        	<a href="#" class="expand"><i class="fa fa-table"></i> Organization Type</a>
        	<ul>
        		<li><a href="#" >VA Document</a></li>
        		<li><a href="#" >Interviewer</a></li>
        	</ul>
        </li>
        <li>
        	<a href="#"><i class="fa fa-table"></i>Generate Graph</a>
        </li>
	</ul>
</div>
<!-- end side bar -->
<!-- page content -->
<div class="page-content">
<!-- page title -->
<div class="page-title">
	<h5><i class="fa fa-bars"></i> Graph Output</h5>
	<div class="btn-group">
		<a href="#" class="btn btn-link btn-lg btn-icon dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cogs"></i><span class="caret"></span></a>
		<ul class="dropdown-menu dropdown-menu-right">
			<li><a href="#">Action 1</a></li>
			<li><a href="#">Action 2</a></li>
		</ul>
	</div>
</div>
<!-- end page title -->
<!-- page main panel -->
<div class="page-main-panel">

</div>
<!-- end page main panel -->
</div>
<!-- end page content -->
</div>
<!-- end page container -->
<!-- end body -->

<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../js/plugins/interface/collapsible.min.js"></script>
<script>
$(document).ready(function(){
	$('.expand').collapsible({
		defaultOpen: 'second-level,third-level',
		cssOpen: 'level-opened',
		cssClose: 'level-closed',
		speed: 150
	});
	
	//======== Hiding sidebar =====//

	$('.sidebar-toggle').click(function () {
		$('.page-container').toggleClass('hidden-sidebar');
	});
		
});
</script>
</body>
</html>