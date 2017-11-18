<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="js/library/jquery-1.11.0.min.js"></script> 
<script>
	$(document).ready(function() {
		
		callCollgeDetails();
		getAllBranchDetails();
		getAllSubject();
	});

	function callCollgeDetails() {
		select = $('#collegeId');
		select1 = $('#collegeId1');
		$
				.ajax({
					url : 'allColleges',
					contentType : "application/json; charset=utf-8",
					dataType : "json",

					success : function(data) {
						select.html('');
						select1.html('');
						$.each(data, function(i, item) {
							
							 select1.append('<option value="' + item.id + '">'+ item.collegeName + '</option>');
							 
						
						});
					}
				});
	}
	
	function getAllBranchDetails() {
		//alert("inside principal Details");
		collegeId = $('#collegeId').val();
		select = $('#branchId');
//alert("collegeId>>"+collegeId);
		console.log(select);
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
	
	function getAllSubject()
	{
		//alert("coming to subject fetch");
		//var collegeId = $("#collegeId1").val();
		$
		.ajax({
			url : 'getAllSubjects',
			contentType : "application/json; charset=utf-8",
			dataType : "json",

			success : function(data) {
				//alert(JSON.stringify(data));
				var trHTML = '';
				$('#subRecord').html('');
				
				$.each(data, function(i, item) {
					 
					  trHTML += '<div class="col-md-4" style="background-color:#' + item.colorCode
							+ '!important;" <h4 class="title-box text-uppercase"><i class="fa fa-asterisk"></i>' + item.subject
							+ '</h4></div>';  
				});
				$('#subRecord').append(trHTML);

			}
		});
	}
	
	function submitData() {
		var token = $('#csrfToken').val();
		var header = $('#csrfHeader').val();
		
		var subjectMap = {};
		var trHTML = '';
		$('#message').html('');
		subjectMap["collegeId"] = $("#collegeId").val();
		subjectMap["branchId"] = $("#branchId").val();
		subjectMap["subject"] = $("#subject").val();
		subjectMap["colorCode"] = $("#colorCode").val();
		//message
		//alert(JSON.stringify(subjectMap));
		$.ajax({
			url : 'addSubject',
			data : JSON.stringify(subjectMap),
			type : "POST",
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				console.log("SUCCESS: ", data);
				trHTML += '<div class="alert alert-success fade in" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>' + data.message
				+ '</strong></div>'; 
				/* <div class="alert alert-success fade in">
			     <strong>Success!</strong> Below Matric has been created successfully.
			</div> */
				//alert("SUCCESS: ");
				getAllSubject();
				$('#message').append(trHTML);
			},
			error : function(e) {
				//console.log("ERROR: ", e);
				alert("ERROR: " + JSON.stringify(e));
				trHTML += '<div class="alert alert-danger" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>' + e.message
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
			<div class="col-lg-5 col-md-5 well well-lg" style="margin-top: 10px">
				<div class="" style="">
					<h4 style="color: #37abf2; text-align: center">Available
						Section</h4>

					<div class="form-email" style="margin-top: 18px">
						<div class="mc-select-wrap">
							<div class="mc-select">
								<select class="select" name="collegeId1" id="collegeId1"
									style="z-index: 10; opacity: 0;"
									onchange="callSubjDetails()">
									<option value="" selected="">Please Select College</option>

										
								</select><i class="fa fa-angle-down"></i>
							</div>
						</div>
					</div>
					<br>
					<div id="subRecord">
					</div>
					

				</div>
			</div>

			<div class="col-lg-2 col-md-2 "></div>

			<div class="col-lg-5 col-md-5" style="margin-top: 10px">
				<div class="form-login"
					style="background-color: #E9E9E9 !important;">
					<form>

						<div id="message"></div>

						<h2 style="color: #37abf2">Create Subject</h2>

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

						<div class="form-email">
							<input type="text" name="subject" id="subject" placeholder="Subject">
						</div>

						<div class="form-email">
							<input type="text" name="colorCode" id="colorCode" value="BABABA"
								class="form-control jscolor" placeholder="Color Code">
						</div>


						<div class="form-submit-1">
							<input type="button" value="Submit" class="mc-btn btn-style-1" onclick="submitData()">
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</section>

<script src="js/jscolor.min.js"></script>
<input type="hidden" id="csrfToken" value="${_csrf.token}" /> <input
					type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
</body>
</html>