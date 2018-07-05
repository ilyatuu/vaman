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
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/brain-theme.css" rel="stylesheet" type="text/css">
	<link href="../css/styles.css" rel="stylesheet" type="text/css">
	<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
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
			<li><a class="nav-icon sidebar-toggle"><i class="fa fa-arrows-h"></i></a></li>
		</ul>
	</div>
	<ul class="nav navbar-nav navbar-right collapse" id="navbar-right">
		<li>
			<a href="#">
			<i class="fa fa-comments"></i>
			<span>Messages</span>
			<strong class="label label-danger">7</strong>
			</a>
		</li>
	</ul>
</div>
</div>
<!-- navbar -->
<!-- page header -->
<div class="container-fluid">
<div class="page-header">
	<div class="logo"><a href="index.html" title=""><img src="../images/logo.png" alt=""></a></div>
	
</div>
</div>
<!-- /page header -->
<!-- page container -->
<div class="page-container container-fluid">
<!-- side bar -->
<div class="sidebar collapse">
	<ul class="navigation">
		<li class="active"><a href="index.html"><i class="fa fa-laptop"></i> Dashboard</a></li>
		<li>
            <a href="#" class="expand"><i class="fa fa-table"></i> Tables</a>
            <ul>
             	<li><a href="#">Table 1</a></li>
            	<li><a href="#">Table 2</a></li>
        	</ul>
        </li>
		
		<li>
			<a href="#" class="expand"><i class="fa fa-bar-chart-o"></i>Graphs and Charts</a>
			<ul>
				<li><a href="#">Graph 1</a></li>
				<li><a href="#">Graph 2</a></li>
			</ul>
		</li>
		<li>
			<a href="#" class="expand"><i class="fa fa-user"></i> User Details</a>
			<ul>
				<li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
				<li><a href="#"><i class="fa fa-mail-forward"></i> Logout</a></li>
			</ul>
		</li>
	</ul>
</div>
<!-- /side bar -->
<!-- page content -->
<div class="page-content">
<!--  page title -->
<div class="page-title">
	<h5><i class="fa fa-bars"></i> Dashboard <small>Welcome, Username!</small></h5>
	<div class="btn-group">
		<a href="#" class="btn btn-link btn-lg btn-icon dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cogs"></i><span class="caret"></span></a>
		<ul class="dropdown-menu dropdown-menu-right">
			<li><a href="#">Action 1</a></li>
			<li><a href="#">Action 2</a></li>
		</ul>
	</div>
</div>
<!-- /page title -->
<!-- statistics -->
	<ul class="row stats">
		<li class="col-xs-3"><a href="#" class="btn btn-default">52</a> <span>new pending tasks</span></li>
		<li class="col-xs-3"><a href="#" class="btn btn-default">520</a> <span>pending orders</span></li>
		<li class="col-xs-3"><a href="#" class="btn btn-default">14</a> <span>new opened tickets</span></li>
		<li class="col-xs-3"><a href="#" class="btn btn-default">48</a> <span>new user registrations</span></li>
	</ul>
<!-- /statistics -->
<div class="footer">
	&copy; Copyright 2017. All rights reserved. <a href="#" title="">CRVS</a>
</div>
<!-- footer -->
<!-- /footer -->
</div>
<!-- /page content -->
</div>
<!-- /page container -->
<!-- scripts -->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>

<script type="text/javascript" src="../js/plugins/charts/flot.js"></script>
<script type="text/javascript" src="../js/plugins/charts/flot.orderbars.js"></script>
<script type="text/javascript" src="../js/plugins/charts/flot.pie.js"></script>
<script type="text/javascript" src="../js/plugins/charts/flot.time.js"></script>
<script type="text/javascript" src="../js/plugins/charts/flot.animator.min.js"></script>
<script type="text/javascript" src="../js/plugins/charts/excanvas.min.js"></script>
<script type="text/javascript" src="../js/plugins/charts/flot.resize.min.js"></script>

<script type="text/javascript" src="../js/plugins/forms/uniform.min.js"></script>
<script type="text/javascript" src="../js/plugins/forms/select2.min.js"></script>
<script type="text/javascript" src="../js/plugins/forms/inputmask.js"></script>
<script type="text/javascript" src="../js/plugins/forms/autosize.js"></script>
<script type="text/javascript" src="../js/plugins/forms/inputlimit.min.js"></script>
<script type="text/javascript" src="../js/plugins/forms/listbox.js"></script>
<script type="text/javascript" src="../js/plugins/forms/multiselect.js"></script>
<script type="text/javascript" src="../js/plugins/forms/validate.min.js"></script>
<script type="text/javascript" src="../js/plugins/forms/tags.min.js"></script>

<script type="text/javascript" src="../js/plugins/forms/uploader/plupload.full.min.js"></script>
<script type="text/javascript" src="../js/plugins/forms/uploader/plupload.queue.min.js"></script>

<script type="text/javascript" src="../js/plugins/forms/wysihtml5/wysihtml5.min.js"></script>
<script type="text/javascript" src="../js/plugins/forms/wysihtml5/toolbar.js"></script>

<script type="text/javascript" src="../js/plugins/interface/jgrowl.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/datatables.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/prettify.js"></script>
<script type="text/javascript" src="../js/plugins/interface/fancybox.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/colorpicker.js"></script>
<script type="text/javascript" src="../js/plugins/interface/timepicker.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/fullcalendar.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/collapsible.min.js"></script>

<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/application.js"></script>

<script type="text/javascript" src="../js/charts/simple_graph.js"></script>
<script>
	$(document).ready(function(){
		
	});
</script>
</body>
</html>