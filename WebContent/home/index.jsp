<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VMan</title>
	<!-- Bootstrap core CSS -->
	<link href="../css/bootstrap-table.min.css" rel="stylesheet">
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="../css/brain-theme.css" rel="stylesheet" type="text/css">
	<link href="../css/styles.css" rel="stylesheet" type="text/css">
	<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
	
	<link rel="icon" href="../favicon.ico" sizes="16x16 32x32 64x64" type="image/vnd.microsoft.icon">
	<%@ page import="iact.dev.Settings" %>
<%
String uname = "";
String sid1  = "";
String sid2  = "";
String start_tab = "";
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
			response.sendRedirect("../index.jsp");
		}	
	}else{
		response.sendRedirect("../index.jsp");
	}
	
	
}else{
	response.sendRedirect("../403.html");
}
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
<!-- navbar -->
<!-- page header -->
<div class="container-fluid">
<div class="page-header">
	<div class="row">
		<div class="col-sm-2 col-md-2 visible-lg visible-md">
			<img src="../images/logo.svg" alt="CRVS Logo" class="img-responsive">
			<!-- image size is 94px X 80px -->
		</div>
		<div class="col-sm-8" style="padding-top:8px;">
			<h1 id="pageTitle" style="margin:1px auto;">Page title</h1>
			<h4 id="pageSubTitle" style="margin:1px auto;">Page subtitle</h4>
			<h6 style="margin:1px;">Release version 1.3 2019</h6>
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
		<li class="active"><a href="#"><i class="fa fa-laptop"></i> Menu</a></li>
		<li>
            <a href="#" class="expand"><i class="fa fa-table"></i> Tables</a>
            <ul id="myTables">
             	<li><a href="#" id="dashboard">Dashboard</a></li>
             	<li><a href="#" id="fetchdata">Coded VA Data</a></li>
             	<li><a href="#" id="create_table">Create Table</a></li>
        	</ul>
        </li>
		
		<li>
			<a href="#" class="expand"><i class="fa fa-bar-chart-o"></i>Graphs</a>
			<ul id="myGraphs">
				<li><a href="#" id="create_graph">Create Graph</a></li>
			</ul>
		</li>
		<li>
			<a href="#" class="expand"><i class="fa fa-map"></i>Maps</a>
			<ul id="myGraphs">
				<li><a href="#" id="open_maps">Go to Maps</a></li>
			</ul>
		</li>
		<li>
			<a href="#" class="expand"><i class="fa fa-cogs"></i>Settings</a>
			<ul>
				<li><a href="#" id="uprofile"><i class="fa fa-address-card-o"></i>Update Profile</a></li>
				<!-- Check for user profile -->
				<!-- 0: Read Only, 1: Data Manager, 2: Coder/Physician, 3: Administrator -->
				<% 
					switch(roleId){
					case 0: //Read Only
						break;
					case 1: //Data Manager
						break;
					case 2: // Coder or Physician
						out.print("<li><a href='#' id='notcodedva'><i class='fa fa-id-badge'></i>Not Coded VA    <span id='nbadge' class='badge badge-info label pull-right'>0</span></a></li>");
						out.print("<li><a href='#' id='assignedva'><i class='fa fa-id-badge'></i>All Assigned VA <span id='abadge' class='badge badge-info label pull-right'>0</span></a></li>");
						out.print("<li><a href='#' id='concordant'><i class='fa fa-files-o'></i>Concordant VA    <span id='cbadge' class='badge badge-info label pull-right'>0</span> </a></li>");
						out.print("<li><a href='#' id='discordant'><i class='fa fa-clipboard'></i>Discoardant VA <span id='dbadge' class='badge badge-info label pull-right'>0</span> </a></li>");
						break;
					case 3: //Administrator
						out.print("<li><a href='#' id='uinterviewer'><i class='fa fa-list-alt'></i>Interviewer Data</a></li>");
						out.print("<li><a href='#' id='upload_csmf'><i class='fa fa-upload'></i>Upload CSMF</a></li>");
						out.print("<li><a href='#' id='usrmgr'><i class='fa fa-users'></i>System Users</a></li>");
						out.print("<li><a href='#' id='icd10list'><i class='fa fa-book'></i>ICD10 List</a></li>");
						out.print("<li><a href='#' id='settings'><i class='fa fa-cog'></i>Settings</a></li>");
						out.print("<li><a href='#' id='download'><i class='fa fa-download'></i>Download Data</a></li>");
						break;
					}
					
				%>
				
			</ul>
		</li>
	</ul>
</div>
<!-- /side bar -->
<!-- page content -->
<div id="page-content" class="page-content">

<!-- nav tabs -->
<div id="tab-list">
<ul class="nav nav-tabs" role="tablist">
  <!-- Check user organization -->
  <%
  	switch(org){
  	case "MoH":
  		out.print("<li role='presentation' class='active'><a href='#tab0' role='tab' data-toggle='tab'>Home</a></li>");
  		out.print("<li role='presentation'><a href='#tab1' role='tab' data-toggle='tab'>10 Wards</a></li>");
  		out.print("<li role='presentation'><a href='#tab2' role='tab' data-toggle='tab'>Iringa</a></li>");
  		out.print("<li role='presentation'><a href='#tab3' role='tab' data-toggle='tab'>Geita/Shinyanga</a></li>");
  		start_tab = "tab0";
  		break;
  	case "10Wards":
  		out.print("<li role='presentation' class='active'><a href='#tab0' role='tab' data-toggle='tab'>Home</a></li>");
  		out.print("<li role='presentation'><a href='#tab1' role='tab' data-toggle='tab'>10 Wards</a></li>");
  		start_tab = "tab1";
  		break;
  	case "Iringa":
  		out.print("<li role='presentation' class='active'><a href='#tab0' role='tab' data-toggle='tab'>Home</a></li>");
  		out.print("<li role='presentation'><a href='#tab2' role='tab' data-toggle='tab'>Iringa</a></li>");
  		start_tab = "tab2";
  		break;
  	case "GeitaShinyanga":
  		out.print("<li role='presentation' class='active'><a href='#tab0' role='tab' data-toggle='tab'>Home</a></li>");
  		out.print("<li role='presentation'><a href='#tab3' role='tab' data-toggle='tab'>Geita/Shinyanga</a></li>");
  		start_tab = "tab3";
  		break;
  	default:
  		out.print("<li role='presentation' class='active'><a href='#tab0' role='tab' data-toggle='tab'>Home</a></li>");
  		start_tab = "tab0";
  	}
  %>
