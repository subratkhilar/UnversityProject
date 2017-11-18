<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<c:url var="collegeRegister" value="collegeRegistration/save" scope="request" />
<script type="text/javascript" src="<c:url value='/js/library/jquery-1.11.0.min.js' />"></script> 
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<meta name="layout" content="administrator">
<title>Insert title here</title>
<script type="text/javascript">
var jq = jQuery.noConflict();
	jq(document).ready(function() {
		
		callTeacherDetails();
		 //jq( "#dob" ).datepicker();
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
	function callTeacherDetails() {
		
			jq.ajax({
					url : 'allTeachers',
					contentType : "application/json; charset=utf-8",
					dataType : "json",

					success : function(data) {
						//alert(JSON.stringify(data));
						var trHTML = '';
						jq('#records_table').html('');
						trHTML = '<thead><tr><th>Name</th><th>College</th></tr></thead>';
						jq.each(data, function(i, item) {

							trHTML += '<tbody><tr><td>' + item.principalName
									+ '</td><td>' + item.collegeName
									+ '</td></tr></tbody>';

						});
						jq('#records_table').append(trHTML);

					}
				});
	}

	function submitData() {
		var token = jq('#csrfToken').val();
		var header = jq('#csrfHeader').val();
		var arr = [];
		var regTeacherMap = {};
		regTeacherMap["collegeId"] = jq("#collegeId").val();
		regTeacherMap["teacherName"] = jq("#name").val();
		regTeacherMap["address"] = jq("#address").val();
		regTeacherMap["gender"] = jq("#gender").val();
		regTeacherMap["teacherHeight"] = jq("#teacherHeight").val();
		regTeacherMap["teacherWidth"] = jq("#teacherWeight").val();
		regTeacherMap["contactNumber"] = jq("#contactNumber").val();
		regTeacherMap["eduQualification"] = jq("#equalification").val();
		regTeacherMap["dob"] = jq("#dob").val();
		regTeacherMap["emailId"] = jq("#emailid").val();
		regTeacherMap["password"] = jq("#password").val();

		alert(JSON.stringify(regTeacherMap));
		jq.ajax({
			url : 'createTeacher/Save',
			data : JSON.stringify(regTeacherMap),
			type : "POST",
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},
			success : function() {
				//console.log("SUCCESS: ", data);
				alert("SUCCESS: ");
				callPrincipalDetails();
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
						<h2 style="color: #37abf2">Principal Details</h2>

						<div class="form-email" style="margin-top: 18px">
							<div class="mc-select-wrap">
								<div class="mc-select">
									<select class="select" name="school"
										style="z-index: 10; opacity: 0;">
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
							<h2 style="color: #37abf2 !important;">Register Teacher</h2>

							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select schoolSelect" name="collegeId"
											id="collegeId" style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select College</option>
											<c:forEach items="${clgList}" var="clgList">
												<option value="${clgList.collegeId}">${clgList.collegeName}</option>
											</c:forEach>

										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>

							<div class="form-phone">
								<input type="text" name="name" id="name" placeholder="Teacher name">
							</div>
							<div class="form-address">
								<textarea name="address" id="address" placeholder="Address"></textarea>
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
							
							<div class="form-email"">
								<input type="text" id="teacherHeight" name="teacherHeight" placeholder="Teacher Height" />
							</div>
							
							<div class="form-email"">
								<input type="text" id="teacherWeight" name="teacherWeight" placeholder="Teacher Weight" />
							</div>
							
							<div class="form-fullname">
								<input type="text" name="contactNumber" id="contactNumber"
									placeholder="Phone number"> <input type="text"
									name="dob" id="dob" placeholder="Date Of Birth" class="datepicker">
							</div>
							
							<div class="form-address">
								<textarea name="equalification" id="equalification" placeholder="Educational Qulaification"></textarea>
							</div>
							
							<div class="form-email"">
								<input type="text" id="emailid" name="emailid" placeholder="Email Id" />
							</div>

							<div class="form-password">
								<input type="password" name="password" id="password" placeholder="password">
							</div>
							
							<div class="form-submit-1">
								<input type="submit" id="submitInstitute" onclick="submitData()"
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