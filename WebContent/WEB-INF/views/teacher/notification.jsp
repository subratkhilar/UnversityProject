<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<g:render template="/teacher/template/notificationModal"/>
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-12 create-course-content">
                    <div class="">

                        <!-- COURSE BANNER -->
                        <ul class="design-course-tabs" role="tablist">
                            <li class="active">
                                <a href="#design-outline" role="tab" data-toggle="tab"><i
                                        class="fa fa-bell"></i>Notification</a>
                            </li>
                            <li>
                                <a href="#design-question" role="tab" data-toggle="tab"><i
                                        class="fa fa-question-circle"></i>Broadcast</a>
                            </li>
                            
                        </ul>

                        <div class="tab-content">
                            <!-- DESIGN OUTLINE -->
                            <div class="tab-pane fade in active" id="design-outline"
                                 style="padding-bottom: 15% !important;">
                                <g:render template="/teacher/template/notificationTemp"
                                          model="[leaveApplicationList: leaveApplicationList]"/>
                            </div>
                            <!-- END / DESIGN OUTLINE -->

                            <!-- DESIGN QUESTION -->
                            <div class="tab-pane fade" id="design-question" style="padding-bottom: 15% !important;">
                                <g:render template="/teacher/template/broadcastTemp"
                                          model="[teacher: teacher, broadcastList: com.spandhan.utility.Fetch.getAllBroadcastMessageOfTeacher(teacher)]"/>

                            </div>
                            <!-- END / DESIGN QUESTION -->
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(".openModal").click(function () {
        var leaveApplication = $(this).attr("leaveApplication");
        var leaveNotificationType = $(this).attr("leaveNotificationType");
        $.ajax({
            url: 'defaultTemplateOfLeaveApplication',
            method: 'POST',
            data: {
                id: leaveApplication,
                leaveNotificationType: leaveNotificationType
            },
            success: function (resp) {
                $("#defaultApplication").html(resp);
                $("#notificationModal").modal('show');
            }
        })
    })
</script>
