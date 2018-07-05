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
	<div class="row" style="margin-top:5px;">
		<div class="col-sm-2 visible-lg visible-md">
			<img src="../images/logo.svg" alt="CRVS Logo" class="img-responsive">
			<!-- image size is 94px X 80px -->
		</div>
		<div class="col-sm-8" style="padding-top:8px;">
			<h1 id="pageTitle" style="margin:1px auto;">Page title</h1>
			<h4 id="pageSubTitle" style="margin:1px auto;">Page subtitle</h4>
			<h6 style="margin:1px;">Relise version 1.0.0</h6>
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
             	<li><a href="#" id="fetchdata">List VA Data</a></li>
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
			<a href="#" class="expand"><i class="fa fa-user"></i> User Details</a>
			<ul>
				<li><a href="#" id="settings"><i class="fa fa-cog"></i>Settings</a></li>
				<li><a href="#" id="uprofile"><i class="fa fa-address-card-o"></i>Update Profile</a></li>
				<li><a href="#" id="uinterviewer"><i class="fa fa-list-alt"></i>VA Submission</a></li>
				<!-- Check for user profile -->
				<!-- 0: Read Only, 1: Data Manager, 2: Coder/Physician, 3: Administrator -->
				<% 
					switch(roleId){
					case 0: //Read Only
						break;
					case 1: //Data Manager
						break;
					case 2: // Coder or Physician
						out.print("<li><a href='#' id='concordant'><i class='fa fa-files-o'></i>Concordant VA <span id='cbadge' class='badge badge-info'>0</span> </a></li>");
						out.print("<li><a href='#' id='discordant'><i class='fa fa-clipboard'></i>Discoardant VA <span id='dbadge' class='badge badge-info'>0</span> </a></li>");
						break;
					case 3: //Administrator
						out.print("<li><a href='#' id='usrmgr'><i class='fa fa-users'></i>User Mgmt</a></li>");
						out.print("<li><a href='#' id='icd10list'><i class='fa fa-book'></i>ICD10 List</a></li>");
						break;
					}
				%>
				
			</ul>
		</li>
	</ul>
</div>
<!-- /side bar -->
<!-- page content -->
<div class="page-content">
<!--  page title -->
<div class="page-title">
	<h5><i class="fa fa-bars"></i> Dashboard <small>items</small></h5>
	<div class="btn-group">
		<a href="#" class="btn btn-link btn-lg btn-icon dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cogs"></i><span class="caret"></span></a>
		<ul class="dropdown-menu dropdown-menu-right">
			<li><a id="link_addcontent" href="#">Add Content</a></li>
			<li><a href="#">Action 2</a></li>
		</ul>
	</div>
</div>
<!-- /page title -->
<div id="mainpanel">
<!-- statistics -->
<div class="row">
<div class="col-sm-12">
	<ul class="row stats">
		<li class="col-xs-3"><a href="#" id="tot_adult" class="btn btn-default">0</a> <span>Adult Forms</span></li>
		<li class="col-xs-3"><a href="#" id="tot_child" class="btn btn-default">0</a> <span>Child Forms</span></li>
		<li class="col-xs-3"><a href="#" id="tot_neonatal" class="btn btn-default">0</a> <span>Neonatal Forms</span></li>
		<li class="col-xs-3"><a href="#" id="tot_total" class="btn btn-default">0</a> <span>Total VA</span></li>
	</ul>
</div>
</div>
<!-- /statistics -->
<!-- panels -->
<div class="row" id="main_area">
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
   		<table id="va_summary" data-row-style="rowStyle"  data-striped="true" ></table>
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
	   		<!-- add style to this div in order to remove uncaugh expection with the
	   			the graph drawing function. plot. 
	   			if not, when plot is called, it throws an exception
	   			you can see this exception in firebug or chrome develoepr tools 
	   		 -->
	   		<div class="graph-standard" id="vertical_bars" style="width:100%;height:184px;"></div>
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
	<div class="panel-body" id="div_map">
	</div>
</div>
</div>
<!-- END MAP -->
<!-- GRAPH -->
<div class="col-md-12 div-to-close">
<div class="panel panel-default">
	<div class="panel-heading">
		<h6 class="panel-title">Graphs: Monthly Submission</h6>
		<div class="pull-right">
			<a href="#" class="btn btn-link btn-icon panel-btn-close">&times;</a>
		</div>
	</div>
	<div class="panel-body" id="div_graph">
	</div>
</div>
</div>
<!-- END GRAPH -->
</div>
</div>
<!-- /panels -->
<!-- footer -->
<div class="footer">
	&copy; Copyright 2017. All rights reserved. <a href="#" title="">CRVS</a>
</div>
<!-- /footer -->
</div>
<!-- /page content -->
</div>
<!-- Modal Panels -->
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
<!-- End Modal Panels -->
<!-- /page container -->

<!-- scripts -->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>

<script type="text/javascript" src="../js/plugins/forms/validate.min.js"></script>

<script type="text/javascript" src="../js/plugins/charts/flot.js"></script>
<script type="text/javascript" src="../js/plugins/charts/flot.resize.min.js"></script>

