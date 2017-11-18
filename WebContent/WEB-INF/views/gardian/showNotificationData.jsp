<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<c:url var="collegeRegister" value="collegeRegistration/save"
	scope="request" />
<script type="text/javascript"
	src="<c:url value='/js/library/jquery-1.11.0.min.js' />"></script>
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="css/popup.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	var jq = jQuery.noConflict();
	jq(document).ready(function() {
		$("#diartNoteDiv").hide();
		$("#sickLvNoteDiv").hide();
		$("#emLeaveNoteDiv").hide();

	});
	function showNotifyData() {
		$("#diartNoteDiv").hide();
		var notValue = $("#notificType").val();
		if (notValue == 'diaryNote') {
			$("#diartNoteDiv").show();
			$("#emLeaveNoteDiv").hide();
			$("#sickLvNoteDiv").hide();
		} else if (notValue == 'emLeave') {
			$("#diartNoteDiv").hide();
			$("#emLeaveNoteDiv").show();
			$("#sickLvNoteDiv").hide();
		} else if (notValue == 'sickLeave') {
			$("#diartNoteDiv").hide();
			$("#emLeaveNoteDiv").hide();
			$("#sickLvNoteDiv").show();
		} else {
			$("#diartNoteDiv").hide();
			$("#sickLvNoteDiv").hide();
			$("#emLeaveNoteDiv").hide();
		}
	}
</script>
</head>
<body>



	<section id="course-concern" class="course-concern"
		style="padding-bottom: 11%">

	<div class="container">
		<div class="col-lg-12 colmd-12" style="margin-top: 10px">
			<div class="form-login" style="background-color: #E9E9E9 !important;">
				<form>
					<div>
						Message: Pravat is absent from 17/Oct/2016. Hope everything is fine.Please submit Diary Note and if more than 3 days please submit leave letter at the end of the leave to be updated in the system. 
						
					</div>
					<div class="form-email" style="margin-top: 18px">
						<div class="mc-select-wrap">
							<div class="mc-select">
								<select class="select" name="notificType" id="notificType"
									style="z-index: 10; opacity: 0;" onchange="showNotifyData();">
									<option value="" selected="">Select</option>

									<option value="diaryNote">Diary Note</option>

									<option value="emLeave">Emergency Leave</option>
									<option value="sickLeave">Sick Leave</option>

								</select><i class="fa fa-angle-down"></i>
							</div>
						</div>
					</div>
					<div id="diartNoteDiv">
						<table>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>To,</td>
							</tr>
							<tr>
								<td>The principal</td>
							</tr>
							<tr>
								<td>spandana innovative school</td>
							</tr>
							<tr>
								<td><p></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
						<div class="form-address">
							<textarea name="remark" id="remark" placeholder="Remark"></textarea>
						</div>
						<table>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>Thanking you,</td>
							</tr>
							<tr>
								<td>Yours Sincerely,</td>
							</tr>
							<tr>
								<td>Rakesh</td>
							</tr>
							<tr>
								<td><p></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>
					<div id="emLeaveNoteDiv">
						<table>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>To,</td>
							</tr>
							<tr>
								<td>The principal</td>
							</tr>
							<tr>
								<td>spandana innovative school</td>
							</tr>
							<tr>
								<td><p></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>SUBJECT: Sick Leave from school</td>
							</tr>
							<tr>
								<td>Respected Sir/Madam,</td>
							</tr>
							<tr>
								<td>My son/daughter <select id="childId"><option
											value="Ram">Ram</option></select> studying in your college in class <select
									id="classId"><option value="III-A">III-A</option></select> Due
									to some emergency in family (from
								</td>
							</tr>

						</table>
						<div class="form-phone">
							<input type="text" name="leaveStdate" id="leaveStdate"
								placeholder="Leave Start Date">
						</div>
						to
						<div class="form-phone">
							<input type="text" name="leaveEndDate" id="leaveEndDate"
								placeholder="Leave End Date">
						</div>
						<div>
							<br> and he was not able to attend the classes (from
							17/Oct/2016 to 17/Oct/2016)

						</div>
						<br>
						<div class="form-address">
							<textarea name="remark" id="remark" placeholder="Remark"></textarea>
						</div>
						<table>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>So I kindly request you to allow him leave for above
									mentioned dates.</td>
							</tr>
							<tr>
								<td>Thanking you,</td>
							</tr>
							<tr>
								<td>Yours Sincerely,</td>
							</tr>
							<tr>
								<td>Rakesh</td>
							</tr>
							<tr>
								<td><p></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>
					<div id="sickLvNoteDiv">
						<table>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>To,</td>
							</tr>
							<tr>
								<td>The principal</td>
							</tr>
							<tr>
								<td>spandana innovative school</td>
							</tr>
							<tr>
								<td><p></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>SUBJECT: Sick Leave from school</td>
							</tr>
							<tr>
								<td>Respected Sir/Madam,</td>
							</tr>
							<tr>
								<td>My son/daughter <select id="childId"><option
											value="Ram">Ram</option></select> studying in your college in class <select
									id="classId"><option value="III-A">III-A</option></select> 
									He has been sick from
								</td>
							</tr>

						</table>
						<div class="form-phone">
							<input type="text" name="leaveStdate" id="leaveStdate"
								placeholder="Leave Start Date">
						</div>
						to
						<div class="form-phone">
							<input type="text" name="leaveEndDate" id="leaveEndDate"
								placeholder="Leave End Date">
						</div>
						<div>
							<br> and he was not able to attend the classes.


						</div>
						<br>
						<div class="form-address">
							<textarea name="remark" id="remark" placeholder="Remark"></textarea>
						</div>
						<table>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>So I kindly request you to allow him leave for above
									mentioned dates.</td>
							</tr>
							<tr>
								<td>Thanking you,</td>
							</tr>
							<tr>
								<td>Yours Sincerely,</td>
							</tr>
							<tr>
								<td>Rakesh</td>
							</tr>
							<tr>
								<td><p></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>
					<div>
						<input type="button" id="submitInstitute" onclick="submitData()"
							value="submit" class="mc-btn btn-style-1">
					</div>
				</form>
			</div>
		</div>


	</div>
	</section>
	<input type="hidden" id="csrfToken" value="${_csrf.token}" />
	<input type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
</body>
</html>