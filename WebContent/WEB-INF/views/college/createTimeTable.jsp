<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<style>
.rotate {
	-webkit-transform: rotate(-90deg);
	-moz-transform: rotate(-90deg);
	-ms-transform: rotate(-90deg);
	-o-transform: rotate(-90deg);
	transform: rotate(-90deg);
	/* also accepts left, right, top, bottom coordinates; not required, but a good idea for styling */
	-webkit-transform-origin: 50% 50%;
	-moz-transform-origin: 50% 50%;
	-ms-transform-origin: 50% 50%;
	-o-transform-origin: 50% 50%;
	transform-origin: 50% 50%;
	/* Should be unset in IE9+ I think. */
	filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
}
</style>
</head>

<body>
	<section>
		<div class="container">
			<div class="row">
				<!-- FORM -->

				<div class="col-lg-12 col-md-12"
					style="margin-top: 10px; margin-bottom: 10px; background-color: #E9E9E9 !important">
					<div class="form-login"
						style="background-color: #E9E9E9 !important;">

						<div id="message"></div>
						<h2 style="color: #37abf2">TimeTable</h2>

						<div class="col-md-4">
							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select id="schoolDropdown" class="select" name="school"
											style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select College</option>
											<c:forEach items="${clgList}" var="clgList">
												<option value="${clgList.collegeId}">${clgList.collegeName}</option>
											</c:forEach>
										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-email" style="margin-top: 18px">
								<div class="mc-select-wrap">
									<div class="mc-select">
										<select id="sectionDropdown" class="select" name="school"
											style="z-index: 10; opacity: 0;">
											<option value="" selected="">Please Select Section</option>

										</select><i class="fa fa-angle-down"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<a href="javascript:void(0)" id="search"
								class="mc-btn btn-style-1">Search</a>
						</div>

						<div id="timeTableId" class="col-md-12 table-responsive"
							style="margin-top: 10px" id="">
							<table class="table table-bordered table-striped" id="records_table">
							</table>
						</div>
						<!-- <g:render
							template="/administrator/template/timetable/assignTemplate"
							model="[school: school]" />
						<g:render
							template="/administrator/template/timetable/multipleAssignTemplate"
							model="[school: school]" />

						<g:render
							template="/administrator/template/timetable/timetableTemplate"
							model="[school: school]" /> -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function() {
			getAllTimeTable();

		});
		function getAllTimeTable() {

			var collegeId = "";
			if (collegeId == null || collegeId == 'undefiend') {

			}
			alert("collegeId >> " + collegeId);
			$
					.ajax({
						url : 'getTimeTablesDetails',
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						data : "collegeId=" + collegeId,
						success : function(data) {
							//alert(JSON.stringify(data));
							var trHTML = '';
							$('#records_table').html('');
							trHTML = '<thead><tr><th>Day<span style="writing-mode: tb-rl;float: right">Period</span></th><th>Period1</th><th>Period2</th><th>Period3</th><th>Period4</th><th style="text-align: center"><span style="writing-mode: tb-rl;width: 10px">Break</span></th><th>Period5</th><th>Period6</th><th>Period7</th><th>Period8</th></tr></thead>';
							$.each(data, function(i, item) {
								var period1 = item.period1.split('#');
								var period2 = item.period2.split('#');
								var period3 = item.period3.split('#');
								var period4 = item.period4.split('#');
								var period5 = item.period5.split('#');
								var period6 = item.period6.split('#');
								var period7 = item.period7.split('#');
								var period8 = item.period8.split('#');
								trHTML += '<tbody><tr><td>' + item.day
										+ '</td><td style="text-align: center;background-color:#' + period1[1]+ '!important;">' + period1[0]+ '</td></td>'
										+ '</td><td style="text-align: center;background-color:#' + period2[1]+ '!important;">' + period2[0]+ '</td></td>'
										+ '</td><td style="text-align: center;background-color:#' + period3[1]+ '!important;">' + period3[0]+ '</td></td>'
										+ '</td><td style="text-align: center;background-color:#' + period4[1]+ '!important;">' + period4[0]+ '</td></td>'
										+ '</td><td style="text-align: center"><span style="writing-mode: tb-rl;width: 10px">Break</span></td></td>'
										+ '</td><td style="text-align: center;background-color:#' + period5[1]+ '!important;">' + period5[0]+ '</td></td>'
										+ '</td><td style="text-align: center;background-color:#' + period6[1]+ '!important;">' + period6[0]+ '</td></td>'
										+ '</td><td style="text-align: center;background-color:#' + period7[1]+ '!important;">' + period7[0]+ '</td></td>'
										+ '</td><td style="text-align: center;background-color:#' + period8[1]+ '!important;">' + period8[0]+ '</td></td>'
										+'</tr></tbody>';

							});
							$('#records_table').append(trHTML);

						}
					});
		}
		$(document).on('change', '#teacherDropdown', function() {
			console.log($(this).val());
			$.ajax({
				url : 'renderSubjectOfTeacher',
				method : 'POST',
				data : {
					teacher : $(this).val(),
					schoolSectionMapping : $("#sectionDropdown").val()
				},
				success : function(response) {
					$("#subjectDropdown").replaceWith(response)
				}
			})
		})
		function openAssignModal(day, period) {
			$("#dayHidden").val(day);
			$("#periodHidden").val(period);
			$("#assign").modal('show');
		}
		//TODO: Work on this in case multiple school it create error
		$(document).on('click', '#schoolDropdown', function() {
			console.log($(this).val());
			var val = $(this).val();
			$("#schoolHidden").val(val)
			//        $("#sectionHidden").val('')
		});
		$(document).on('click', '#sectionDropdown', function() {
			console.log($(this).val())
			$("#sectionHidden").val($(this).val())
		});
		$(document).on('click', '#assignSubmitBtn', function() {
			var day = $("#dayHidden").val();
			var period = $("#periodHidden").val();
			$.ajax({
				url : 'lecture',
				method : 'POST',
				data : $("#assignForm").serialize(),
				success : function(response) {
					var json = JSON.parse(response);
					if (json.status == "SUCCESS") {
						$("#" + day + "_" + period).replaceWith(json.html);
						$("#assign").modal('hide');
					}
				}
			})
		});
		$(document).on('click', '#search', function() {
			$.ajax({
				url : 'lecture',
				method : 'GET',
				data : {
					schoolSectionMapping : $("#sectionDropdown").val()
				},
				success : function(response) {
					$("#timeTableId").replaceWith(response)
				}
			})
		});
	</script>
	<input type="hidden" id="csrfToken" value="${_csrf.token}" />
	<input type="hidden" id="csrfHeader" value="${_csrf.headerName}" />