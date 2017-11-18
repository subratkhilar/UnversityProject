<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="guardian">
    <title>Communicate with Teacher</title>
    <parameter name="menu" value="communicateWithTeacher"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'datepicker.css')}">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-datepicker.js')}"></script>



</head>

<body>

<section id="course-concern" class="course-concern">
    <div class="container">
        <div class="row">
            <div class="col-md-12 mc-select-wrap">
                <h2>
                    Notification
                </h2>
            </div>


            <div class="col-md-12 avatar-acount form-group" style="padding-bottom: 3%">
                <g:render template="/common/flash"/>
                <div>
                    <g:form controller="guardian" action="saveLeaveNotificationFromParent">
                        %{--<div class="mc-select-wrap">--}%
                            %{--<div class="mc-select">--}%
                                %{--<select id="studentDropdown" class="col-md-12 form-item form-control" name="studentId">--}%
                                    %{--<option value="" selected="">Select Student</option>--}%
                                    %{--<g:each in="${setOfStudents}" var="student">--}%
                                        %{--<option value="${student?.id}">${student?.name}</option>--}%
                                    %{--</g:each>--}%
                                %{--</select>--}%
                            %{--</div>--}%
                        %{--</div>--}%

                        <br>
                        <br>
                        <br>
                        <g:select name="leaveNotificationType" id="leaveNotificationType" noSelection="['': 'Select']"
                                  from="${com.spandhan.setting.Enums.LeaveNotificationType.list()}" optionKey="key"
                                  optionValue="value" class="col-md-12 form-item form-control"/>
                        <br/>
                        <br/>

                        <div id="defaultApplication">
                        </div>
                        <g:submitButton name="Submit" class="mc-btn btn-style-2"/>
                    </g:form>
                    <br/>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).on('change', '#leaveNotificationType', function () {
        $.ajax({
            url: '${createLink(controller: 'guardian',action: 'defaultTemplateOfLeaveApplication')}',
            method: 'POST',
            data: {
                leaveNotificationType: $(this).val(),
                id: '${params?.id}',
                parentInitiatedLeave: '${parentInitiatedLeave}',
                schoolId: '${schoolId}'
            },
            success: function (resp) {
                $("#defaultApplication").replaceWith(resp)
            }
        })
    })


</script>
</body>
</html>