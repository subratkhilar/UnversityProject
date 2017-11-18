<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function() {

		callTeacheDetails();
		getAllBranchDetails();
		getSubjAssgnDetails();
	});
	
	function getSubjAssgnDetails()
	{
		var collegeId = $("#collegeId1").val();
		if(collegeId==null || collegeId=='undefiend'){
			
			}
		//alert("collegeId >> "+collegeId);
		$
				.ajax({
					url : 'getSubjAssgnDetails',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data :"collegeId=" + collegeId,
					success : function(data) {
						//alert(JSON.stringify(data));
						var trHTML = '';
						$('#records_table').html('');
						trHTML = '<thead><tr><th>Teacher Name</th><th>Associated Subject</th></thead>';
						$.each(data, function(i, item) {

							trHTML += '<tbody><tr><td>' + item.teacher
									+ '</td><td>' + item.subject
									+ '</td></tr></tbody>';

						});
						$('#records_table').append(trHTML);

					}
				});
	}

	function callTeacheDetails() {

		var select1 = $('#teacher');
		$.ajax({
			url : 'getAllTeachers',
			contentType : "application/json; charset=utf-8",
			dataType : "json",

			success : function(data) {
				select.html('');
				select1.html('');
				$.each(data, function(i, item) {

					select1.append('<option value="' + item.id + '">'
							+ item.name + '</option>');

				});
			}
		});
	}

	function getAllBranchDetails() {
		//alert("inside principal Details");
		var collegeId = '';
		select = $('#branchId');
		//alert("collegeId>>"+collegeId);
		console.log(select);
		$
				.ajax({
					url : 'getAllBranches',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data : "collegeId=",
					success : function(data) {
						console.log("inside branch :: ");
						console.log(JSON.stringify(data));
						//alert(JSON.stringify(data));
						select.html('');
						select
								.append('<option value="">Please Select Branch</option>');
						$.each(data, function(i, item) {
							console.log(item);
							select.append('<option value="' + item.id + '">'
									+ item.branchName + '</option>');

						});

					}
				});
	}

	function getAllSubject() {
		var branchId = $('#branchId').val();
		if (branchId == null) {
			branchId = '';
		}
		select = $('#subject');
		//alert("collegeId>>"+collegeId);
		console.log(select);
		$
				.ajax({
					url : 'getAllSubjects',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data : "branchId=" + branchId,
					success : function(data) {
						console.log("inside branch :: ");
						console.log(JSON.stringify(data));
						//alert(JSON.stringify(data));
						select.html('');
						select
								.append('<option value="">Please Select Subject</option>');
						$.each(data, function(i, item) {
							console.log(item);
							select.append('<option value="' + item.id + '">'
									+ item.subject + '</option>');

						});

					}
				});
	}
	function getSection() {
		var branchId = $('#branchId').val();
		if (branchId == null) {
			branchId = '';
		}
		select = $('#section');
		select.html('');
		//alert("collegeId>>"+collegeId);
		console.log(select);
		$
				.ajax({
					url : 'getAllSections',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data : "branchId=" + branchId,
					success : function(data) {
											
						select
								.append('<option value="">Please Select Section</option>');
						$.each(data, function(i, item) {
							console.log(item);
							select.append('<option value="' + item.id + '">'
									+ item.associatedSection + '</option>');

						});

					}
				});
	}
	
	function submitData() {
		var token = $('#csrfToken').val();
		var header = $('#csrfHeader').val();
		var trHTML = '';
		$('#message').html('');
		var sectionMap = {};

		sectionMap["teacher"] = $("#teacher").val();
		sectionMap["branchId"] = $("#branchId").val();
		sectionMap["subject"] = $("#subject").val();
		sectionMap["section"] = $("#section").val();

		alert(JSON.stringify(sectionMap));
		$
				.ajax({
					url : 'assignSubjToTech',
					data : JSON.stringify(sectionMap),
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
						
						getSubjAssgnDetails();
						trHTML += '<div class="alert alert-success fade in" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>'
								+ data.message + '</strong></div>';
						$('#message').append(trHTML);
					},
					error : function(data) {
					//	console.log("ERROR: ", data);
						//alert("ERROR: " + JSON.stringify(e));
						trHTML += '<div class="alert alert-danger" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>' +data.message
						+ '</strong></div>';
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
					<h2 style="color: #37abf2">List Teacher With Subjects</h2>

					<div class="form-email" style="margin-top: 18px">
						<div class="mc-select-wrap">
							<div class="mc-select">
								<select class="select" name="collegeId1" id="collegeId1"
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

			<div class="col-lg-4 col-md-4" style="margin-top: 10px">
				<div class="form-login"
					style="background-color: #E9E9E9 !important;">
					<form>
						<div id="message"></div>
							<h2 style="color: #37abf2 !important;">Provide Details</h2>

							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select" name="teacher" id="teacher"
											style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select Teacher</option>

										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select" name="branchId" id="branchId" onblur="getSection();" onchange="getAllSubject();"
											style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select Branch</option>

										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select" name="subject" id="subject"
											style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select Subject</option>

										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>

							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select class="select" name="section" id="section"
											style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select Section</option>

										</select><i class="fa fa-angle-down"></i>
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

</section>
<input type="hidden" id="csrfToken" value="${_csrf.token}" />
<input type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
