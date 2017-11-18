<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="principal">
    <title>Spandhan: Create Event</title>
</head>

<body>

<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">
                            <li class="active"><span class="count">1</span>Create School Event</li>
                             <li><a href="viewApproveSchoolEvent">
                            <span  class="count">2</span>View / Approve School Event</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-9 avatar-acount" style="">
                    <div class=" ">
                        <!-- FORM -->

                        <div class="col-lg-12 col-md-12" style="">
                            <div class=" well well-lg">
                                <form controller="principal" action="schoolEvent">

                                    <!-- <g:render template="/common/flash"/> -->


                                    <div class="form-email">

                                        <div class="form-email">
                                            <input type="text" name="schoolEvent" placeholder="School Event">
                                        </div>

                                        <div class="form-email" style="padding-top: 10px;padding-bottom: 10px">
                                            <select id="month" class="col-md-12 form-control" name="month">
                                                <option value="" selected="">Select Month</option>
                                               <%--  <g:each in="${com.spandhan.setting.Enums.Month.list()}"
                                                        var="month">
                                                    <option value="${month?.key}">${month?.value}</option>
                                                </g:each> --%>
                                            </select>
                                        </div>

                                        <div class="form-submit-1">
                                            <input type="submit" style="color: white" value="Submit"
                                                   class="mc-btn btn-style-1">
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>