</ul>
</div>
<!-- tab panes -->
<div id="tab-content" class="tab-content" style="padding:5px;">
	<div class="tab-pane fade in active" id="tab0" >
		<div class="page-title">
			<h5><i class="fa fa-bars"></i> Dashboard <small>Home</small></h5>
		</div>
		<!-- Default page content -->
		<div id="page-content-home">
			<div class="row">
				<div class=" col-sm-4">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h5 class="panel-title center"><i class="fa fa-map-o" aria-hidden="true"></i>10 Wards</h5>
						</div>
						<div class="panel-body" style="min-height:350px;">
							<div class="row row-underline">
								<div class="col-md-6">Total Records:</div>
								<div class="col-md-6 text-right">
									<span class="text-large badge badge-warning" id="tenwards_total">0</span>
								</div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Coverage:</div>
								<div class="col-md-6 text-right">10 wards in Coast Region</div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Population</div>
								<div class="col-md-6 text-right"> - </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">CDR</div>
								<div class="col-md-6 text-right"> 6.7 </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Expected Deaths/Month</div>
								<div class="col-md-6 text-right"> - </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Last submission on:</div>
								<div class="col-md-6 text-right"><span id="tenwards_submitted">0</span></div>
							</div>
							<div class="row row-underline">
								<div id="graph_ten_wards" class="graph-standard" style="width:100%;height:100px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class=" col-sm-4">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h5 class="panel-title"><i class="fa fa-object-group" aria-hidden="true"></i>Iringa</h5>
						</div>
						<div class="panel-body" style="min-height:350px;">
							<div class="row row-underline">
								<div class="col-md-6">Total Records:</div>
								<div class="col-md-6 text-right"><span class="text-large badge badge-warning" id="iringa_total">0</span></div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Coverage:</div>
								<div class="col-md-6 text-right">Iringa Region, all Wards included</div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Population</div>
								<div class="col-md-6 text-right"> 941,238 </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">CDR</div>
								<div class="col-md-6 text-right"> 6.7 </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Expected Deaths/Month</div>
								<div class="col-md-6 text-right"> 526 </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Last submission on:</div>
								<div class="col-md-6 text-right"><span id="iringa_submitted"></span></div>
							</div>
							<div class="row row-underline">
								<div id="graph_iringa" class="graph-standard" style="width:100%;height:100px;" ></div>
							</div>
						</div>
					</div>
				</div>
				<div class=" col-sm-4">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h5 class="panel-title"><i class="fa fa-cubes" aria-hidden="true"></i>HIA4SD Project</h5>
						</div>
						<div class="panel-body" style="min-height:350px;">
							<div class="row row-underline">
								<div class="col-md-6">Total Records</div>
								<div class="col-md-6 text-right"><span class="text-large badge badge-warning" id="hia4sd_total">0</span></div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Coverage</div>
								<div class="col-md-6 text-right">Geita and Shinyanga, 5 Wards total</div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Population</div>
								<div class="col-md-6 text-right"> 113,501 </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">CDR</div>
								<div class="col-md-6 text-right"> 6.7 </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Expected Deaths/Month</div>
								<div class="col-md-6 text-right"> 63 </div>
							</div>
							<div class="row row-underline">
								<div class="col-md-6">Last submission on:</div>
								<div class="col-md-6 text-right"><span id="hia4sd_submitted"></span></div>
							</div>
							<div class="row row-underline">
								<div id="graph_hia4sd" class="graph-standard" style="width:100%;height:100px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane fade in" id="tab1">
		<!--  page title -->
		<div class="page-title">
			<h5><i class="fa fa-bars"></i> 10 Wards Dashboard <small>items</small></h5>
			<div class="btn-group">
				<a href="#" class="btn btn-link btn-lg btn-icon dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cogs"></i><span class="caret"></span></a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a id="link_addcontent" href="#">Add Content</a></li>
					<li><a href="#">Action 2</a></li>
				</ul>
			</div>
		</div>
		<!-- /page title -->
		<div class="tab-dynamic-data">
		<!-- statistics -->
		<div class="row">
		<div class="col-sm-12">
			<ul class="row stats">
				<li class="col-xs-3"><a href="#" class="btn btn-default tot_adult">0</a> <span>Adult Forms</span></li>
				<li class="col-xs-3"><a href="#" class="btn btn-default tot_child">0</a> <span>Child Forms</span></li>
				<li class="col-xs-3"><a href="#" class="btn btn-default tot_neonatal">0</a> <span>Neonatal Forms</span></li>
				<li class="col-xs-3"><a href="#" class="btn btn-default tot_total">0</a> <span>Total VA</span></li>
			</ul>
		</div>
		</div>
		<!-- /statistics -->
		<!-- panels tab 1-->
		<div class="row">
			<div class="col-md-6">
				<!-- Panel for table -->
			   	<div class="panel panel-default">
			   	<div class="panel-heading">
			  		<h6 class="panel-title">Table 1: Submission Summary</h6>
			   	<div class="dropdown pull-right">
			   	<a href="#" class="dropdown-toggle btn btn-link btn-icon" data-toggle="dropdown">
			   		<i class="fa fa-square-o"></i>
			       	<b class="caret"></b>
			   	</a>
			   	<ul class="dropdown-menu dropdown-menu-right">
				   	<li><a href="#">Download</a></li>
			   	</ul>
			   	</div>
			   	</div>
			   	<div class="table-responsive">
			   		<table id="va_summary1" class="va_summary" data-row-style="rowStyle"  data-striped="true" ></table>
			   	</div>
			   	</div>
			   	<!-- /Panel for table -->
			</div>
			<div class="col-md-6">
				<!-- Panel for graph -->
			   	<div class="panel panel-default">
				   	<div class="panel-heading">
				  		<h6 class="panel-title">Graph 1: VA % Distribution</h6>
				   	<div class="dropdown pull-right">
				   	<a href="#" class="dropdown-toggle btn btn-link btn-icon" data-toggle="dropdown">
				   		<i class="fa fa-square-o"></i>
				       	<b class="caret"></b>
				   	</a>
				   	<ul class="dropdown-menu dropdown-menu-right">
					   	<li><a href="#">Download</a></li>
				   	</ul>
				   	</div>
				   	</div>
				   	<div class="panel-body">
				   		<div class="graph-standard" id="vertical_bars1" style="width:100%;height:184px;"></div>
				   	</div>
			   	</div>
			   	<!-- /Panel for graph -->
			</div>
			<!-- Tab2: Table-->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Table: VA Submission Summary</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body" id="div_map1">
					<div style="margin-bottom: 10px; margin-right: 5px; float: right;">
					<div id="tblInterviewer1-toolbar" class="form-inline" role="form">
						<div class="form-group">
							<input type="text" class="form-control" id="txtSearch1"
								size=20 style="text-align: center">
							<button id="btnSearch1" class="btn btn-default">
								<i class="glyphicon glyphicon-search"></i> Interviewer
							</button>
							<button id="btnYearPrev1" class="btn btn-default">
								<i class="glyphicon glyphicon-chevron-left"></i> Prev
							</button>
							<input type="text" class="form-control" id="txtYear1" value="2020"
								size=4 style="text-align: center" readonly>
							<button id="btnYearNext1" class="btn btn-default">
								Next <i class="glyphicon glyphicon-chevron-right"></i>
							</button>
							<button id="btnExport1" class="btn btn-default">
								Export <i class="glyphicon glyphicon-export"></i>
							</button>
						</div>
					</div>
					</div>
					<table id="tblInterviewer1" ></table>
				</div>
			</div>
			</div>
			<!-- END -->
			<!-- Tab2: GRAPH -->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Graphs: Total Monthly Submission</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body">
					<div style="margin-bottom: 10px; margin-right: 5px; float: right;">
					<div class="form-inline" role="form">
						<div class="form-group">
							<button id="graphYearPrev1" class="btn btn-default">
								<i class="glyphicon glyphicon-chevron-left"></i> Prev
							</button>
							<input type="text" class="form-control" id="graphYear1" value="2020"
								size=4 style="text-align: center" readonly>
							<button id="graphYearNext1" class="btn btn-default">
								Next <i class="glyphicon glyphicon-chevron-right"></i>
							</button>
						</div>
					</div>
					</div>
					<div class="chart-container" style="clear:both;min-height:300px;max-height:300px;">
						<canvas id="chartMonthly1"></canvas>
					</div>
				</div>
			</div>
			</div>
			<!-- END GRAPH -->
			<!-- TAB3: VA Document -->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Table: VA Records</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body">
					<div class="varecords1_toolbar" style="margin-bottom: 10px; margin-right: 5px; float:right;">
						<div class="form-inline" role="form">
							<div class="form-group">
								<input id="searchVal1" type="text" class="form-control" placeholder="Search Key">
								<button id="searchBtn1" class="btn btn-default" type="button">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
								<button id="refreshBtn1" class="btn btn-default" type="button">
									<i class="fa fa-refresh" aria-hidden="true"></i>
								</button>
								<div style="float:left;margin-right:3px;">
								<select data-tags="true" id="searchBy1" name="searchBy1" class="format_select2_no_search">
									<option value='"RESPONDENT_BACKGR_GROUP_INTERVIEWER_ID10010A"'>Interviewer Name</option>
									<option value='"_URI"'>VA UUID</option>
								</select>
								</div>
							</div>
						</div>
					</div>
					<div>
						<table id="tblVARecords1"></table>
					</div>
				</div>
			</div>
			</div>
			</div>
		<!-- /panels -->	
	</div>
	</div>
	<div class="tab-pane fade in" id="tab2">
		<!--  page title -->
		<div class="page-title">
			<h5><i class="fa fa-bars"></i> Iringa Dashboard <small>items</small></h5>
			<div class="btn-group">
				<a href="#" class="btn btn-link btn-lg btn-icon dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cogs"></i><span class="caret"></span></a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a href="#"><i class="fa fa-refresh"></i>Refresh</a></li>
					<li><a href="#" data-toggle='modal' data-target='#div_configtab'><i class="fa fa-cog"></i>Configure</a></li>
				</ul>
			</div>
		</div>
		<!-- /page title -->
		<div class="tab-dynamic-data">
			<!-- statistics -->
			<div class="row">
			<div class="col-sm-12">
				<ul class="row stats">
					<li class="col-xs-3"><a href="#" class="btn btn-default tot_adult">0</a> <span>Adult Forms</span></li>
					<li class="col-xs-3"><a href="#" class="btn btn-default tot_child">0</a> <span>Child Forms</span></li>
					<li class="col-xs-3"><a href="#" class="btn btn-default tot_neonatal">0</a> <span>Neonatal Forms</span></li>
					<li class="col-xs-3"><a href="#" class="btn btn-default tot_total">0</a> <span>Total VA</span></li>
				</ul>
			</div>
			</div>
			<!-- /statistics -->
			<!-- panels -->
			<div class="row">
			<div class="col-md-6">
				<!-- Panel for table -->
			   	<div class="panel panel-default">
			   	<div class="panel-heading">
			  		<h6 class="panel-title">Table 1: Submission Summary</h6>
			   	<div class="dropdown pull-right">
			   	<a href="#" class="dropdown-toggle btn btn-link btn-icon" data-toggle="dropdown">
			   		<i class="fa fa-square-o"></i>
			       	<b class="caret"></b>
			   	</a>
			   	<ul class="dropdown-menu dropdown-menu-right">
				   	<li><a href="#">Download</a></li>
			   	</ul>
			   	</div>
			   	</div>
			   	<div class="table-responsive">
			   		<table id="va_summary2" class="va_summary" data-row-style="rowStyle"  data-striped="true" ></table>
			   	</div>
			   	</div>
			   	<!-- /Panel for table -->
			</div>
			<div class="col-md-6">
				<!-- Panel for graph -->
			   	<div class="panel panel-default">
				   	<div class="panel-heading">
				  		<h6 class="panel-title">Graph 1: VA % Distribution</h6>
				   	<div class="dropdown pull-right">
				   	<a href="#" class="dropdown-toggle btn btn-link btn-icon" data-toggle="dropdown">
				   		<i class="fa fa-square-o"></i>
				       	<b class="caret"></b>
				   	</a>
				   	<ul class="dropdown-menu dropdown-menu-right">
					   	<li><a href="#">Download</a></li>
				   	</ul>
				   	</div>
				   	</div>
				   	<div class="panel-body">
				   		<div class="graph-standard" id="vertical_bars2" style="width:100%;height:184px;"></div>
				   	</div>
			   	</div>
			   	<!-- /Panel for graph -->
			</div>
			<!-- Tab2: Table-->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Table: VA Submission Summary</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body" id="div_map2">
					<div style="margin-bottom: 10px; margin-right: 5px; float: right;">
					<div id="tblInterviewer2-toolbar" class="form-inline" role="form">
						<div class="form-group">
							<input type="text" class="form-control" id="txtSearch2"
								size=20 style="text-align: center">
							<button id="btnSearch2" class="btn btn-default">
								<i class="glyphicon glyphicon-search"></i> Interviewer
							</button>
							<button id="btnYearPrev2" class="btn btn-default">
								<i class="glyphicon glyphicon-chevron-left"></i> Prev
							</button>
							<input type="text" class="form-control" id="txtYear2" value="2020"
								size=4 style="text-align: center" readonly>
							<button id="btnYearNext2" class="btn btn-default">
								Next <i class="glyphicon glyphicon-chevron-right"></i>
							</button>
							<button id="btnExport2" class="btn btn-default">
								Export <i class="glyphicon glyphicon-export"></i>
							</button>
						</div>
					</div>
					</div>
					<table id="tblInterviewer2" ></table>
				</div>
			</div>
			</div>
			<!-- END -->
			<!-- Tab2: GRAPH -->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Graphs: Total Monthly Submission</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body">
					<div style="margin-bottom: 10px; margin-right: 5px; float: right;">
					<div class="form-inline" role="form">
						<div class="form-group">
							<button id="graphYearPrev2" class="btn btn-default">
								<i class="glyphicon glyphicon-chevron-left"></i> Prev
							</button>
							<input type="text" class="form-control" id="graphYear2" value="2020"
								size=4 style="text-align: center" readonly>
							<button id="graphYearNext2" class="btn btn-default">
								Next <i class="glyphicon glyphicon-chevron-right"></i>
							</button>
						</div>
					</div>
					</div>
					<div class="chart-container" style="clear:both;min-height:300px;max-height:300px;">
						<canvas id="chartMonthly2"></canvas>
					</div>
				</div>
			</div>
			</div>
			<!-- END GRAPH -->
			<!-- TAB3: VA Document -->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Table: VA Records</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body">
					<div class="varecords2_toolbar" style="margin-bottom: 10px; margin-right: 5px; float:right;">
						<div class="form-inline" role="form">
							<div class="form-group">
								<input id="searchVal2" type="text" class="form-control" placeholder="Search Key">
								<button id="searchBtn2" class="btn btn-default" type="button">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
								<button id="refreshBtn2" class="btn btn-default" type="button">
									<i class="fa fa-refresh" aria-hidden="true"></i>
								</button>
								<div style="float:left;margin-right:3px;">
								<select data-tags="true" id="searchBy2" name="searchBy2" class="format_select2_no_search">
									<option value='"RESPONDENT_BACKGR_ID10010"'>Interviewer Name</option>
									<option value='"_URI"'>VA UUID</option>
								</select>
								</div>
							</div>
						</div>
					</div>
					<div>
						<table id="tblVARecords2"></table>
					</div>
				</div>
			</div>
			</div>
			</div>
			<!-- /panels -->
		</div>

	</div>
	<div class="tab-pane fade in" id="tab3">
		<!-- page title -->
		<div class="page-title">
			<h5><i class="fa fa-bars"></i> HIA4SD Dashboard <small>items</small></h5>
			<div class="btn-group">
				<a href="#" class="btn btn-link btn-lg btn-icon dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cogs"></i><span class="caret"></span></a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a href="#"><i class="fa fa-refresh"></i>Refresh</a></li>
					<li><a href="#" data-toggle='modal' data-target='#div_configtab'><i class="fa fa-cog"></i>Configure</a></li>
				</ul>
			</div>
		</div>
		<!-- /page title -->
		<div class="tab-dynamic-data">
			<!-- Statistics -->
			<div class="row">
			<div class="col-sm-12">
				<ul class="row stats">
					<li class="col-xs-3"><a href="#" class="btn btn-default tot_adult">0</a> <span>Adult Forms</span></li>
					<li class="col-xs-3"><a href="#" class="btn btn-default tot_child">0</a> <span>Child Forms</span></li>
					<li class="col-xs-3"><a href="#" class="btn btn-default tot_neonatal">0</a> <span>Neonatal Forms</span></li>
					<li class="col-xs-3"><a href="#" class="btn btn-default tot_total">0</a> <span>Total VA</span></li>
				</ul>
			</div>
			</div>
			<!-- Tab3: Table 1 -->
			<div class="row">
			<div class="col-md-6">
				<!-- Panel for table -->
			   	<div class="panel panel-default">
			   	<div class="panel-heading">
			  		<h6 class="panel-title">Table 1: Submission Summary</h6>
			   	<div class="dropdown pull-right">
			   	<a href="#" class="dropdown-toggle btn btn-link btn-icon" data-toggle="dropdown">
			   		<i class="fa fa-square-o"></i>
			       	<b class="caret"></b>
			   	</a>
			   	<ul class="dropdown-menu dropdown-menu-right">
				   	<li><a href="#">Download</a></li>
			   	</ul>
			   	</div>
			   	</div>
			   	<div class="table-responsive">
			   		<table id="va_summary3" class="va_summary" data-row-style="rowStyle"  data-striped="true" ></table>
			   	</div>
			   	</div>
			   	<!-- /Panel for table -->
			</div>
			<div class="col-md-6">
				<!-- Panel for graph -->
			   	<div class="panel panel-default">
				   	<div class="panel-heading">
				  		<h6 class="panel-title">Graph 1: VA % Distribution</h6>
				   	<div class="dropdown pull-right">
				   	<a href="#" class="dropdown-toggle btn btn-link btn-icon" data-toggle="dropdown">
				   		<i class="fa fa-square-o"></i>
				       	<b class="caret"></b>
				   	</a>
				   	<ul class="dropdown-menu dropdown-menu-right">
					   	<li><a href="#">Download</a></li>
				   	</ul>
				   	</div>
				   	</div>
				   	<div class="panel-body">
				   		<div class="graph-standard" id="vertical_bars3" style="width:100%;height:184px;"></div>
				   	</div>
			   	</div>
			   	<!-- /Panel for graph -->
			</div>
			<!-- MAP -->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Table: VA Submission Summary</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body" id="div_map3">
					<div style="margin-bottom: 10px; margin-right: 5px; float: right;">
					<div id="tblInterviewer3-toolbar" class="form-inline" role="form">
						<div class="form-group">
							<input type="text" class="form-control" id="txtSearch3"
								size=20 style="text-align: center">
							<button id="btnSearch3" class="btn btn-default">
								<i class="glyphicon glyphicon-search"></i> Interviewer
							</button>
							<button id="btnYearPrev3" class="btn btn-default">
								<i class="glyphicon glyphicon-chevron-left"></i> Prev
							</button>
							<input type="text" class="form-control" id="txtYear3" value="2020"
								size=4 style="text-align: center" readonly>
							<button id="btnYearNext3" class="btn btn-default">
								Next <i class="glyphicon glyphicon-chevron-right"></i>
							</button>
							<button id="btnExport3" class="btn btn-default">
								Export <i class="glyphicon glyphicon-export"></i>
							</button>
						</div>
					</div>
					</div>
					<table id="tblInterviewer3"></table>
				</div>
			</div>
			</div>
			<!-- END -->
			<!-- Tab 3:GRAPH -->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Graphs: Total Monthly Submission</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body">
				
					<div style="margin-bottom: 10px; margin-right: 5px; float: right;">
					<div class="form-inline" role="form">
						<div class="form-group">
							<button id="graphYearPrev3" class="btn btn-default">
								<i class="glyphicon glyphicon-chevron-left"></i> Prev
							</button>
							<input type="text" class="form-control" id="graphYear3" value="2020"
								size=4 style="text-align: center" readonly>
							<button id="graphYearNext3" class="btn btn-default">
								Next <i class="glyphicon glyphicon-chevron-right"></i>
							</button>
						</div>
					</div>
					</div>
					
					<div class="chart-container" style="clear:both;min-height:300px; max-height:300px;">
						<canvas id="chartMonthly3"></canvas>
					</div>
				</div>
			</div>
			</div>
			<!-- END GRAPH -->
			
			<!-- Tab3: VA Document -->
			<div class="col-md-12 div-to-close">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h6 class="panel-title">Table: VA Records</h6>
					<div class="pull-right">
						<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
					</div>
				</div>
				<div class="panel-body">
					<div class="varecords3_toolbar" style="margin-bottom: 10px; margin-right: 5px; float:right;">
						<div class="form-inline" role="form">
							<div class="form-group">
								<input id="searchVal3" type="text" class="form-control" placeholder="Search Key">
								<button id="searchBtn3" class="btn btn-default" type="button">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
								<button id="refreshBtn3" class="btn btn-default" type="button">
									<i class="fa fa-refresh" aria-hidden="true"></i>
								</button>
								<div style="float:left;margin-right:3px;">
								<select data-tags="true" id="searchBy3" name="searchBy3" class="format_select2_no_search">
									<option value='"RESPONDENT_BACKGR_ID10010"'>Interviewer Name</option>
									<option value='"_URI"'>VA UUID</option>
								</select>
								</div>
							</div>
						</div>
					</div>
					<div>
						<table id="tblVARecords3"></table>
					</div>
				</div>
			</div>
			</div>
			<!-- END TABLE -->
			</div>
		</div>
	</div>


