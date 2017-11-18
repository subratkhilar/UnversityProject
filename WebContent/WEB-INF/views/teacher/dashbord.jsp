<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="teacher">
    <title>Teacher Dashboard</title>
    <style>
    .circle {
        margin-top: 20px;
        padding-top: 30px;
        width: 150px;
        height: 150px;
        border-radius: 250px;
        font-size: 18px;
        border: 2px solid white;
        color: white;
        line-height: 30px;
        text-align: center;
        background: #2E7DCC;
    }

    .circle:hover {
        box-shadow: 5px 5px 15px;
        -moz-transform: scale(1.1);
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }

    @media screen and (max-width: 540px) {
        .categories-content .content [class*="col-"],
        .course-concern [class*="col-"] {
            width: 50% !important;
            float: right;
        }
    }

    @media (min-width: 768px) {
        .col-sm-4 {
            width: 24.333333%;
        }
    }
    </style>
</head>

<body>

<section id="course-concern" class="course-concern">
    <div class="container">
        <div class="row">
            <a href="classTimeTable">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa-calendar fa-3x"></i>
                        <br/>
                        Time Table
                    </div>
                </div>
            </a>

            <a href="weeklyPlanner">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa fa-th-large fa-3x"></i>
                        <br/>
                        Planner
                    </div>
                </div>
            </a>

            <a href="attendance">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa-check-square-o fa-3x"></i>
                        <br/>
                        Attendance
                    </div>
                </div>
            </a>

            <a href="dailyDiaryByTeacher">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class=" fa fa-book fa-3x"></i>
                        <br/>
                        Diary
                    </div>
                </div>
            </a>

            <a href="createExaminationDetail">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa-pencil fa-3x"></i>
                        <br/>
                        Results
                    </div>
                </div>
            </a>

            <a href="studentFeedback">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa-comment fa-3x"></i>
                        <br/>
                        Feedback
                    </div>
                </div>
            </a>

            <a href="techcurriculum">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa-book fa-3x"></i>
                        <br/>
                        Curriculum
                    </div>
                </div>
            </a>

            <a href="techNotification">
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <div class="circle">
                        <i class="fa fa-bell fa-3x"></i>
                        <br/>
                        Notification
                    </div>
                </div>
            </a>

            

        </div>
    </div>
</section>
<!-- END / COURSE CONCERN -->
