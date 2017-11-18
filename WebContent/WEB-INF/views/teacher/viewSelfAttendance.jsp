<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <sec:ifAnyGranted roles="ROLE_TEACHER">
        <meta name="layout" content="teacher">
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_SCHOOL_LIBRARIAN">
        <meta name="layout" content="librarian">
    </sec:ifAnyGranted>
    <title>Attendance List</title>
</head>

<body>
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">
                            <sec:ifAnyGranted roles="ROLE_TEACHER">
                                <li><a href="attendance"><span
                                        class="count">1</span>Create/Upload Attendance</a></li>
                                <li><a href="viewAttendance"><span
                                        class="count">2</span>View Attendance</a></li>
                                <li><a href="createSelfAttendance"><span
                                        class="count">3</span>Create Self Attendance</a></li>
                                <li class="active"><span
                                        class="count">4</span>View Self Attendance</li>
                            </sec:ifAnyGranted>
                           <!--  <sec:ifAnyGranted roles="ROLE_SCHOOL_LIBRARIAN">
                                <li>
                                    <a href="viewSelfAttendance"><span
                                            class="count">1</span>Create Self Attendance</a></li>
                                <li class="active"><span
                                        class="count">2</span>View Self Attendance</li>
                            </sec:ifAnyGranted> -->
                        </ul>
                    </div>
                </div>

                <div class="col-md-9" style="margin-bottom: 5%">
                    <div class="avatar-acount ">
                        
                        <table class="table table-bordered">
                            <tr>
                                <th>From</th>
                                <th>To</th>
                                <th>Count</th>
                                <th>Status</th>
                            </tr>
                           <%--  <g:each in="${leaveApplicationList}" var="leaveApplication">
                                <tr>
                                    <td>${leaveApplication?.leaveFrom?.format("dd/MMM/yyyy")}</td>
                                    <td>${leaveApplication?.leaveUpto?.format("dd/MMM/yyyy")}</td>
                                    <td>${leaveApplication?.leaveCount}</td>
                                    <td>${leaveApplication?.leaveApplicationState?.value}</td>
                                </tr>
                            </g:each> --%>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>

    $(document).on('click', "#searchBtn", function () {
        $("#tableContent").hide();
        $.ajax({
            url: 'viewAttendance',
            method: 'POST',
            data: {
                lecture: $("#lecture").val(),
                attendanceDate: $("#attendanceDate").val()
            },
            success: function (resp) {
                $("#tableContent").replaceWith(resp)
            }
        })
    });
    $('#attendanceDate').datepicker({
        format: 'dd/mm/yyyy',
        changeYear: true,
        changeMonth: true,
        autoclose: true,
        yearRange: "-50:+50", showButtonPanel: true,
        prevText: '<i class="fa fa-angle-left"></i>',
        nextText: '<i class="fa fa-angle-right"></i>'
    }).on('changeDate', function (ev) {
        var dateStr = $('#attendanceDate').val()
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

</body>
</html>