</div><!-- /page content -->
<!-- footer -->
	<div class="footer">
		&copy; Copyright 2017. All rights reserved. <a href="#" title="">CRVS</a>
	</div><!-- /footer -->
<!-- /footer -->
</div><!-- /page container -->
</div><!-- /page container -->
<!-- Modal Panels -->
<!-- Configure tab -->
<div id="div_configtab" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog modal-md">

<form class="form-horizontal" action="#" id="frm_configtab">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h5 class="modal-title">Config Tab</h5>
	</div>
	<div class="modal-body has-padding" style="background-color:#fff;min-height:400px;">
		<div class="form-group">
		    <label class="control-label col-sm-4 text-right" for="ttitle">Title:</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="tab_name" value="Iringa" placeholder="Enter title">
		    </div>
		    <i class="fa fa-warning text-danger"></i>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-4 text-right" for="tform">Select ODK Form:</label>
		    <div class="col-sm-4">
		      <select id="odk_forms" role="select" class="format_select2_no_search odk_forms">
		      </select>
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-4 col-sm-8">
			    <label>
			      <input type="checkbox" checked> &nbsp; Enclose quotation (") in database object names
			    </label>
			</div>
		</div>
		
		<div class="form-group">
		    <div class="col-sm-offset-4 col-sm-8">
			    <button class="btn btn-default"><i class="fa fa-refresh"></i> &nbsp; Test</button>
			</div>
		</div>		
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-default" aria-hidden="true" id="btnSubmitTabSettings">Save</button>
		<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
	</div>
</form>

</div>
</div>
<!-- /Configure tab -->
<!-- Create table -->
<div id="div_createtable" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog modal-lg">
<div class="modal-header">
 	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h5 class="modal-title">Add Content</h5>
</div>
<div class="modal-body has-padding" style="background-color:#fff;min-height:400px;">
	<!-- Sample text from -->
	<!-- https://www.bootply.com/kDgDOLZGKq -->
	<div class="row">
		<div id="MainMenu" class="col-sm-3">
			<div class="list-group panel">
				<a href="#demo1" class="list-group-item strong" data-toggle="collapse" data-parent="#MainMenu"> Type <i class="fa fa-caret-right"></i></a>
				<div class="collapse list-group-submenu" id="demo1">
					<a href="#" class="list-group-item"><input type="checkbox">&nbsp; bar</a>
					<a href="#" class="list-group-item"><input type="checkbox">&nbsp; pie</a>
				</div>
				<a href="#demo2" class="list-group-item strong" data-toggle="collapse" data-parent="#MainMenu"> Data <i class="fa fa-caret-right"></i></a>
				<div class="collapse list-group-submenu" id="demo2">
					<a href="#" class="list-group-item"><input type="checkbox" class="datatype" name="datatype" value="va_data">&nbsp; VA Data</a>
					<a href="#" class="list-group-item"><input type="checkbox" class="datatype" name="datatype" value="va_data">&nbsp; GPS Coverage</a>
					<a href="#" class="list-group-item"><input type="checkbox" class="datatype" name="datatype" value="in_data">&nbsp; Interviewer Data</a>
				</div>
				<a href="#demo3" class="list-group-item strong" data-toggle="collapse" data-parent="#MainMenu"> Period <i class="fa fa-caret-right"></i></a>
				<div class="collapse list-group-submenu" id="demo3">
					<a href="#" class="list-group-item"><input type="checkbox">&nbsp; This Week</a>
					<a href="#" class="list-group-item"><input type="checkbox">&nbsp; This Month</a>
					<a href="#" class="list-group-item"><input type="checkbox">&nbsp; This Month</a>
				</div>
				<a href="#demo4" class="list-group-item strong" data-toggle="collapse" data-parent="#MainMenu"> Filter By <i class="fa fa-caret-right"></i></a>
				<div class="collapse list-group-submenu" id="demo4">
					<a href="#" class="list-group-item"><input type="checkbox">&nbsp; Region</a>
					<a href="#" class="list-group-item"><input type="checkbox">&nbsp; District</a>
				</div>
				<a href="#" id="btn-create-content" class="list-group-item strong" data-parent="#MainMenu"> Run </a>
			</div>
		</div>
		<div id="div-create-content" class="col-sm-9">Content</div>
	</div>
</div>
</div>
</div>
<!-- end create table panel -->
<!-- display VA Record -->
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
					<h5>D2 Serial No: 		<span id="summary-va-d2sn" 		class="text-primary"></span> </h5>
					<h5>Interviewer Name:	<span id="summary-int-name" 	class="text-primary"></span> </h5>
					<h5>Interviewer Phone:	<span id="summary-int-phone" 	class="text-primary"></span> </h5>
					<h5>Respondent Name:	<span id="summary-res-name" 	class="text-primary"></span> </h5>
					<h5>Respondent Phone:	<span id="summary-res-phone" 	class="text-primary"></span> </h5>
					<h5>Interview Date:		<span id="summary-int-date" 	class="text-primary"></span> </h5>
					<h5>Interview Start:	<span id="summary-int-start" 	class="text-primary"></span> </h5>
					<h5>Interview End:		<span id="summary-int-end" 		class="text-primary"></span> </h5>
					<h5>Interview Time:		<span id="summary-int-time" 	class="text-primary"></span> </h5>
					<h5>GPS Accuracy		<span id="summary-gps-acc" 		class="text-primary"></span> </h5>
					<h5>Narrative:			<span id="summary-int-narr" 	class="text-primary"></span> </h5>
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
<!-- end display VA Record -->
<!-- End Modal Panels -->
<!-- /page container -->

<!-- scripts -->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/jquery.csv.min.js"></script>

<script type="text/javascript" src="../js/plugins/forms/validate.min.js"></script>

<script type="text/javascript" src="../js/plugins/charts/flot.js"></script>
<script type="text/javascript" src="../js/plugins/charts/flot.resize.min.js"></script>
<script type="text/javascript" src="../js/plugins/charts/flot.axislabels.js"></script>

<script type="text/javascript" src="../js/plugins/interface/bootstrap-table.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/collapsible.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/tableExport.min.js"></script>


<script type="text/javascript" src="../js/plugins/forms/select2.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/mapping-whova.js"></script>
<script type="text/javascript" src="../js/mapping-smartva.js"></script>

<script type="text/javascript" src="charts/chart.min.js"></script>

<!-- Maps API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3_DTfoa67pA6kh6Azrzkc1l2PfPNzZl0"></script>

<script>
$(document).ready(function(){
	var isLoading;
	var maxYear = 2020;
	var minYear = 2017;
	var dataModel;
	
	//testing
	//$("#tab-list").tabs();
	//$("#tab-list").find(".ui-tabs-nav li:eq(" + 0 + ")").remove();
	//$("#tab-list").tabs("refresh");
	
	// VAType 1=WHOVA, 2=SmartVA
	var vatype = <%=Settings.va_type%>;
	var admin_level1 = <%=Settings.admin_level1%>;
	var admin_level2 = <%=Settings.admin_level2%>;
	var admin_level3 = <%=Settings.admin_level3%>;
	
	var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
	
	
	var gRequestData = {
			 rtype:12,
			 tblName:"",
			 dateCol:"",
			 intYear:maxYear
	}
	
	//ODK forms
	var odk_forms = ['"WHOVAV14TZ_CORE2"','"WHOVA151_CORE"','"HIA4SD_CORE"'];
	
	//===Button Events====//
	//tab 1
	$("#btnYearNext1").click(function(e){
		if( +$("#txtYear1").val()+1 > maxYear ){
			return;
		}else{
			$("#txtYear1").val( +$("#txtYear1").val()+1 );
		}
		//Refresh bootstrap
		$("#tblInterviewer1").bootstrapTable('refresh');
	})
	$("#btnYearPrev1").click(function(){
		
		if( +$("#txtYear1").val() - 1 < minYear ){
			return;
		}else{
			$("#txtYear1").val(+$("#txtYear1").val() - 1)
		}
		
		//Refresh boostrap
		$("#tblInterviewer1").bootstrapTable('refresh');
	})
	//tab 2
	$("#btnYearNext2").click(function(e){
		if( +$("#txtYear2").val()+1 > maxYear ){
			return;
		}else{
			$("#txtYear2").val( +$("#txtYear2").val()+1 );
		}
		//Refresh bootstrap
		$("#tblInterviewer2").bootstrapTable('refresh');
	})
	$("#btnYearPrev2").click(function(){
		
		if( +$("#txtYear2").val() - 1 < minYear ){
			return;
		}else{
			$("#txtYear2").val(+$("#txtYear2").val() - 1)
		}
		
		//Refresh boostrap
		$("#tblInterviewer2").bootstrapTable('refresh');
	})
	//tab 3
	$("#btnYearNext3").click(function(e){
		if( +$("#txtYear3").val()+1 > maxYear ){
			return;
		}else{
			$("#txtYear3").val( +$("#txtYear3").val()+1 );
		}
		//Refresh bootstrap
		$("#tblInterviewer3").bootstrapTable('refresh');
	})
	$("#btnYearPrev3").click(function(){
		
		if( +$("#txtYear3").val() - 1 < minYear ){
			return;
		}else{
			$("#txtYear3").val(+$("#txtYear3").val() - 1)
		}
		
		//Refresh boostrap
		$("#tblInterviewer3").bootstrapTable('refresh');
	})
	
	//Table 1: VA records
	$("#searchBtn1").click(function(){
		if( !$("#searchVal1").val() ){
			alert("Search string is emtpy");
			return;
		}
		$("#tblVARecords1").bootstrapTable('refresh');
	});
	$("#refreshBtn1").click(function(){
		$("#searchVal1").val("");
		$("#tblVARecords1").bootstrapTable('refresh');
	});
	//Table 2: VA records 
	$("#searchBtn2").click(function(){
		if( !$("#searchVal2").val() ){
			alert("Search string is emtpy");
			return;
		}
		$("#tblVARecords2").bootstrapTable('refresh');
	});
	$("#refreshBtn2").click(function(){
		$("#searchVal2").val("");
		$("#tblVARecords2").bootstrapTable('refresh');
	});
	//Table 3: VA Records
	$("#searchBtn3").click(function(){
		if( !$("#searchVal3").val() ){
			alert("Search string is emtpy");
			return;
		}
		$("#tblVARecords3").bootstrapTable('refresh');
	});
	$("#refreshBtn3").click(function(){
		$("#searchVal3").val("");
		$("#tblVARecords3").bootstrapTable('refresh');
	});
	//End Table VA Records
	
	//Table Interviewer
	//tab 1
	$("#btnSearch1").click(function(){
		$("#tblInterviewer1").bootstrapTable('refresh');
	})
	$("#btnSearch1").click(function(){
		$("#tblInterviewer1").bootstrapTable('refresh');
	})
	$("#graphYearPrev1").click(function(){
		if( +$("#graphYear1").val() - 1 > maxYear ){
			return;
		}else{
			$("#graphYear1").val(+$("#graphYear1").val() - 1)
		}
		
		//Refresh graph
		gRequestData.intYear = $("#graphYear1").val();
		updateGraph(gRequestData);
	});
	
	$("#graphYearNext1").click(function(){
		if( +$("#graphYear1").val() + 1 > maxYear ){
			return;
		}else{
			$("#graphYear1").val(+$("#graphYear1").val() + 1)
		}
		
		//Refresh graph
		gRequestData.intYear = $("#graphYear1").val();
		updateGraph(gRequestData);
	});
	//
	//tab 2
	$("#btnSearch2").click(function(){
		$("#tblInterviewer2").bootstrapTable('refresh');
	})
	$("#btnSearch3").click(function(){
		$("#tblInterviewer3").bootstrapTable('refresh');
	})
	$("#graphYearPrev2").click(function(){
		if( +$("#graphYear2").val() - 1 > maxYear ){
			return;
		}else{
			$("#graphYear2").val(+$("#graphYear2").val() - 1)
		}
		
		//Refresh graph
		gRequestData.intYear = $("#graphYear2").val();
		updateGraph(gRequestData);
	});
	
	$("#graphYearNext2").click(function(){
		if( +$("#graphYear2").val() + 1 > maxYear ){
			return;
		}else{
			$("#graphYear2").val(+$("#graphYear2").val() + 1)
		}
		
		//Refresh graph
		gRequestData.intYear = $("#graphYear2").val();
		updateGraph(gRequestData);
	});
	
	//
	//tab 3
	$("#graphYearPrev3").click(function(){
		if( +$("#graphYear3").val() - 1 > maxYear ){
			return;
		}else{
			$("#graphYear3").val(+$("#graphYear3").val() - 1)
		}
		
		//Refresh graph
		gRequestData.intYear = $("#graphYear3").val();
		updateGraph(gRequestData);
	});
	
	$("#graphYearNext3").click(function(){
		if( +$("#graphYear3").val() + 1 > maxYear ){
			return;
		}else{
			$("#graphYear3").val(+$("#graphYear3").val() + 1)
		}
		
		//Refresh graph
		gRequestData.intYear = $("#graphYear3").val();
		updateGraph(gRequestData);
	});
	
	//table export
	//tab 1
	$("#btnExport1").click(function(){
		$("#tblInterviewer1").tableExport({
			type:'csv',
			escape:false,
			fileName:'vadata_iringa'
		});
	})
	//tab 2
	$("#btnExport2").click(function(){
		$("#tblInterviewer2").tableExport({
			type:'csv',
			escape:false,
			fileName:'vadata_iringa'
		});
	})
	//tab 3
	$("#btnExport3").click(function(){
		$("#tblInterviewer3").tableExport({
			type:'csv',
			escape:false,
			fileName:'vadata_hia4sd'
		});
	})
	
	 $('.list-group-item').on('click', function () {
         if ($(this).children('i:first').hasClass('fa-caret-right')) {
             $(this).children('i:first').removeClass('fa-caret-right').addClass('fa-caret-down');
         }else{
             $(this).children('i:first').removeClass('fa-caret-down').addClass('fa-caret-right');
         }
     });
	 
	 $('#btn-create-content').on('click',function(e){
		 e.preventDefault();
		 //$("#div-create-content").text("hellow");
		 var postdata = {
				 qtype:'gps_coverage',
				 tablename: 'tablename',
				 columns:['col1','col2']
		 }
		 $.ajax({
			type:"POST",
			url:"../GetChartData",
			data:postdata,
			datatype:"json",
			success:function(data){
				console.log(data);
			}
		});
		 
	 });
	 
	 //$('.fa-caret-right').on('click', function () {
      //   if ($(this).hasClass('fa-caret-right')) {
      //       $(this).removeClass('fa-caret-right').addClass('fa-caret-down');
      //   }else{
      //       $(this).removeClass('fa-caret-down').addClass('fa-caret-right');
      //   }
     //});
	 
	
	$(document).on('click','.panel-btn-close',function(e) {
     	$(this).closest("div.div-to-close").remove();
     	e.preventDefault();
	});
	
	$('.datatype').click(function() {
        $('.datatype').not(this).prop('checked', false);
    });
	//===== Collapsible navigation =====//
	
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
	
	
	//========= Start Here ===========//
	var userId = <%=userId%>
	var userType = <%=roleId%>
	
	//For coder's only:Physicians
	if(userType==2){
		getCoderSummary(userId);
	}
	
	$(".format_select2").select2({
		width:"100%"
	});
	$(".format_select2_no_search").select2({
		width:"100%",
		minimumResultsForSearch: -1

	});
	
	//Load counts
	setFormSummaryData(odk_forms);
	
	//Page Settings	
	$("#pageTitle").text( <%=Settings.page_title%> );
	$("#pageSubTitle").text( <%=Settings.page_sub_title%> );
	$(".logout").click(function(){
		$.ajax({
			type:"POST",
			url:"../UserMethods",
			data:{ "rtype":2 },
			datatype:"json"
		});
		window.location.replace("../");
	})
	
	// ===== tab configuratons ======/
	 $('#div_configtab').on('show.bs.modal', function () {
		 isLoading = true;
		 $.ajax({
				type:"POST",
				url:"../VAMethods",
				data:{ "rtype":41 },
				datatype:"json",
				success:function(data){
					$("#odk_forms").empty();
					$.each(data,function(indx,form){
						$("#odk_forms").append("<option value='"+form.name+"'>"+form.name+"</option>");
					})
				},error: function(xhr, ajaxOptions, thrownError){
					alert(xhr.status);
				}
			});
		 isLoading = false;
	});
	

	 $("#odk_forms").on('change',function(){
		 if(isLoading)
			 return;
	 })
	 
	 // On row click, store URI (row unique ID)
	 $("#tblVARecords2").on('click-row.bs.table', function(e, row, $element){
		 //alert(JSON.stringify(row))
		 displayVARecord(row)
	 });
	 $("#tblVARecords3").on('click-row.bs.table', function(e, row, $element){
		 displayVARecord(row)
	 });
	 
	 function setFormSummaryData(forms){
		 $.ajax({
				type:"POST",
				url:"../Config",
				data: { 
					"rtype":"formsummary",
					"forms":JSON.stringify(forms)
				},
				datatype:"json",
				success: function(data){
					$.each(data,function(indx,form){
						switch(form.name){
						case '"WHOVAV14TZ_CORE2"':
							$("#tenwards_total").text(form.total);
							$("#tenwards_submitted").text(form.submitted);
							drawMiniGraph("#graph_ten_wards",form.monthly_submission);
							break;
						case '"WHOVA151_CORE"':
							$("#iringa_total").text(form.total);
							$("#iringa_submitted").text(form.submitted);
							drawMiniGraph("#graph_iringa",form.monthly_submission);
							break;
						case '"HIA4SD_CORE"':
							$("#hia4sd_total").text(form.total);
							$("#hia4sd_submitted").text(form.submitted);
							drawMiniGraph("#graph_hia4sd",form.monthly_submission);
							break;
						}
					})
				},
				error: function(xhr, status, error){
					
				}
			});	
	 }
	 function drawMiniGraph(placeholder,data){
		 
		 var dataset = new Array();
		     dataset.push({
		    	data:data,
		    	bars: {
		    		show: true,
		    		align:"center",
		    		barWidth:0.8
		    	}
		 })
		 var options = {
    		series: {
        		lines: { show: false },
        		points: { show: false }
    		},
    		xaxes:[
    			{ 	tickSize:1,
    				minTickSize: [1, "month"],
    				min:1,
    				max:12,
    				font: { size: 11 },
    				ticks: [[1,"Jan"],[2,"Feb"],[3,"Mar"],[4,"Apr"],[5,"May"],[6,"Jun"],[7,"Jul"],[8,"Aug"],[9,"Sep"],[10,"Oct"],[11,"Nov"],[12,"Dec"]]
    			}
    		]
		};
		 $.plot(placeholder,dataset, options);
	 }
	 function displayVARecord(row){
		 //clear
		 $("#summary-int-narr").text("");
		 //
		 $("#summary-va-id").text( row['_URI'] );
		 $("#summary-va-d2sn").text( row['D2_SN'] );
		 $("#summary-int-name").text( row['RESPONDENT_BACKGR_ID10010'] );
		 $("#summary-int-phone").text( row['RESPONDENT_BACKGR_ID10010_PHONE'] );
		 
		 $("#summary-res-name").text( row['RESPONDENT_BACKGR_ID10007'] );
		 $("#summary-res-phone").text( row['RESPONDENT_BACKGR_ID10007_PHONE'] );
		 
		 $("#summary-int-date").text( row['_SUBMISSION_DATE'] );
		 $("#summary-int-start").text( row['START_TIME'] );
		 $("#summary-int-end").text( row['END'] );
		 $("#summary-int-time").text( timeDifference(row['START_TIME'],row['END']) );
		 $("#summary-gps-acc").text( row['GPS_LOCATION_ACC'] );
		 $("#summary-int-narr").text( row['CONSENTED_NARRAT_ID10476'] );
		 
		 if( row['CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_ADULT']==1){
			 $("#summary-va-type").text( "Adult" );
		 }else if( row['CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_CHILD']==1){
			 $("#summary-va-type").text( "Child" );
		 }else if( row['CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_NEONATAL']==1){
			 $("#summary-va-type").text( "Neonate" );
		 }else{
			 $("#summary-va-type").text( row['CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_AGE_GROUP'] );	 
		 }
		 
		 $("#tbl-va-view").bootstrapTable('destroy');
		 switch(vatype){
			case 1:
				$("#tbl-va-view").bootstrapTable({
					data:renderWHOVA(row,false)
				})
				break;
			case 2:
				$("#tbl-va-view").bootstrapTable({
					data:renderSmartVA(row)
				})
				break;
			}
	 }
	 
	 $("#frm_configtab").submit(function(e){
		 e.preventDefault();
		 var tab = {
				 "name":$("#tab_name").val(),
				 "form":$("#odk_forms").val()
		 };
		 $.ajax({
				type:"POST",
				url:"../Config",
				data: { 
					"rtype":"savetabs",
					"tab":JSON.stringify(tab)
				},
				datatype:"json",
				success: function(data){
						//$("#myTables").append("<li><a href='#'>Table 3</a></li>");
				},
				error: function(xhr, status, error){
					
				}
			});
		 $("#div_configtab").modal("hide");
		 return false;
	 })
	 
	 
	 $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  var target = $(e.target).attr("href") // activated tab
		  //alert(target);
		  
		  var formName,dateColumn;
		  var columns1 = [];
		  var columns2 = [];
		  var opts = {};
		  
		  switch(target){
		  case "#tab1":
			  opts = {
				tabId:1,
				tblName:'"WHOVAV14TZ_CORE2"',
				colDate:'"_SUBMISSION_DATE"',
				colGAcc:'"RESPONDENT_BACKGR_GPS_LOCATION_ACC"',
				colIntv:'"RESPONDENT_BACKGR_GROUP_INTERVIEWER_ID10010A"',
				colReg :'"CONSNTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057_GRUP_ID10057_R"',
				colDist:'"CONSNTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057_GRUP_ID10057_D"',
				colDoD:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10023"'
		      };
			  
			  columns1 = [
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_NEONATAL"',shortname:'neonatal'},
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_CHILD"', shortname:'child'},
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_ADULT"', shortname:'adult'}
			  ];
			  columns2 = [
					{name:'"RESPONDENT_BACKGR_GROUP_INTERVIEWER_ID10010A"',shortname:'interviewer_name'},
					{name:'"CONSNTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057_GRUP_ID10057_R"',shortname:'death_loc_level1'},
					{name:'"CONSNTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057_GRUP_ID10057_D"',shortname:'death_loc_level2'}
			  ];
			  
			  //graph request data
			  gRequestData.tblName = opts.tblName;
			  gRequestData.dateCol = opts.colDate;
			  gRequestData.dateDoD = opts.colDoD;
			  
			  loadData(opts.tblName,opts.colDate,columns1,opts.tabId);
			  loadInterviewerSummary(opts.tblName,opts.colIntv,columns2,opts.colDate,opts.tabId);
			  getGraphData(gRequestData,opts.tabId);
			  loadVARecords(opts);
			  
			  break;
		  case "#tab2":
			  opts = {
				  tabId:2,
				  tblName:'"WHOVA151_CORE"',
				  colDate:'"_SUBMISSION_DATE"',
				  colGAcc:'"GPS_LOCATION_ACC"',
				  colIntv:'"RESPONDENT_BACKGR_ID10010"',
				  colReg :'"RESPONDENT_BACKGR_ID10005_R"',
				  colDist:'"RESPONDENT_BACKGR_ID10005_D"',
				  colDoD:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10023"'
		  	  };
			  
			  columns1 = [
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_NEONATAL"',shortname:'neonatal'},
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_CHILD"', shortname:'child'},
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_ADULT"', shortname:'adult'}
			  ];
			  columns2 = [
					{name:'"RESPONDENT_BACKGR_ID10010"',shortname:'interviewer_name'},
					{name:'"RESPONDENT_BACKGR_ID10005_R"',shortname:'death_loc_level1'},
					{name:'"RESPONDENT_BACKGR_ID10005_D"',shortname:'death_loc_level2'}
			  ];
			  
			  //graph request data
			  gRequestData.tblName = opts.tblName;
			  gRequestData.dateCol = opts.colDate;
			  gRequestData.dateDoD = opts.colDoD;
			  
			  loadData(opts.tblName,opts.colDate,columns1,opts.tabId);
			  loadInterviewerSummary(opts.tblName,opts.colIntv,columns2,opts.colDate,opts.tabId);
			  getGraphData(gRequestData,opts.tabId);
			  loadVARecords(opts);
			  break;
		  case "#tab3":
			  opts = {
				tabId:3,
				tblName:'"HIA4SD_CORE"',
			    colDate:'"_SUBMISSION_DATE"',
			    colGAcc:'"GPS_LOCATION_ACC"',
			    colIntv:'"RESPONDENT_BACKGR_ID10010"',
			    colReg :'"RESPONDENT_BACKGR_ID10005_R"',
			    colDist:'"RESPONDENT_BACKGR_ID10005_D"',
			    colDoD:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10023"'
		  	  }
			  //dataModel = getDataModel(tblName);
			  columns1 = [
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_NEONATAL"',shortname:'neonatal'},
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_CHILD"', shortname:'child'},
				  { name:'"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_ADULT"', shortname:'adult'}
			  ];
			  
			  columns2 = [
				  {name:'"RESPONDENT_BACKGR_ID10010"',shortname:'interviewer_name'},
				  {name:'"RESPONDENT_BACKGR_ID10005_R"',shortname:'death_loc_level1'},
				  {name:'"RESPONDENT_BACKGR_ID10005_D"',shortname:'death_loc_level2'}
			  ];
			  
			  gRequestData.tblName = opts.tblName;
			  gRequestData.dateCol = opts.colDate;
			  gRequestData.dateDoD = opts.colDoD;
			  
			  loadData(opts.tblName,opts.colDate,columns1,opts.tabId);
			  loadInterviewerSummary(opts.tblName,opts.colIntv,columns2,opts.colDate,opts.tabId);
			  getGraphData(gRequestData,opts.tabId);
			  loadVARecords(opts);  
			  break;
		  }
		  //get tab data
		  
		  
	 });
	 function timeDifference(time_sta,time_end){
		 try{
			 var dt1 = new Date(time_sta);
			 var dt2 = new Date(time_end)
			 var msec = dt2.getTime() - dt1.getTime();
			 var mins = Math.floor(msec / 60000);
			 //var hrs = Math.floor(mins / 60);
			 //var days = Math.floor(hrs / 24);
			 //var yrs = Math.floor(days / 365);
			 return mins;
			 
		 }catch(error){
			return 0;	 
		 }
	 }
	 function getDataModel(formName){
		var httpRequest = new XMLHttpRequest();
		 	httpRequest.open('POST', '../GetDataModel', false); 
		 	//httpRequest.open('POST', '../GetDataModel', true); true is asynchronous
		 	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
			httpRequest.send("odk_form_name="+formName);
			return httpRequest.responseText;
	 }
	 function loadVARecords(opts){
		 $("#tblVARecords"+opts.tabId).bootstrapTable({
			 url:"../GetBootTable",
			 method:"post",
			 pagination: true,
			 pageSize: 10,
			 sidePagination: "server",
			 contentType: 'application/x-www-form-urlencoded',
			 queryParams:function(p){
					return{
						rtype:102,
						tablename:opts.tblName,
						limit :this.pageSize,
						offset:this.pageSize * (this.pageNumber - 1),
						orderBy:this.sortName,
						orderVal:this.sortOrder,
						searchBy : $("#searchBy"+opts.tabId).val(),
						searchVal: $("#searchVal"+opts.tabId).val()
					}
			},
			singleSelect: true,
			columns:[{
				field:"_URI",
				title:"Record ID"
			},{
				field:opts.colReg.replace(/"/g,""),
				title:"Region",
				sortable:true
			},{
				field:opts.colDist.replace(/"/g,""),
				title:"District",
				sortable:true
			},{
				field:opts.colIntv.replace(/"/g,""),
				title:"Interviewer",
				sortable:true
			},{
				field:opts.colDate.replace(/"/g,""),
				title:"Date of Interview",
				sortable:true
			},{
				field:"START_TIME",
				title:"Minutes",
				align:"right",
				formatter: function (value,row,index) {
					return timeDifference(row['START_TIME'],row['END']);
				}
			},{
				field:opts.colGAcc.replace(/"/g,""),
				title:"GPS Accuracy",
				align:"right",
				sortable:true
			},{
			   	field: "_URI",
		    	title: "View",
		    	align: "center",
		    	formatter: formatEditColumn
		    }]
			 
		 })
	 }
	 function loadInterviewerSummary(tblName,colIntv,tblColumns,searchBy,tabId){
			$("#tblInterviewer"+tabId).bootstrapTable({
				url:"../VAMethods",
				method:"post",
				showToggle:true,
				showColumns:true,
				toolbar:"#tblInterviewer"+tabId+"-toolbar",
				pagination:true,
				sidePagination: "server",
				contentType: 'application/x-www-form-urlencoded',
				queryParams:function(p){
					return{
						rtype:51,
						tblName:tblName,
						colIntv:colIntv,
						tblColumns:JSON.stringify(tblColumns),
						searchBy:searchBy,
						searchVal:$("#txtYear"+tabId).val(),
						searchInt:$("#txtSearch"+tabId).val(),
						limit :this.pageSize,
						offset:this.pageSize * (this.pageNumber - 1),
						orderBy:this.sortName,
						orderVal:this.sortOrder
					}
				},
				groupBy: false,
				groupByField: ['interviewer_name'],
				groupBySumGroup:false,
				columns:[{
					field:"interviewer_name",
					title:"Interviewer",
					visible:true,
					sortable: true
				},{
					field:"death_loc_level1",
					title:admin_level1,
					visible:true,
					sortable: true
				},{
					field:"death_loc_level2",
					title:admin_level2,
					visible:true,
					sortable: true
				},{
					field:"jan",
					title:"Jan",
					align:"right",
					sortable:true
				},{
					field:"feb",
					title:"Feb",
					align:"right",
					sortable:true
				},{
					field:"mar",
					title:"Mar",
					align:"right",
					sortable:true
				},{
					field:"apr",
					title:"Apr",
					align:"right",
					sortable:true
				},{
					field:"may",
					title:"May",
					align:"right",
					sortable:true
				},{
					field:"jun",
					title:"Jun",
					align:"right",
					sortable:true
				},{
					field:"jul",
					title:"Jul",
					align:"right",
					sortable:true
				},{
					field:"aug",
					title:"Aug",
					align:"right",
					sortable:true
				},{
					field:"sep",
					title:"Sep",
					align:"right",
					sortable:true
				},{
					field:"oct",
					title:"Oct",
					align:"right",
					sortable:true
				},{
					field:"nov",
					title:"Nov",
					align:"right",
					sortable:true
				},{
					field:"dec",
					title:"Dec",
					align:"right",
					sortable:true
				},{
					field:"tot",
					title:"Total",
					align:"right",
					formatter:rowTotal
				}]
			});
		}
	 function loadData(formName,dateColumn,columns,tabId){
		 $.ajax({
				type:"POST",
				url:"../LoadDashboardItems",
				data: { 
					rtype:2,
					formName:formName,
					dateColumn:dateColumn,
					columns:JSON.stringify(columns)
				},
				datatype:"json",
				success: function(data){
					$("#va_summary"+tabId).bootstrapTable({
						data:data.rows,
						columns:[{
							field:"no",
							title:"No",
							visible:true,
							align:"center"
						},{
							field:"period",
							title:"Duration",
							visible:true
						},{
							field:"adult",
							title:"Adult VAs",
							visible:true,
							align:"right"
						},{
							field:"child",
							title:"Child VAs",
							visible:true,
							align:"right"
						},{
							field:"neonatal",
							title:"Neonatal VAs",
							visible:true,
							align:"right"
						},{
							title:"Total",
							align:"right",
							formatter:submissionTot,
							cellStyle:cellTextBold
						}]
					})
					
					var total = data.rows[4];
					
					$(".tot_adult").text( total.adult );
					$(".tot_child").text( total.child );
					$(".tot_neonatal").text( total.neonatal );
					$(".tot_total").text( parseInt(total.adult)+parseInt(total.child)+parseInt(total.neonatal) );
					
					drawGraph( parseInt(total.adult),parseInt(total.child),parseInt(total.neonatal),"vertical_bars"+tabId);
				},
				error: function(xhr, status, error){
					
				}
				
			});	 
	 }
	 //=== end tab settings ======//
	 
	$("#dashboard").click(function(e){
		//e.preventDefault();
		location.reload();
	});
	 
	$("#fetchdata").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("codedva.jsp",function(){
			$("input[name='uname']").val(" <%= uname %> ");
			$("input[name='coder']").val(" <%= fullname %> ");
		});
		
	});
	$("#notcodedva").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("boottable.jsp",{notcoded:1},function(){
			$("input[name='uname']").val(" <%= uname %> ");
			$("input[name='coder']").val(" <%= fullname %> ");
			$("#physician_name").html("<i class='fa fa-user'></i><%= fullname %>");
		});
	})
	$("#assignedva").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("boottable.jsp",{notcoded:0},function(){
			$("input[name='uname']").val(" <%= uname %> ");
			$("input[name='coder']").val(" <%= fullname %> ");
			$("#physician_name").html("<i class='fa fa-user'></i><%= fullname %>");
		});
	})
	$("#concordant").click(function(e){
		e.preventDefault();
	});
	$("#discordant").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("discordant.jsp",{discordant:1},function(){
			$("#physician_name").html("<i class='fa fa-user'></i><%= fullname %>");
		});
	});
	$("#usrmgr").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("user.jsp");
	});
	$("#icd10list").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("icd10.jsp");
	});
	$("#create_table").click(function(){
		//$("#mainpanel").load("tables.jsp");
	});
	
	//Maps
	$("#open_maps").click(function(e){
		e.preventDefault();
		$("#page-content").empty();
		$("#page-content").load("maps/index.jsp");
	});
	
	$("#uprofile").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("uprofile.jsp", function(){
			$("input[name='update_username']").val("<%= uname %>");
			$("input[name='update_fullname']").val("<%= fullname %>");
			$("input[name='update_phone']").val("<%= phone %>");
			$("input[name='update_organization']").val("<%= org %>");
		});
	});
	
	$("#uinterviewer").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("interviewer.jsp", function(){});
	})
	
	$("#upload_csmf").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("upload_csmf.jsp", function(){});
	})
	
	$("#download").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("download.jsp", function(){});
	})
	$("#settings").click(function(e){
		e.preventDefault();
		$("#page-content-home").empty();
		$("#page-content-home").load("settings.jsp", function(){});
	})
	//Link Add table
	$("#link_addcontent").click(function(){
		//$("#div_createtable").modal("show");
		//$("#main_area").append( addContent("table") );
	});
	
	
	//function to check session
	function reLogin(){
		if( <%= session.isNew() %> || <%= session.getAttribute("username") == null %>){
			return true;
		}
		return false;
	}
	//function create chart
	function createChart(chart_canvas,chart_data){
		
	}
	//end function create chart
	//function add content
	function addContent(type){
		//https://stackoverflow.com/questions/14004117/create-div-and-append-div-dynamically //read more
		var html = "";
		switch(type){
		case "table":
			html  = "<div class='col-md-12 div-to-close'>";
			html += "<div class='panel panel-default'>";
			html += "<div class='panel-heading'>";
			html += "<h6 class='panel-title'>New Content</h6>";
			html += "<div class='pull-right'>";
			html += "<a href='#' class='btn btn-link btn-icon panel-btn-add' data-toggle='modal' data-target='#div_createtable'  >&plus;</a>";
			html += "<a href='#' class='btn btn-link btn-icon panel-btn-close'>&times;</a>";
			html += "</div></div>";
			html += "<div class='panel-body' id='div_new_table'></div>";
			html += "</div>";
			html += "</div>";
			break;
		case "graph":
			html  = "<div class='col-md-12'>";
			html += "<div class='panel panel-default'>";
			html += "<div class='panel-heading'><h6 class='panel-title'>New Content</h6></div>";
			html += "<div class='panel-body' id='div_new_table'></div>";
			html += "</div>";
			html += "</div>";
			break;
		}
		return html;
	}
	//end function 
	function loadLeftMenu(){
		$.ajax({
			type:"POST",
			url:"../LoadMenuItems",
			data: { "rtype":1 },
			datatype:"json",
			success: function(data){
					$("#myTables").append("<li><a href='#'>Table 3</a></li>");
			},
			error: function(xhr, status, error){
				
			}
		});
	}
	
	function getCoderSummary(userId){
		//https://legacy.datatables.net/ref#aaData
		$.ajax({
			type:"post",
			url:"../LoadDashboardItems",
			data:{ "rtype": 1,"userid":userId},
			datatype: "json",
			success: function(data){
				
				//VA Coder summary
				$("#nbadge").text(data.assigned - data.coded);
				$("#abadge").text(data.assigned);
				$("#cbadge").text(data.concordant);
				$("#dbadge").text(data.discordant);
				
			},
			error: function(xhr, status, error){
				
			}
		});
	}
	function cellTextBold(val,row,index,field){
		return { css: {"font-weight": "bold"} };
	}
	function submissionTot(val,row,index){
		
		if(!isNumber(row['adult']) || !isNumber(row['child']) || !isNumber(row['neonatal']) ){
			return 0
		}
		return parseInt(row['adult']) + parseInt(row['child']) + parseInt(row['neonatal']);
	}
	
	function isNumber(n) {
		  return !isNaN(parseFloat(n)) && isFinite(n);
	}
	function rowTotal(val,row,index){
		return parseInt(row['jan'])+parseInt(row['feb'])+parseInt(row['mar'])
			+ parseInt(row['apr'])+parseInt(row['may'])+parseInt(row['jun'])+parseInt(row['jul'])+parseInt(row['aug'])
			+ parseInt(row['sep'])+parseInt(row['oct'])+parseInt(row['nov'])+parseInt(row['dec']);
	}
	function drawGraph(adult,child,neonate, graph_id){
		
		var tot = adult + child + neonate;
		var pAd = percent(adult,tot);
		var pCh = percent(child,tot);
		var pNe = percent(neonate,tot);
		var d1 = [[1,pAd],[2,pCh],[3,pNe]];
		var xl = [[1,"Adult VAs"],[2,"Child VAs"],[3,"Neonatal VAs"]];
		
		//var d1 = [];
	    //for (var i = 0; i <= 10; i += 1)
	    //    d1.push([i, parseInt(Math.random() * 30)]);
	    
		var ds = new Array();
		    ds.push({
		    	data:d1,
		    	bars: {
		    		show: true,
		    		align:"center",
		    		barWidth:0.5
		    	}
		    })
		var opts = {
		    colors: ["#ee7951"],
		    points: {
		        show: false
		    },
		    lines: {
		        show: false
		    },
			grid:{
			      	hoverable:true,
			      	clickable: true
			},
			xaxis:{
			 	axisLabel:"VAs Age Groups",
		   		ticks: xl,
		    	axisLabelPadding: 5
		    }	
		}
		  //Display graph
		 
		var $graph = $("#"+graph_id);
		$.plot($graph, ds,opts); 
		    
		  //Redrwa on Resize
		window.onresize = function(event) {
			  if(!$graph.length){
				  //console.log("window resized");
				  $.plot($graph, ds,opts);  
			  }
    	}
	}
	function percent(numerator,denominator){
		var num = parseFloat(numerator);
		var den = parseFloat(denominator);
		return parseInt( num/den * 100 );
	}
	function getGraphData(request_data,tabId){
		$.ajax({
			url:"../GetChartData",
			method:"post",
			asyc:true,
			data:request_data,
			dataType:"json",
			success: function(data){
				graphAnnualSubmission(data,tabId)
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		})
	}
	function formatEditColumn(value, row, index){
		return [
	        "<a href='#' data-toggle='modal' data-target='#divViewVA'>",
	        "<i class='fa fa-eye' aria-hidden='true'></i>",
	        "</a>"].join('');
	}
	function graphAnnualSubmission(rdata, tabId){
		var ctx = document.getElementById("chartMonthly"+tabId).getContext("2d");	
		var dataset = rdata.dataset;
		graphdata = {
				  //labels: dataset.labels, //use labels defined here instead. 
				  labels:months,
				  datasets: [{
				    label: dataset.title,
				    backgroundColor: "rgba(25,181,254,0.2)",
				    borderColor: "rgba(44,130,201,1)",
				    borderWidth: 2,
				    hoverBackgroundColor: "rgba(58,83,155,0.4)",
				    hoverBorderColor: "rgba(44,130,201,1)",
				    data: dataset.data
				  },{
					    label: "Total Deaths",
					    backgroundColor: "rgba(255,99,132,0.2)",
					    borderColor: "rgba(255,99,132,1)",
					    borderWidth: 2,
					    hoverBackgroundColor: "rgba(255,99,132,0.4)",
					    hoverBorderColor: "rgba(255,99,132,1)",
					    data: dataset.data2
				  }]
		};
		graphoptions = {
				  maintainAspectRatio: false,
				  legend: {
					  noColumns:1,
					  labelBoxBorderColor:"none",
					  position:'right' },
				  grid:{
					  hoverable:true,
					  clickable:false,
					  borderWidth:1  
				  },
				  title: {
					display:true,
					text:'Data Collection Summary'
				  },
				  scales: {
				    yAxes: [{
				      //stacked: true,
				      ticks: { beginAtZero: true },
				      gridLines: {
				        display: true,
				        color: "rgba(255,99,132,0.2)"
				      }
				    }],
				    xAxes: [{
				      gridLines: {
				        display: false
				      }
				    }]
				  }
		};
		myChart = new Chart(ctx, {
			  type: 'bar',
			  options: graphoptions,
			  data: graphdata
		});
	}
	function updateGraph(postdata){
		$.ajax({
			url:"../GetChartData",
			method:"post",
			data:postdata,
			dataType:"json",
			success: function(rdata){
				graphdata = {
						  //labels: rdata.dataset.labels,
						  labels:months,
						  datasets: [{
						    label: rdata.dataset.title,
						    backgroundColor: "rgba(25,181,254,0.2)",
						    borderColor: "rgba(44,130,201,1)",
						    borderWidth: 2,
						    hoverBackgroundColor: "rgba(25,181,254,0.4)",
						    hoverBorderColor: "rgba(44,130,201,1)",
						    data: rdata.dataset.data
						  },{
							  label: "Total Deaths",
							    backgroundColor: "rgba(255,99,132,0.2)",
							    borderColor: "rgba(255,99,132,1)",
							    borderWidth: 2,
							    hoverBackgroundColor: "rgba(255,99,132,0.4)",
							    hoverBorderColor: "rgba(255,99,132,1)",
							    data: rdata.dataset.data2
						  }]
				};
				myChart.config.data = graphdata;
				myChart.update()
			},error: function(xhr, ajaxOptions, thrownError){
				alert(xhr.status);
			}
		})
	}
		
});
</script>
</body>
</html>