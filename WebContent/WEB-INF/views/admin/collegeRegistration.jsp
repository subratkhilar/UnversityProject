<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<c:url var="collegeRegister" value="collegeRegistration/save"
	scope="request" />
<script type="text/javascript"
	src="<c:url value='/js/library/jquery-1.11.0.min.js' />"></script>

<meta name="layout" content="administrator">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		//callAbc();
		//getAllCollegeDetails();
		callCollgeDetails();
	});

	function callCollgeDetails() {
		$
				.ajax({
					url : 'allColleges',
					contentType : "application/json; charset=utf-8",
					dataType : "json",

					success : function(data) {
						alert(JSON.stringify(data));
						var trHTML = '';
						$('#records_table').html('');
						trHTML = '<thead><tr><th>Name</th><th>Address</th></tr></thead>';
						$.each(data, function(i, item) {

							trHTML += '<tbody><tr><td>' + item.collegeName
									+ '</td><td>' + item.address
									+ '</td></tr></tbody>';
						});
						$('#records_table').append(trHTML);

					}
				});
	}

	function submitData() {
		var token = $('#csrfToken').val();
		var header = $('#csrfHeader').val();
		var arr = [];
		var regClgMap = {};
		regClgMap["instId"] = $("#instId").val();
		regClgMap["collegeName"] = $("#name").val();
		regClgMap["address"] = $("#address").val();
		regClgMap["city"] = $("#city").val();
		regClgMap["pin"] = $("#pin").val();
		regClgMap["state"] = $("#state").val();
		regClgMap["country"] = $("#country").val();
		regClgMap["pno"] = $("#pno").val();
		$("#dynamictblId").find('tr').find("input").each(function() {
			var textval = $(this).attr('id') + "~!~" + $(this).val(); // this will be the text of each <td>
			arr.push(textval);
		});
		regClgMap["array"] = arr;
		regClgMap["regNumber"] = $("#regNo").val();

		alert(JSON.stringify(regClgMap));
		$.ajax({
			//url : "${collegeRegister}",
			url : 'collegeRegistration/Save',
			data : JSON.stringify(regClgMap),
			type : "POST",
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},
			success : function() {
				//console.log("SUCCESS: ", data);
				//alert("SUCCESS: ");
				getAllCollege();
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
						<h2 style="color: #37abf2">College Details</h2>
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
							<h2 style="color: #37abf2 !important;">Register College</h2>
							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select" name="school"
											style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select Institute</option>
											<c:forEach items="${instiList}" var="instiList">
												<option value="${instiList.instId}">${instiList.instName}</option>
											</c:forEach>

										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="form-phone">
								<input type="text" name="name" id="name"
									placeholder="College Name">
							</div>
							<div class="form-phone">
								<input type="text" id="address" placeholder="Address">
							</div>
							<div class="form-fullname">
								<input type="text" name="city" id="city" placeholder="City">
								<input type="text" name="pin" id="pin" placeholder="Postal Code">
							</div>
							<div class="form-fullname">
								<input type="text" id="state" name="state" placeholder="State">
								<input type="text" id="country" name="country"
									placeholder="Country">
							</div>


							<table id="dynamictblId">
								<tr>
									<td>
										<div class="form-phone">
											<input type="text" id="emailid" name="emailid"
												placeholder="Email Id">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-fullname">
											<input type="text" id="designation" name="designation"
												placeholder="Designation"> <input type="text"
												id="pno" name="pno" placeholder="Phone Number">
										</div>

									</td>
							</table>

							<div class="form-phone">
								<input type="text" id="regNo" name="regNo"
									placeholder="Registration Number">
							</div>

							<div class="form-submit-1">
								<input type="submit" id="submitInstitute" onclick="submitData()"
									value="Become A Member" class="mc-btn btn-style-1">
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