<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function() {
		getAllBranchDetails();
		getAllSection();

	});

	function getAllBranchDetails() {

		var collegeId = $('#collegeId').val();
		if (collegeId == null || collegeId == 'undefiened') {
			collegeId = '';
		}
		//alert("inside collegeId Details" + collegeId);
		select = $('#branchId');
		$.ajax({
			url : 'getAllBranches',
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : "collegeId=" + collegeId,
			success : function(data) {
				console.log("inside branch :: ");
				console.log(JSON.stringify(data));
				//alert(JSON.stringify(data));
				select.html('');
				$.each(data, function(i, item) {
					console.log(item);
					select.append('<option value="' + item.id + '">'
							+ item.branchName + '</option>');

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

		sectionMap["collegeId"] = $("#collegeId").val();
		sectionMap["branchId"] = $("#branchId").val();
		sectionMap["associatedSection"] = $("#associatedSection").val();

		//alert(JSON.stringify(sectionMap));
		$
				.ajax({
					url : 'addSection',
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
						/* <div class="alert alert-success fade in">
						 <strong>Success!</strong> Below Matric has been created successfully.
						</div> */
						//alert("SUCCESS: ");
						getAllSection();
						trHTML += '<div class="alert alert-success fade in" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>'
								+ data.message + '</strong></div>';
						$('#message').append(trHTML);
					},
					error : function(data) {
						console.log("ERROR: ", data);
						//alert("ERROR: " + JSON.stringify(e));
						trHTML += '<div class="alert alert-danger" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>' +data.message
						+ '</strong></div>';
						$('#message').append(trHTML);
					}
				});
	}
	function getAllSection() {
		
		var collegeId = $("#collegeId1").val();
		if(collegeId==null || collegeId=='undefiend'){
			
			}
		alert("collegeId >> "+collegeId);
		$
				.ajax({
					url : 'getAllSections',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data :"collegeId=" + collegeId,
					success : function(data) {
						//alert(JSON.stringify(data));
						var trHTML = '';
						$('#records_table').html('');
						trHTML = '<thead><tr><th>Branch</th><th>Section</th></thead>';
						$.each(data, function(i, item) {

							trHTML += '<tbody><tr><td>' + item.branchId
									+ '</td><td>' + item.associatedSection
									+ '</td></tr></tbody>';

						});
						$('#records_table').append(trHTML);

					}
				});
	}
</script>
<section>
	<div class="container">
		<div class="row">
			<!-- FORM -->
			<div class="col-lg-5 col-md-5" style="margin-top: 10px">
				<div class="form-login well well-lg"
					style="background-color: #E9E9E9 !important;">
					<h2 style="color: #37abf2">Available Section</h2>

					<div class="form-email" style="margin-top: 18px">
						<div class="mc-select-wrap">
							<div class="mc-select">
								<select class="select" name="collegeId1" id="collegeId1" onchange="getAllSection();"
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

			<div class="col-lg-2 col-md-2 "></div>

			<div class="col-lg-5 col-md-5" style="margin-top: 10px">
				<div class="form-login"
					style="background-color: #E9E9E9 !important;">
					<form>
						<div id="message"></div>
						<!--  <g:render template="/common/flash"/> -->

						<h2 style="color: #37abf2">Create Section</h2>

						<div class="form-email" style="margin-top: 18px">
							<div class="mc-select-wrap">
								<div class="mc-select">
									<select class="select" name="collegeId" id="collegeId"
										style="z-index: 10; opacity: 0;"
										onchange="getAllBranchDetails();">
										<option value="" selected="">Please Select School</option>
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
									<select class="select" name="branchId" id="branchId"
										style="z-index: 10; opacity: 0;">
										<option value="" selected="">Please Select Branch</option>
									</select><i class="fa fa-angle-down"></i>
								</div>
							</div>
						</div>

						<div class="form-email">
							<input type="text" name="associatedSection"
								id="associatedSection" placeholder="Please Provide Section">
						</div>

						<div class="form-submit-1">
							<input type="button" value="Submit" class="mc-btn btn-style-1"
								onclick="submitData()">
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</section>
<input type="hidden" id="csrfToken" value="${_csrf.token}" />
<input type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
