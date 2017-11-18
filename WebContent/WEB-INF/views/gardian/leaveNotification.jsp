<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="guardian">
    <title>Leave Notification</title>
    <parameter name="menu" value="leaveNotification"/>
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
                    <g:if test="${studentLeaveApplication?.notificationMsg}">
                        Message:  <b>${studentLeaveApplication?.notificationMsg}</b>
                    </g:if>
                    <br/>
                    <br/>


                    <g:form controller="guardian" action="saveLeaveNotification">
                        <g:select name="leaveNotificationType" id="leaveNotificationType" noSelection="['': 'Select']"
                                  from="${com.spandhan.setting.Enums.LeaveNotificationType.list()}" optionKey="key"
                                  optionValue="value" class="form-control"/>
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
                id: '${params?.id}'
            },
            success: function (resp) {
                $("#defaultApplication").replaceWith(resp)
            }
        })
    })
</script>
</body>
</html>