<script type="text/javascript" src="../js/plugins/interface/bootstrap-table.min.js"></script>
<script type="text/javascript" src="../js/plugins/interface/collapsible.min.js"></script>

<script type="text/javascript" src="../js/plugins/forms/select2.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/mapping-whova.js"></script>
<script type="text/javascript" src="../js/mapping-smartva.js"></script>

<script type="text/javascript" src="charts/chart.min.js"></script>
<script>
$(document).ready(function(){
	
	
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
	
	$(".format_select2").select2({
		width:"100%"
	});
	
	//load tables
	$("#div_map").load('tables.jsp',function(){});
	
	//load graph
	$("#div_graph").load('charts/monthly.jsp',function(){
		//$("input[name='txtYear']").val("2018");
	});
	
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
	
	$("#dashboard").click(function(e){
		//e.preventDefault();
		location.reload();
	});
	$("#fetchdata").click(function(e){
		e.preventDefault();
		$("#mainpanel").empty();
		$("#mainpanel").load("boottable.jsp",function(){
			$("input[name='uname']").val(" <%= uname %> ");
			$("input[name='coder']").val(" <%= fullname %> ");
		});
		
	});
	$("#concordant").click(function(e){
		e.preventDefault();
	});
	$("#discordant").click(function(e){
		e.preventDefault();
		$("#mainpanel").empty();
		$("#mainpanel").load("discordant.jsp",function(){
			$("#physician_name").html("<i class='fa fa-user'></i><%= fullname %>");
		});
	});
	$("#usrmgr").click(function(e){
		e.preventDefault();
		$("#mainpanel").empty();
		$("#mainpanel").load("user.jsp");
	});
	$("#icd10list").click(function(e){
		e.preventDefault();
		$("#mainpanel").empty();
		$("#mainpanel").load("icd10.jsp");
	});
	$("#create_table").click(function(){
		//$("#mainpanel").load("tables.jsp");
	});
	$("#uprofile").click(function(e){
		e.preventDefault();
		$("#mainpanel").empty();
		$("#mainpanel").load("uprofile.jsp", function(){
			$("input[name='update_username']").val("<%= uname %>");
			$("input[name='update_fullname']").val("<%= fullname %>");
			$("input[name='update_phone']").val("<%= phone %>");
			$("input[name='update_organization']").val("<%= org %>");
		});
	});
	
	$("#uinterviewer").click(function(e){
		e.preventDefault();
		$("#mainpanel").empty();
		$("#mainpanel").load("interviewer.jsp", function(){});
	})
	
	//Link Add table
	$("#link_addcontent").click(function(){
		//$("#div_createtable").modal("show");
		$("#main_area").append( addContent("table") );
	});
	//loadLeftMenu();
	loadDashboardItems(userId);
	
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
	
	function loadDashboardItems(userId){
		//https://legacy.datatables.net/ref#aaData
		$.ajax({
			type:"post",
			url:"../LoadDashboardItems",
			data:{ "rtype": 1,"userid":userId},
			datatype: "json",
			success: function(data){
				$("#va_summary").bootstrapTable({
					data:data.rows,
					columns:[{
						field:"#",
						title:"No",
						visible:true,
						align:"center"
					},{
						field:"label",
						title:"Duration",
						visible:true
					},{
						field:"adult",
						title:"Adult VA",
						visible:true,
						align:"right"
					},{
						field:"child",
						title:"Child VA",
						visible:true,
						align:"right"
					},{
						field:"neonatal",
						title:"Neonatal VA",
						visible:true,
						align:"right"
					},{
						title:"Total",
						align:"right",
						formatter:submissionTot,
						cellStyle:cellTextBold
					}]
				})
				
				//Displaying the totals;
				var total = data.rows[4];
				
				$("#tot_adult").text( total.adult );
				$("#tot_child").text( total.child );
				$("#tot_neonatal").text( total.neonatal );
				$("#tot_total").text( parseInt(total.adult)+parseInt(total.child)+parseInt(total.neonatal) );
				
				//VA Coder summary
				$("#cbadge").text(data.concordant);
				$("#dbadge").text(data.discordant);
				
				drawGraph( parseInt(total.adult),parseInt(total.child),parseInt(total.neonatal));
				
			},
			error: function(xhr, status, error){
				
			}
		});
	}
	function cellTextBold(val,row,index,field){
		return { css: {"font-weight": "bold"} };
	}
	function submissionTot(val,row,index){
		return parseInt(row['adult']) + parseInt(row['child'] + parseInt(row['neonatal']));
	}
	
	function drawGraph(adult,child,neonate){
		
		var tot = adult + child + neonate;
		var pAd = percent(adult,tot);
		var pCh = percent(child,tot);
		var pNe = percent(neonate,tot);
		var d1 = [[1,pAd],[2,pCh],[3,pNe]];
		var xl = [[1,"Adult VA"],[2,"Child VA"],[3,"Neonatal VA"]];
		
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
			 	axisLabel:"VA Type",
		   		ticks: xl,
		    	axisLabelPadding: 5
		    }	
		}
		  //Display graph
		 
		var $graph = $("#vertical_bars");
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
		
});
</script>
</body>
</html>