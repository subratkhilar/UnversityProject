
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">
                            <li><a href="weeklyPlanner"><span
                                    class="count">1</span>Create Weekly Planner</a></li>
                            <li class="active"><span class="count">2</span>Update Weekly Planner</li>
                        </ul>
                    </div>
                </div>
                <form  action="viewWeeklyPlanner">
                    <div class="col-md-9 avatar-acount" style="margin-bottom: 10%">
                      <!--   <g:render template="/common/flash"/> -->
                      

                        <div class="col-md-4 form-group">
                            <select id="weeklyPlanner" class="col-md-12 form-item form-control" name="weeklyPlanner">
                                <option value="" selected="">Available Planner</option>
                               <%--  <g:each in="${com.spandhan.utility.Fetch.getAllWeeklyPlannerOfTeacher(teacher)}"
                                        var="weeklyPlanner">
                                    <g:if test="${weeklyPlanner?.plannerStartDate && weeklyPlanner?.plannerEndDate}">
                                        <option value="${weeklyPlanner?.id}">${weeklyPlanner?.plannerStartDate?.format("dd/MMM/yyyy")} TO ${weeklyPlanner?.plannerEndDate?.format("dd/MMM/yyyy")}</option>
                                    </g:if>
                                </g:each> --%>

                            </select>
                        </div>

                        <div class="col-md-2 form-group">
                            <select id="subjectTeacher" class="col-md-12 form-item form-control" name="subjectTeacher">
                                <option value="" selected="">Subject</option>
                               <%--  <g:each in="${teacher?.subjectTeachers}"
                                        var="subjectTeacher">
                                    <option value="${subjectTeacher?.id}">${subjectTeacher?.subject?.name}</option>
                                </g:each> --%>

                            </select>
                        </div>

                        <div class="col-md-3 form-group">
                            <select id="section" class="col-md-12 form-item form-control" name="schoolSectionMapping">
                                <option value="" selected="">Section</option>
                               <%--  <g:each in="${com.spandhan.utility.Fetch.teacherTeachingClasses(teacher)}"
                                        var="schoolSectionMapping">
                                    <option value="${schoolSectionMapping?.id}">${schoolSectionMapping.section?.displayClassDetail}</option>
                                </g:each> --%>
                            </select>
                        </div>


                        <div class="col-md-3 col-sm-12">
                            <a href="javascript:void(0)" id="searchBtn"
                               style="margin-top: 0px;margin-bottom: 0px"
                               class="mc-btn btn-style-2">Search</a>
                        </div>

                        <div class="col-md-12" style="margin-top: 30px !important;">
                           <!--  <g:render template="/teacher/template/weeklyPlannerTemplate"/> -->
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).on('click', '#searchBtn', function () {
        $.ajax({
            url: 'renderWeeklyPlannerTable',
            method: 'POST',
            data: {
                weeklyPlannerId: $("#weeklyPlanner").val(),
                subjectTeacherId: $("#subjectTeacher").val(),
//                month: $("#month").val(),
                section: $("#section").val()
            },
            success: function (resp) {
                $("#weeklyPlannerId").replaceWith(resp)
            }
        })
    })
    $(document).on('click', '#updatePlanner', function () {
        $.ajax({
            url: 'renderWeeklyPlannerTable',
            method: 'POST',
            data: {
                weeklyPlannerId: $("#weeklyPlanner").val(),
                subjectTeacherId: $("#subjectTeacher").val(),
//                month: $("#month").val(),
                section: $("#section").val()
            },
            success: function (resp) {
                $("#weeklyPlannerId").replaceWith(resp)
            }
        })
    })
</script>

