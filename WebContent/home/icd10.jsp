<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ICD10 List</title>
<!--Uncomment to run this page by itself.
	Make sure to uncomment reference script file below as well.  
<link href="../css/bootstrap-table.min.css" rel="stylesheet">
 -->
</head>
<body>
<!-- page container -->
<div class="page-container container-fluid" style="padding:0;">
<div class="panel panel-default">
<div class="panel-heading"><h6 class="panel-title"><i class="fa fa-book"></i>ICD10 List</h6>
	<div class="btn-group pull-right">
		<a href="#" class="btn btn-lg btn-icon" data-toggle="modal" data-target="#divAddICD10"><i class="fa fa-plus"></i></a>
		<a href="#" class="btn btn-lg btn-icon"><i class="fa fa-refresh"></i></a>
	</div>
</div>
<div class="panel-body">
	<div class="row" style="margin-top:1.5em; padding:0 5px;">
		<table id="tblICD10" data-row-style="rowStyle" ></table>
	</div>
</div>
</div>
</div>
<!-- end page container -->
<!-- modal div -->
<div id="divAddICD10" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog modal-md">
	<form id="frmAddICD10" action="../ICD10" method="post" role="form">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h5 class="modal-title">Add ICD10</h5>
		</div>
		<div class="modal-body has-padding" style="background-color:#fff;">
			<div class="form-group">
				<div class="row">
					<div class="col-sm-4">
						<label for="icd10code">ICD10 Code</label>
						<input name="icd10code" id="icd10code" type="text" placeholder="CODE" class="form-control">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-6">
						<label for="icd10name">ICD10 Name</label>
						<input name="icd10name" id="icd10name" type="text" placeholder="ICD Name" class="form-control">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-6">
						<label for="icd10category">ICD10 Category</label>
						<select name="icd10category" class="select2_ctl" style="width : 100%;">
							<option></option>
							<option value="1">Communicable or notifiable diseases</option>
							<option value="2">Trauma and Injury</option>
							<option value="3">Non Communicable Diseases</option>
							<option value="4">Gastro Intestinal Track</option>
							<option value="5">Neonatal Conditions</option>
							<option value="6">Maternal Deaths</option>
							<option value="7">Burns and corrosion of multiple and unspecified bo</option>
							<option value="8">Poisoning by drugs, medicaments and biological sub</option>
							<option value="9">Toxic effects of substances chiefly non medicinal </option>
							<option value="10">Other and unspecified effects of exgternal causes</option>
							<option value="11">Complications of surgical and medical care</option>
							<option value="12">Assault</option>
							<option value="13">Transport accidents</option>
							<option value="14">Others</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-sm-6">
						<label for="icd10label">ICD10 Name</label>
						<input name="icd10label" id="icd10label" type="text" placeholder="Display Label" class="form-control" readonly>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<input type="hidden" name="rtype" value="3" >
			<button type="submit" class="btn btn-default" aria-hidden="true">Add</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</form>
</div>
</div>
<!-- end modal div -->
<!-- script -->

<!--Uncomment to run this by itself, (not embeded in index.jsp)
	Make sure to also uncomment the css file reference above.
	
	<script type="text/javascript" src="../js/plugins/forms/select2.min.js"></script>
	<script type="text/javascript" src="../js/plugins/interface/bootstrap-table.min.js"></script>
 -->
<script type="text/javascript">
$(document).ready(function(){
	//set select class
	$(".select2_ctl").select2({
		placeholder: "Role",
		minimumResultsForSearch: Infinity
	});
	$("#icd10code").blur(function() {
		 $("#icd10label").val( $("#icd10code").val() + " | " + $("#icd10name").val() );
	});
	$("#icd10name").blur(function() {
		 $("#icd10label").val( $("#icd10code").val() + " | " + $("#icd10name").val() );
	});
	$("#frmAddICD10").validate({
		rules:{
			icd10code:{
				required:true,
				maxlength:5,
				remote:{
					url:"../ICD10",
					method:"post",
					data:{
						rtype:4,
						icdcode:function(){ return $("input[name='icd10code']").val(); }
					}
				}
			},
			icd10name:{required:true},
			icd10category:{required:true}
		},
		messages:{
			icd10code:{ remote:"This ICD Code alredy exist" }
		},
		errorPlacement: function(error, element) {
		    //error.insertAfter(element.parent('.col-sm-6'));
			error.insertAfter(element.parent("div"));
		},
		submitHandler:function(form){
			var validator = this;
			var $form = $("#frmAddICD10");
			$.ajax({
				url: $form.attr('action'),
				type:$form.attr('method'),
				data:$form.serialize(),
				success:function(data){
					//alert(data.message);
					$("#divAddICD10").modal("hide");
				},error:function(xhr, ajaxOptions, thrownError){
					validator.showErrors(xhr.status+" "+thrownError);
				}
			})
		}
	})
	loadICD10();
	function loadICD10(){
		$.ajax({
			url:"../ICD10",
			data:"rtype=2",
			type:"post",
			dataType:"json",
			success: function(data){
				$("#tblICD10").bootstrapTable({
					data:data.rows,
					pageSize: 10,
					pagination: true,
					search: true,
					columns: [{
					   	field: 'icdcode',
				    	title: 'ICD Code',
				    	sortable: true
				    },{
					   	field: 'icdname',
				    	title: 'ICD Name',
				    	sortable: true
				    },{
					   	field: 'icdlabel',
				    	title: 'Display Label',
				    	sortable: true
				    },{
					   	field: 'id',
				    	title: 'Edit',
				    	align: 'center',
				    	formatter: formatEditColumn
				    }]
				})
			}
		})
	}
	//edit column function
	function formatEditColumn(value, row, index){
		return [
		        "<a href='#' data-toggle='modal' data-target='#'>",
		        "<i class='fa fa-pencil-square-o' aria-hidden='true'></i>",
		        "</a> ",
		        "<a href='#' data-toggle='modal' data-target='#'>",
		        "<i class='fa fa-times' aria-hidden='true'></i>",
		        "</a>"].join('');
	}//end edit column function
})
</script>
<!-- end script -->
</body>
</html>