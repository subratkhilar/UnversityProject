
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">
                            <li class="active"><span class="count">1</span>Create Weekly Planner</li>
                            <li><a href="viewWeeklyPlanner"><span
                                    class="count">2</span>Update Weekly Planner</a></li>
                        </ul>
                    </div>
                </div>
                <form  action="weeklyPlanner">
                    <div class="col-md-9 avatar-acount" style="margin-bottom: 5%">
                       

                        <div class="col-md-3 form-group">
                            <input type="text" class="col-md-12 form-control date" name="startDate"
                                   placeholder="Start Date">
                        </div>

                        <div class="col-md-3 form-group">
                            <input type="text" class="col-md-12 form-control date" name="endDate"
                                   placeholder="End Date">
                        </div>

                        <div class="col-md-3 form-group">
                            <select id="section" class="col-md-12 form-item form-control" name="schoolSectionMapping">
                                <option value="" selected="">Section</option>
                                 <option value="iii-A" >III-A</option>
                               </select>
                        </div>

                        <div class="col-md-3 form-group">
                            <div id="subject" class="form-group">
							    <select id="subjectTeacher" class="col-md-12 form-item form-control" name="subjectTeacher">
							        <option value="" selected="">Subject</option>
							       
							            <option value="HINDI">HINDI</option>
							       
							    </select>
							</div>
                        </div>

                       <%--  <g:each in="${com.spandhan.Day.list()}" var="day">
                            <div class="col-md-12" style="margin-top: 20px">
                                <div class="col-md-1 col-sm-12" style="text-align: center">
                                    <b>${day?.getShortName()}</b>
                                </div>

                                <div class="col-md-6">

                                    <div class="col-md-3 form-group">
                                        <input type="text" class="col-md-12 form-control" name="${day}chapter"
                                               placeholder="Chapter">
                                    </div>

                                    <div class="col-md-3 form-group">
                                        <input type="text" class="col-md-12 form-control" name="${day}pageFrom"
                                               placeholder="From">
                                    </div>

                                    <div class="col-md-3 form-group">
                                        <input type="text" class="col-md-12 form-control" name="${day}pageTo"
                                               placeholder="To">
                                    </div>

                                    <div class="col-md-3 form-group">
                                        <input type="text" class="col-md-12 form-control" name="${day}exerciseNo"
                                               placeholder="Exercise No">
                                    </div>
                                </div>

                                <div class="col-md-3 form-group">
                                    <input type="text" class="col-md-12 form-control" name="${day}comment"
                                           placeholder="Comment">
                                </div>

                                <div class="col-md-2 form-group">
                                    <select class="col-md-12 form-item form-control" name="${day}plannerStatus">
                                        <option value="" selected="">Status</option>
                                        <g:each in="${com.spandhan.setting.Enums.PlannerStatus.list()}"
                                                var="plannerStatus">
                                            <option value="${plannerStatus?.key}">${plannerStatus?.value}</option>
                                        </g:each>
                                    </select>
                                </div>
                            </div>
                        </g:each> --%>

                        <div class="col-md-12" style="margin-top: 20px;margin-bottom: 10px">
                            <div class="col-md-1"></div>

                            <div class="col-md-10">
                                <div class="col-md-2">
                                    <input type="radio" checked value="OPEN" name="weeklyPlannerStatus"> OPEN
                                </div>

                                <div class="col-md-2">
                                    <input type="radio" value="CLOSE" name="weeklyPlannerStatus"> CLOSE
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <input type="submit" name="Submit" style="margin-top: 10px;margin-bottom: 10px"
                                            class="mc-btn btn-style-2"/>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</section>

<link rel="stylesheet" type="text/css" href="css/datepicker.css"/>
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>
    $(document).on('change', '#section', function () {
        console.log($(this).val())
        $.ajax({
            url: 'renderTeacherSubject',
            method: 'POST',
            data: {
                schoolSectionMapping: $(this).val()
            },
            success: function (resp) {
                $("#subject").replaceWith(resp)
            }
        })
    })
    $('.date').datepicker({
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