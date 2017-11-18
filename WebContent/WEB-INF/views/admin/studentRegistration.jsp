<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<c:url var="studentRegister" value="studentRegistration/Save"
	scope="request" />
<script type="text/javascript"
	src="<c:url value='/js/library/jquery-1.11.0.min.js' />"></script> 
     <link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
 <link rel="stylesheet" type="text/css" href="css/popup.css">

<meta name="layout" content="administrator">
<title>Insert title here</title>
<script type="text/javascript">
var jq = jQuery.noConflict();
jq(document).ready(function() {
	
		callStudentDetails();
		getAllBranchDetails();
		
		jq('.datepicker').datepicker({
	            format: 'dd/mm/yyyy',
	            changeYear: true,
	            changeMonth: true,
	            autoclose: true,
	            yearRange: "-50:+50", showButtonPanel: true,
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>'
	        }).on('changeDate', function (ev) {
	        });
		 
	});
	
	function getAllBranchDetails() {
		//alert("inside principal Details");
		collegeId = jq("#collegeId").val();
		select = jq('#branchId');
		
		console.log(select);
		jq.ajax({
					url : 'getAllBranches',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data :"collegeId=" + collegeId,
					success : function(data) {
						console.log(JSON.stringify(data));
						//alert(JSON.stringify(data));
						 select.html('');
						 jq.each(data, function(i, item) {
							 console.log(item);
							 select.append('<option value="' + item.branchCode + '">' + item.branchName + '</option>');
							//var div_data = "<option value=" + item.branchCode + ">" + item.branchName + "</option>";
					       // alert(div_data);
					       // $(div_data).appendTo('#collegeId');
							
						});
						

					}
				});
	}
	
	function callStudentDetails() {
		var collegeId = jq("#collegeId1").val();
		jq
				.ajax({
					url : 'getAllStudents',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data :"collegeId=" + collegeId,
					success : function(data) {
						//alert(JSON.stringify(data));
						var trHTML = '';
						jq('#records_table').html('');
						trHTML = '<thead><tr><th>Name</th><th>College</th><th>Branch</th></tr></thead>';
						jq.each(data, function(i, item) {

							trHTML += '<tbody><tr><td>' + item.name
									+ '</td><td>' + item.collegeId
									+ '</td><td>' + item.branchId
									+ '</td></tr></tbody>';

						});
						jq('#records_table').append(trHTML);

					}
				});
	}

	function submitData() {
		var token = jq('#csrfToken').val();
		var header = jq('#csrfHeader').val();
		
		//alert("inside submit1/...." + $("#name").val());
		alert("Ban= "+jq("#branchId").val());
		var studentMap = {};
		studentMap["branchId"] = jq("#branchId").val();
		studentMap["collegeId"] = jq("#collegeId").val();
		studentMap["emailid"] = jq("#emailid").val();
		studentMap["password"] = jq("#password").val();
		studentMap["contactNumber"] = jq("#contactNumber").val();
		studentMap["name"] = jq("#name").val();
		studentMap["dob"] = jq("#dob").val();
		studentMap["gender"] = jq("#gender").val();
		studentMap["fatherName"] = jq("#fatherName").val();
		studentMap["motherName"] = jq("#motherName").val();
		studentMap["highestQualification"] = jq("#highestQualification").val();
		studentMap["address"] = jq("#address").val();
		

		//alert(JSON.stringify(studentMap));
		jq.ajax({
			//url : "${collegeRegister}",
			url : 'studentRegistration/Save',
			data : JSON.stringify(studentMap),
			type : "POST",
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},
			success : function() {
				//console.log("SUCCESS: ", data);
				alert("SUCCESS: stue ");
				callStudentDetails();
				//display(data);
			},
			error : function(e) {
				//console.log("ERROR: ", e);
				alert("ERROR: " + JSON.stringify(e));
			}
		});
	}
</script>
</head>
<body>
	<section>
		<div class="container">
			<div class="row">
				<!-- FORM -->
				<div class="col-lg-7 col-md-7" style="margin-top: 10px">
					<div class="form-login well well-lg"
						style="background-color: #E9E9E9 !important;">
						<h2 style="color: #37abf2">Student Details</h2>

						<div class="form-email" style="margin-top: 18px">
							<div class="mc-select-wrap">
								<div class="mc-select">
									<select class="select" name="collegeId1" id="collegeId1"
										style="z-index: 10; opacity: 0;" onchange="callStudentDetails()">
										<option value="" selected="">Please Select College</option>

										<c:forEach items="${clgList}" var="clgList">
											<option value="${clgList.collegeId}">${clgList.collegeName}</option>
										</c:forEach>

									</select><i class="fa fa-angle-down"></i>
								</div>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table table-bordered table-hover "
								style="margin-top: 10px" id="records_table">
							</table>
						</div>
					</div>
				</div>
				<div class="col-lg-1 col-md-1"></div>
				<div class="col-lg-4 colmd-4" style="margin-top: 10px">
					<div class="form-login"
						style="background-color: #E9E9E9 !important;">
						<form>
							<h2 style="color: #37abf2 !important;">Register Student</h2>
							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select schoolSelect" name="collegeId"
											id="collegeId" style="z-index: 10; opacity: 0;" onchange="getAllBranchDetails()">
											<option value="" selected="">Please Select College</option>

											<c:forEach items="${clgList}" var="clgList">
												<option value="${clgList.collegeId}">${clgList.collegeName}</option>
											</c:forEach>

										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select schoolSelect" name="branchId"
											id="branchId" style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select Branch</option>

											
										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>

							<div class="form-phone">
								<input type="text" name="name" id="name"
									placeholder="Name">
							</div>
							<div class="form-phone">
								<input type="text" id="emailid" name="emailid"
									placeholder="Email Id" />
							</div>

							<div class="form-phone">
								<input type="password" name="password" id="password"
									placeholder="password">
							</div>

							<div class="form-phone">
								<input type="text" name="contactNumber" id="contactNumber"
									placeholder="Contact Number">
							</div>
							<div class="form-phone">
								<input type="text" name="dob" id="dob"
									placeholder="DATE OF BIRTH" class="datepicker">
							</div>
							<div class="form-phone">
								<input type="text" name="fatherName" id="fatherName"
									placeholder="Father's Name">
							</div>
							<div class="form-phone">
								<input type="text" name="motherName" id="motherName"
									placeholder="Mother's Name">
							</div>
							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select" name="gender" id="gender"
											style="z-index: 10; opacity: 0;">
											<option value="" selected="">Select Gender</option>

											<option value="male">Male</option>

											<option value="female">Female</option>

										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="form-phone">
								<input type="text" name="highestQualification" id="highestQualification"
									placeholder="Highest Qualification">
							</div>
							<div class="form-address">
								<textarea name="address" id="address" placeholder="Address"></textarea>
							</div>
							<div class="form-submit-1">
								<input type="button" id="submitInstitute" onclick="submitData()"
									value="Register" class="mc-btn btn-style-1">
							</div>
						</form>
					</div>
				</div>
				<input type="hidden" id="csrfToken" value="${_csrf.token}" /> <input
					type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
				<!-- END / FORM -->

				<div class="image"></div>

			</div>
		</div>
	</section>
</body>
</html>