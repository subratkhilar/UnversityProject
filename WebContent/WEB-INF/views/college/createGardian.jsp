<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="css/bootstrap-multiselect.css"
	type="text/css">
<script type="text/javascript" src="js/bootstrap-multiselect.js"></script>

<script>
	var jq = jQuery.noConflict();
	jq(document).ready(function() {
		jq('#birthDate').datepicker({
			format : 'dd/mm/yyyy',
			changeYear : true,
			changeMonth : true,
			autoclose : true,
			yearRange : "-50:+50",
			showButtonPanel : true,
			prevText : '<i class="fa fa-angle-left"></i>',
			nextText : '<i class="fa fa-angle-right"></i>'
		});
		jq('#studentId').multiselect();
		//getAllLibrarians();
	});
</script>
<script>
	function getAllLibrarians() {
		var collegeId = $("#collegeId1").val();
		if (collegeId == null || collegeId == 'undefiend') {

		}
		alert("collegeId >> " + collegeId);
		$
				.ajax({
					url : 'getAllLibrarians',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data : "collegeId=" + collegeId,
					success : function(data) {
						//alert(JSON.stringify(data));
						var trHTML = '';
						$('#records_table').html('');
						trHTML = '<thead><tr><th>Name</th><th>Education Qualification</th><th>Address</th></thead>';
						$.each(data, function(i, item) {

							trHTML += '<tbody><tr><td>' + item.name
									+ '</td><td>' + item.educationQualification
									+ '</td><td>' + item.address
									+ '</td></td></tr></tbody>';

						});
						$('#records_table').append(trHTML);

					}
				});
	}
	function submitData() {
		var token = jq('#csrfToken').val();
		var header = jq('#csrfHeader').val();

		var libMap = {};
		var trHTML = '';
		$('#message').html('');
		libMap["collegeId"] = jq("#collegeId").val();
		libMap["name"] = jq("#name").val();
		libMap["address"] = jq("#address").val();
		libMap["gender"] = jq("#gender").val();
		libMap["height"] = jq("#height").val();
		libMap["weight"] = jq("#weight").val();
		libMap["phoneNo"] = jq("#phoneNo").val();
		//libMap["birthDate"] = jq("#birthDate").val();
		libMap["educationQualification"] = jq("#educationQualification").val();
		libMap["emailId"] = jq("#emailId").val();
		libMap["password"] = jq("#password").val();

		alert(JSON.stringify(libMap));
		jq
				.ajax({
					url : 'addLibrarian1',
					data : JSON.stringify(libMap),
					type : "POST",
					contentType : "application/json",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("Accept", "application/json");
						xhr
								.setRequestHeader("Content-Type",
										"application/json");
						xhr.setRequestHeader(header, token);
					},
					success : function(data) {
						console.log("SUCCESS: ", data);
						trHTML += '<div class="alert alert-success fade in" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>'
								+ data.message + '</strong></div>';
						$('#message').append(trHTML);

						getAllLibrarians();
					},
					error : function(e) {
						console.log("ERROR: ", e);
						//alert("ERROR: " + JSON.stringify(e));
						trHTML += '<div class="alert alert-danger" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>'
								+ data.message + '</strong></div>';
						$('#message').append(trHTML);
					}
				});
	}
</script>
<section>
	<div class="container">
		<div class="row">
			<!-- FORM -->
			<div class="col-lg-7 col-md-7" style="margin-top: 10px">
				<div class="form-login well well-lg"
					style="background-color: #E9E9E9 !important;">
					<h2 style="color: #37abf2">Parent List</h2>

					<div class="form-email" style="margin-top: 18px">
						<div class="mc-select-wrap">
							<div class="mc-select">
								<select class="select" name="collegeId1" id="collegeId1"
									style="z-index: 10; opacity: 0;" onchange="getAllLibrarians();">
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

			<div class="col-lg-4 col-md-4" style="margin-top: 10px">
				<div class="form-login"
					style="background-color: #E9E9E9 !important;">
					<form>
						<div id="message"></div>
						<h2 style="color: #37abf2 !important;">Register Parent</h2>

						<div class="form-email" style="margin-top: 18px">
							<div class="mc-select-wrap">
								<div class="mc-select">
									<select class="select" name="collegeId" id="collegeId"
										style="z-index: 10; opacity: 0;">
										<option value="" selected="">Please Select College</option>
										<c:forEach items="${clgList}" var="clgList">
											<option value="${clgList.collegeId}">${clgList.collegeName}</option>
										</c:forEach>
									</select><i class="fa fa-angle-down"></i>
								</div>
							</div>
						</div>

						<div class="form-phone">
							<input type="text" name="name" id="name" placeholder="Name">
						</div>


						<div class="form-address">
							<textarea type="text" name="address" id="address"
								placeholder="Address"></textarea>
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


						<div class="form-fullname">
							<input type="text" name="phoneNo" id="phoneNo"
								placeholder="Phone number"> <input type="text"
								id="birthDate" name="birthDate" id="birthDate"
								placeholder="Date Of Birth">
						</div>

						<div class="form-email">
							<input type="text" name="emailId" id="emailId"
								placeholder="Email ID">
						</div>

						<div class="form-password">
							<input type="password" name="password" id="password"
								placeholder="Password">
						</div>
						<div class="form-email" style="margin-top: 18px">
							<div class="mc-select-wrap">
								<div class="mc-select">
									<select name="studentId" id="studentId"
										 multiple="multiple">
										<option value="" selected="">Select Student</option>
										
											<option value="Javascript">Javascript</option>
											<option value="Python">Python</option>
											<option value="LISP">LISP</option>
											<option value="C++">C++</option>
											<option value="jQuery">jQuery</option>
											<option value="Ruby">Ruby</option>
									
									</select>
								</div>
							</div>
						</div>

						<div class="form-submit-1">
							<input type="button" value="Become a member"
								class="mc-btn btn-style-1" onclick="submitData();">
						</div>


					</form>
				</div>
			</div>

			<!-- END / FORM -->

			<div class="image"></div>

		</div>
	</div>
	<input type="hidden" id="csrfToken" value="${_csrf.token}" /> <input
		type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
</section>


</body>
</html>