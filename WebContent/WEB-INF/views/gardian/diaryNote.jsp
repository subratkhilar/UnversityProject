<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="guardian">
    <title>Diary Note</title>
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
                    Message:  <b>${studentLeaveApplication?.notificationMsg}</b>
                    <br/>
                    <br/>

                    <g:form controller="guardian" action="diaryNote">
                        <g:hiddenField name="id" value="${studentLeaveApplication?.id}"/>
                        <g:textArea name="diaryNote" class="form-control" rows="7"
                                    value="${studentLeaveApplication?.diaryNote}"/>
                        <g:submitButton name="Submit" class="mc-btn btn-style-2"/>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>