<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<c:url var="instituteRegister" value="/instituteRegistration/save"
	scope="request" />
<c:url var="viewInstitute" value="/instituteRegistration"
	scope="request" />

<script type="text/javascript"
	src="<c:url value='/js/library/jquery-1.11.0.min.js' />"></script>

<title>Spandhan: Register Institute</title>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						getAllInstitute();
						$("button")
								.click(
										function() {
											//alert("inside button click");
											var table = $(this)
													.closest('table');
											var input = '<tr><td><div class="form-phone"><input type="text" id= "emailid" name="emailid" placeholder="Email Id">'
													+ '</div></td></tr><tr><td><div class="form-fullname">'
													+ '<input type="text"  id="designation" name="designation" placeholder="Designation">'
													+ '<input type="text"  id="pno" name="pno" placeholder="Phone Number">';
											/* </div>
											<div class="form-phone">
												<button type="button" class="btn btn-info">Add New</button>
											</div>
											</td>	" */
											table.append(input);
										});
						$("#submitInstitute").submit(function() {
							//alert("inside submit1/....");
						});
						/* $("#submitInstitute").submit(function() {
							alert("inside submit");
						}); */
					});

	function getAllInstitute() {
		alert("getAllInst");
		$.ajax({
			url : 'allRegistration',
			contentType : "application/json; charset=utf-8",
			dataType : "json",

			success : function(data) {
				//console.log(data);
				var trHTML = '';
				$('#records_table').html('');
				trHTML = '<thead><tr><th>Name</th><th>Address</th></tr></thead>';
				$.each(data, function(i, item) {

					trHTML += '<tbody><tr><td>' + item.instName + '</td><td>'
							+ item.address + '</td></tr></tbody>';
				});
				$('#records_table').append(trHTML);

			}
		});
	}

	function getInstituteByName(name) {
		alert("getInstituteByName " + name);
		$
				.ajax({
					url : 'getInstituteByName',
					data : name,
					contentType : "application/json; charset=utf-8",
					dataType : "json",

					success : function(data) {
						//console.log(data);
						var trHTML = '';
						$.each(data, function(i, item) {

							trHTML += '<tbody><tr><td>' + item.instName
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
		alert("inside submit...." + $("#name").val());
		var arr = [];
		var regInstMap = {};
		regInstMap["instName"] = $("#name").val();
		regInstMap["address"] = $("#address").val();
		regInstMap["city"] = $("#city").val();
		regInstMap["pin"] = $("#pin").val();
		regInstMap["state"] = $("#state").val();
		regInstMap["country"] = $("#country").val();
		regInstMap["pno"] = $("#pno").val();
		$("#dynamictblId").find('tr').find("input").each(function() {
			var textval = $(this).attr('id') + "~!~" + $(this).val(); // this will be the text of each <td>
			//alert('===='+textval);
			arr.push(textval);
		});
		regInstMap["array"] = arr;
		regInstMap["regNumber"] = $("#regNo").val();
		alert("inside save" + JSON.stringify(regInstMap));
		$.ajax({
			url : 'instituteRegistration/save',
			data : JSON.stringify(regInstMap),
			type : "POST",
			dataType : 'json',
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},
			success : function(e) {
				//console.log("SUCCESS: ", data);
				alert("SUCCESS: " + e);
				getAllInstitute();
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
						<h2 style="color: #37abf2">Institute Details</h2>
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
							<h2 style="color: #37abf2 !important;">Register Institute</h2>
							<div class="form-phone">
								<input type="text" name="name" id="name"
									placeholder="Institute Name">
							</div>
							<div class="form-address">
								<textarea name="address" id="address" placeholder="Address"></textarea>
							</div>
							<div class="form-fullname">
								<input type="text" name="city" id="city" placeholder="City">
								<input type="text" name="pin" id="pin" placeholder="Postal Code">
							</div>
							<div class="form-fullname">
								<input type="text" id="state" name="state" placeholder="State">
								<input type="text" id="country" name="country" placeholder="Country">
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
											<input type="text" 
												id="designation" name="designation"
												placeholder="Designation"> <input type="text"
											 id="pno" name="pno"
												placeholder="Phone Number">
										</div>
										<br>
										<div class="form-submit-1" align="right">
											<button type="button" class="btn btn-info">Add New</button>
										</div>
									</td>
							</table>

							<div class="form-phone">
								<input type="text" id="regNo" name="regNo"
									placeholder="Registration Number">
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