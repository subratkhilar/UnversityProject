
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">
                            <sec:ifAnyGranted roles="ROLE_TEACHER">
                                <li><a href="attendance"><span
                                        class="count">1</span> Create/Upload Attendance</a>
                                </li>
                                <li><a href="viewAttendance"><span
                                        class="count">2</span>View Attendance</a></li>
                                <li class="active"><span
                                        class="count">3</span>Create Self Attendance</li>
                                <li><a href="viewSelfAttendance"><span
                                        class="count">4</span>View Self Attendance</a></li>
                            </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SCHOOL_LIBRARIAN">
                                <li class="active"><span
                                        class="count">1</span>Create Self Attendance</li>
                               
                            </sec:ifAnyGranted>

                        </ul>
                    </div>
                </div>
                <form  action="createSelfAttendance">
                    <div class="col-md-9 avatar-acount" style="margin-bottom: 5%">
                        <div class=" ">

                            <div class="col-md-12">
                                <div class="col-md-12">
                                <div id="message"></div>
                                    <!-- <g:render template="/common/flash"/> -->

                                    <div class="alert alert-success">
                                        <i class="fa fa-exclamation-triangle"></i>
                                        <b>Last Attendance Date:<%--  ${com.spandhan.utility.Fetch?.getLastTeacherSelfAttendanceUpdated(teacher)?.attendanceDate?.format("dd/MMM/yyyy")} --%></b>
                                    </div>
                                </div>

                                <div class="col-md-4 form-group">
                                    <input style="border: 1px solid #d4d4d4" class="col-md-12 form-control"
                                           type="text"
                                           id="attendanceDate"
                                           name="dateStr"
                                           placeholder="Attendance Date">
                                </div>

                                <div class="col-md-4 form-group">
                                   <%--  <g:select name="attendanceStatus" class="form-control"
                                              from="${com.spandhan.AttendanceStatus.list()}" optionKey="key"
                                              optionValue="value"/> --%>
                                </div>
                                <input type="button" name="Submit" style="margin-top:0px !important;" id="finalSubmit"
                                                class="mc-btn btn-style-2"/>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</section>

<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>
    $('#attendanceDate').datepicker({
        format: 'dd/mm/yyyy',
        changeYear: true,
        changeMonth: true,
        autoclose: true,
        yearRange: "-50:+50", showButtonPanel: true,
        prevText: '<i class="fa fa-angle-left"></i>',
        nextText: '<i class="fa fa-angle-right"></i>'
    }).on('changeDate', function (ev) {
    });

</script>

</body>
</html>