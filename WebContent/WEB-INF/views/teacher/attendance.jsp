<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function() {
		getAllSecSubForTech();
		$('#submitDiv').hide();

	});
	function getAllSecSubForTech() {
		var select1 = $('#subject');
		$
				.ajax({
					url : 'getAllSecSubForTech',
					contentType : "application/json; charset=utf-8",
					dataType : "json",

					success : function(data) {
						select1.html('');
						
						select1.append('<option value="">Please select Subject </option>');
						$.each(
								data,function(i, item) {
									select1.append('<option value="' + item.section + '">'+ item.subject+ '</option>');
							});
					}
				});

	}
</script>
<section id="create-course-section" class="create-course-section">
	<div class="first-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="create-course-sidebar">
						<ul class="list-bar">
							<li class="active"><span class="count">1</span>
								Create/Upload Attendance</li>
							<li><a href="viewAttendance"><span class="count">2</span>View
									Attendance</a></li>
							<li><a href="createSelfAttendance"><span class="count">3</span>Create
									Self Attendance</a></li>
							<li><a href="viewSelfAttendance"><span class="count">4</span>View
									Self Attendance</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-9 avatar-acount" style="margin-bottom: 5%">
					<div class="avatar-acount ">
						<!-- <g:render template="/common/flash"/> -->
						<div id="message"></div>

						<div class="col-md-12">

							<div class="col-md-6">
								<div class="alert alert-warning">
									<i class="fa fa-exclamation-triangle"></i> <b>Put mark on
										students who were present.</b>
								</div>
							</div>

							<div class="col-md-6">
								<div class="alert alert-success">
									<i class="fa fa-exclamation-triangle"></i> <b>Last
										Attendance Date: <%-- ${com.spandhan.utility.Fetch?.getLastAttendanceUpdated(teacher)?.attendanceDate?.format("dd/MMM/yyyy")} --%>
									</b>
								</div>
							</div>
						</div>

						<div class="col-md-3 form-group">
							<select name="period" id="period" class="form-control">
								<option value="">Select Period</option>
								<option value="period1">Period 1</option>
								<option value="period2">Period 2</option>
								<option value="period3">Period 3</option>
								<option value="period4">Period 4</option>
								<option value="period5">Period 5</option>
								<option value="period6">Period 6</option>
								<option value="period7">Period 7</option>
								<option value="period8">Period 8</option>
							</select>
						</div>

						<div class="col-md-3 form-group">
							<select name="subject" id="subject" class="form-control">
								<option value="">Select Subject</option>

							</select>
						</div>

						<div class="col-md-3 form-group">
							<input style="border: 1px solid #d4d4d4"
								class="col-md-12 form-control" type="text" id="attendanceDate"
								name="attendanceDate" placeholder="Attendance Date">
						</div>

						<div class="col-md-3">
							<a href="javascript:void(0)" id="searchBtn"
								style="margin-top: 0px; margin-bottom: 0px"
								class="mc-btn btn-style-2">Search</a>
						</div>

						<div id="tableContent" class="table-responsive"
							style="margin-top: 60px !important;">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 10%"><input type="checkbox"
											id="checkAll"> Check All</th>
										<th style="width: 10%">Late</th>
										<th style="width: 10%">Roll No</th>
										<th style="width: 30%">Name</th>
										<th style="width: 20%">Remark</th>
									</tr>
								</thead>
								<tbody id="records_table">
								</tbody>
							</table>
							<div id="submitDiv">

								<a href="javascript:void(0)" id="finalSubmit" style=""
									class="mc-btn btn-style-2">Submit</a>

							</div>
						</div>




					</div>
				</div>

			</div>
		</div>
	</div>

</section>

<link rel="stylesheet" type="text/css" href="css/datepicker.css" />
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>
	$(document).ready(function() {
		$("#checkAll").click();
	})

	$(document).on('click', '#finalSubmit', function() {
		var jsonObj = [];
		var attendace = {};
		var dateStr = $('#attendanceDate').val();

		$(".attendanceRow").each(function() {
			var item = {};
			item["student"] = $(this).find(".student").val();
			item["attendance"] = $(this).find(".attendance").is(":checked");
			item["late"] = $(this).find(".late").is(":checked");
			item["remark"] = $(this).find(".remark").val();
			jsonObj.push(item);
		});
		attendace["attendanceList"]=jsonObj;
		attendace["attendanceDate"]=dateStr;
		attendace["period"]=$("#period").val();
		attendace["subject"]=$("#subject").val();
		/* var addItem = {};
		addItem["dateStr"] = $('#attendanceDate').val();
		addItem["period"] =$("#period").val();
		addItem["subject"] = $("#subject").val();
		jsonObj.push(addItem); */
		var jsonData = JSON.stringify(jsonObj);
		var token = $('#csrfToken').val();
		var header = $('#csrfHeader').val();
		alert(JSON.stringify(attendace));
		$.ajax({
			url : 'attendanceSave',
			method : 'POST',
			  data: JSON.stringify(attendace), 
			 /*  data : {
				attendanceList : jsonData,
				attendanceDate : dateStr,
				period : $("#period").val(),
				subject : $("#subject").val()  
			}, */
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},
			/* data : {
				attendanceList : jsonData,
				attendanceDate : dateStr,
				period : $("#period").val(),
				subject : $("#subject").val()
			}, */
			success : function(resp) {
				alert("message");
				/* var json = JSON.parse(resp);
				console.log(json); */
				$('#message').append('<div class="alert alert-success fade in" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>' + resp.message	+ '</strong></div>')
			},error : function(e) {
				$('#message').append('<div class="alert alert-danger" style="text-align: center"> <i class="fa fa-asterisk"></i><strong>Error in Attendance Update !</strong></div>')
			}
		})
	});
	$(document).on('change', '#checkAll', function() {
		var boolean = this.checked;
		$(".attendance").each(function() {
			if (boolean) {
				$(this).prop("checked", true);
			} else {
				$(this).prop("checked", false);
			}
		})
	});

	$(document).on('change', '.late', function() {
		var boolean = this.checked;
		if (boolean) {
			var id = $(this).attr('student');
			$(".attendance" + id).removeAttr('checked');
		}
	});

	$(document).on('change', '.attendance', function() {
		var boolean = this.checked;
		if (boolean) {
			var id = $(this).attr('student');
			$(".late" + id).removeAttr('checked');
		}
	});

	$(document)
			.on(
					'click',
					"#searchBtn",
					function() {
						var select1 = $('#records_table');
						var trHTML = '';

						$
								.ajax({
									url : 'attendanceStudent',
									contentType : "application/json; charset=utf-8",
									dataType : "json",
									data : "section=" + $("#subject").val(),
									success : function(data) {
										alert(JSON.stringify("258===>"+data));
										var trHTML = '';
										$('#records_table').html('');
										$('#submitDiv').show();
										$.each(
												data,
												function(i, item) {
													trHTML += '<tr><td  class="attendanceRow"><input type="hidden" name="student" class="student" value="'+item.id+'"><input type="checkbox" class="attendance attendance'+item.id+'" student="'+item.id+'"></td>'
																+ '</td><td><input type="checkbox" class="late late'+item.id+'" student="'+item.id+'"></td><td>'
																+ item.rollNo
																+ '</td><td>'
																+ item.name
																+ '</td><td><input type="text" name="remark" class="col-md-12 remark"/></td></tr>';
										});
										$('#records_table').append(trHTML);

									}
								});

					})

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
	});
</script>
<input type="hidden" id="csrfToken" value="${_csrf.token}" />
<input type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
</body>
</html>