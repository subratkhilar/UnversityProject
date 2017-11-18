<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta name="layout" content="teacher">
<title>Attendance List</title>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
</head>

<body>
	<section id="create-course-section" class="create-course-section">
		<div class="first-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="create-course-sidebar">
							<ul class="list-bar">
								<li><a href="attendance"><span class="count">1</span>Create/Upload
										Attendance</a></li>
								<li class="active"><span class="count">2</span>View
									Attendance</li>
								<li><a href="createSelfAttendance"><span class="count">3</span>Create
										Self Attendance</a></li>
								<li><a href="viewSelfAttendance"><span class="count">4</span>View
										Self Attendance</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-9 avatar-acount" style="margin-bottom: 5%">
						<div class="avatar-acount ">

							<c:if test="${!empty leaveApplicationList}">
								<table class="table table-bordered">
									<tr>
										<th>Name</th>
										<th>From</th>
										<th>To</th>
										<th>Count</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
									<c:forEach items="${leaveApplicationList}" var="leaveApplication">
										<tbody>
											<tr>
												<td><c:out value="${leaveApplication.student}" /></td>
												<td><c:out value="${leaveApplication.attendanceDate}" /></td>
												<td><c:out value="${leaveApplication.attendanceDate}" /></td>
												<td>1</td>
												<td><c:out value="${leaveApplication.status}" /></td>
												<td> <%-- <c:if test="${leaveApplication?.leaveApplicationState == com.spandhan.setting.Enums.LeaveApplicationState.LL_NOT_SUBMITTED || leaveApplication?.leaveApplicationState == com.spandhan.setting.Enums.LeaveApplicationState.DN_NOT_SUBMITTED}"> --%>
                                                <a id="button${leaveApplication.id}" href="javascript:void(0)"
                                                   onclick="changeStatus('${leaveApplication.id}')"
                                                   class="mc-btn btn-style-2">Mark As Submitted</a>
                                           <%--  </c:if> --%></td>
												
											</tr>
										</tbody>
									</c:forEach>
									
								</table>
							</c:if>
							<c:if test="${empty leaveApplicationList}">
                            <div class="col-md-3"></div>

                            <div class="col-md-6 well well-lg"
                                 style="margin-top: 5%;margin-bottom: 2%;font-weight: bold;text-align: center">
                                <i class="fa fa-times fa-2x"></i>
                                <br/>
                                You are not associated with any class.
                                <br/>
                                This feature is only visible to class teacher only.
                            </div>

                            <div class="col-md-3"></div>
                        </c:if>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<link rel="stylesheet" type="text/css" href="css/datepicker.css">
	<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

	<script>
		function changeStatus(id) {
			if (id) {
				$
						.ajax({
							url : 'markApplicationSubmitted',
							method : 'POST',
							data : {
								id : id
							},
							success : function(resp) {
								var json = JSON.parse(resp);
								if (json.status == "SUCCESS") {
									$("#state" + id)
											.html(json.applicationState);
									$("#button" + id).hide();
									toastr
											.success("Application State Updated Successfully");
								}
							}
						})
			}
		}
		$(document).on('click', "#searchBtn", function() {
			$("#tableContent").hide();
			$.ajax({
				url : 'viewAttendance',
				method : 'POST',
				data : {
					lecture : $("#lecture").val(),
					attendanceDate : $("#attendanceDate").val()
				},
				success : function(resp) {
					$("#tableContent").replaceWith(resp)
				}
			})
		});
		$('#attendanceDate').datepicker({
			format : 'dd/mm/yyyy',
			changeYear : true,
			changeMonth : true,
			autoclose : true,
			yearRange : "-50:+50",
			showButtonPanel : true,
			prevText : '<i class="fa fa-angle-left"></i>',
			nextText : '<i class="fa fa-angle-right"></i>'
		}).on('changeDate', function(ev) {
			var dateStr = $('#attendanceDate').val()
			$.ajax({
				url : 'renderLectureDropDown',
				method : 'POST',
				data : {
					attendanceDate : dateStr
				},
				success : function(resp) {
					$("#lectureSelect").replaceWith(resp)
				}
			})
		});
	</script>

</body>
</html>