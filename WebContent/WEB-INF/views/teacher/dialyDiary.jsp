<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function() {

		getAllSecSubForTech();
		
	});
	function getAllSecSubForTech() {
		var select1 = $('#subjectTeacher');
		$
				.ajax({
					url : 'getAllSecSubForTech',
					contentType : "application/json; charset=utf-8",
					dataType : "json",

					success : function(data) {
						select1.html('');
						
						select1
								.append('<option value="">Please select Subject </option>');
						$
								.each(
										data,
										function(i, item) {

											select1
													.append('<option value="' + item.section + '">'
															+ item.subject
															+ '</option>');

										});
					}
				});

	}
</script>

<!-- CREATE COURSE CONTENT -->
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">

                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">

                            <li class="active"><span class="count">1</span>Daily Diary</li>
                            <li><span class="count">2</span>
                                <a href="viewUpdateDailyDiary">View / Update Daily Diary</a>
                            </li>
                        </ul>

                    </div>
                </div>

                <div class="col-md-9">
                    <div class="create-course-content">

                        <div class="tab-content">
                            <!-- DESIGN OUTLINE -->
                            <div class="tab-pane fade in active" id="design-outline">

                                <!-- SECTIONS -->
                                <div class="dc-sections">
                                    <div id="message"></div>
                                    <!-- DC SECTION INFO -->
                                    <div class="dc-section-info">
                                        <div class="title-section">
                                            <h4 class="xsm">Daily Diary Entry</h4>

                                        </div>

                                        <!-- DC SECTION BODY -->
                                        <div class="dc-section-body">

                                            <!-- DC UNIT -->
                                            <div class="promo-video create-item">
                                                <form  action="dailyDiaryByTeacher">

                                                    <div class="course-banner create-item">

                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Date</h4>
                                                            </div>

                                                            <div class="col-md-9">

                                                                <div class="form-item">

                                                                    <input type="text"
                                                                           id="diaryDate"
                                                                           name="dateOfDiary" placeholder="Select Date">

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="promo-video create-item">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Select Lecture</h4>
                                                            </div>

                                                            <div class="col-md-9">
                                                                <div class="col-md-12" name="lecture" id="lecture">
                                                                   <!--  <g:render
                                                                            template="/teacher/template/lectureTemp"/> -->
                                                                            <div id="lectureSelect" class="form-group">
																			    <select id="lecture" class="col-md-12 form-item form-control" name="lecture">
																			        <option value="" selected="">Select Lecture</option>
																			       <%--  <g:each in="${lectureList?.sort { it?.period }}"
																			                var="lecture">
																			            <g:set var="schoolSectionMapping" value="${lecture?.schoolSectionMapping}"/>
																			            <option value="${lecture?.id}">${schoolSectionMapping.section?.displayClassDetail} (${lecture?.period?.value})</option>
																			        </g:each> --%>
																			
																			    </select>
																			</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="promo-video create-item">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Select Subject</h4>
                                                            </div>

                                                            <div class="col-md-9">
                                                                <div class="col-md-12">
                                                                    <select id="subjectTeacher"
                                                                            class="col-md-12 form-item form-control"
                                                                            name="subjectTeacher" id="subjectTeacher">
                                                                      <!--   <option value=""
                                                                                selected="">Select Subject</option> -->
                                                                       <%--  <g:each in="${teacher?.subjectTeachers}"
                                                                                var="subjectTeacher">
                                                                            <option value="${subjectTeacher?.id}">${subjectTeacher?.subject?.name}</option>
                                                                        </g:each> --%>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="description create-item">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Remark</h4>
                                                            </div>

                                                            <div class="col-md-9">
                                                                <div class="form-item">
                                                                    <textarea name="remark"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="description create-item">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Description</h4>
                                                            </div>

                                                            <div class="col-md-9">
                                                                <div class="form-textarea-wrapper">
                                                                    <textarea name="description"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-submit-1">
                                                        <input type="submit" value="Send"
                                                               class="mc-btn btn-style-1">
                                                    </div>

                                               
                                                </form>
                                            </div>

                                        </div>
                                        <!-- END / DC SECTION BODY -->

                                    </div>
                                    <!-- END / DC SECTION INFO -->

                                    <!-- BUTTON ADD AND POPUP SECTION -->
                                    <!-- END / BUTTON ADD AND POPUP SECTION -->

                                </div>
                                <!-- END / SECTIONS -->


                                <!-- ADD QUESTION POPUP -->
                                <!-- END / ADD QUESTION POPUP -->

                            </div>
                            <!-- END / DESIGN OUTLINE -->

                            <!-- DESIGN QUESTION -->
                            <!-- END / DESIGN QUESTION -->

                            <!-- DESIGN ASSIGNMENT -->
                            <!-- END / DESIGN ASSIGNMENT -->

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- END / CREATE COURSE CONTENT -->



<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>
    $('#diaryDate').datepicker({
        format: 'dd/mm/yyyy',
        changeYear: true,
        changeMonth: true,
        autoclose: true,
        yearRange: "-50:+50", showButtonPanel: true,
        prevText: '<i class="fa fa-angle-left"></i>',
        nextText: '<i class="fa fa-angle-right"></i>'
    }).on('changeDate', function (ev) {
        var dateStr = $('#diaryDate').val();
        console.log("////////diaryDate");
        $.ajax({
            url: 'renderLectureDropDown',
            method: 'POST',
            data: {
                attendanceDate: dateStr
            },
            success: function (resp) {
                $("#lectureSelect").replaceWith(resp)
            }
        })
    });

</script>
