<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="teacher">
    <title>Daily Diary</title>
</head>

<body>

<!-- CREATE COURSE CONTENT -->
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">

            <div class="row">

                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">

                            <li><span class="count">1</span><a
                                    href="${createLink(controller: 'teacher', action: 'dailyDiaryByTeacher')}">Daily
                                Diary</a></li>
                            <li class="active"><span class="count">2</span>View / Update Daily Diary</li>
                        </ul>

                    </div>
                </div>

                <div class="col-md-9">
                    <div class="create-course-content">

                        <div class="tab-content">

                            <!-- DESIGN OUTLINE -->
                            <div class="tab-pane fade in active" id="design-outline">

                                <!-- SECTIONS -->
                                <div class="dc-sections">
                                    <g:render template="/common/flash"/>
                                    <!-- DC SECTION INFO -->
                                    <div class="dc-section-info">
                                        <div class="title-section">
                                            <h4 class="xsm">Update Daily Diary</h4>
                                        </div>

                                        <!-- DC SECTION BODY -->
                                        <div class="dc-section-body">

                                            <!-- DC UNIT -->
                                            <div class="promo-video create-item">
                                                <g:form controller="teacher" action="updateDiaryNote">
                                                    <g:hiddenField name="diaryId"
                                                                   value="${dailyDiary?.id}"></g:hiddenField>

                                                    <div class="course-banner create-item">

                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Date</h4>
                                                            </div>

                                                            <div class="col-md-9">

                                                                <div class="form-item">

                                                                    <input type="text"
                                                                           id="diaryDate"
                                                                           value="${dailyDiary?.dateOfDiary?.format("dd/MM/yyyy")}"
                                                                           name="dateOfDiary"
                                                                           placeholder="Select Date" disabled>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="promo-video create-item">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Lecture</h4>
                                                            </div>

                                                            <div class="col-md-9">
                                                                <div class="form-item">

                                                                    <input type="text"
                                                                           value="${dailyDiary?.lecture?.schoolSectionMapping.section?.displayClassDetail}(${dailyDiary?.lecture?.period?.value})"

                                                                           disabled>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="promo-video create-item">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Subject</h4>
                                                            </div>

                                                            <div class="col-md-9">
                                                                <div class="form-item">

                                                                    <input type="text"
                                                                           value="${dailyDiary?.subjectTeacher?.subject?.name}"

                                                                           disabled>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="description create-item">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Remark</h4>
                                                            </div>

                                                            <div class="col-md-9">
                                                                <div class="form-item">
                                                                    <textarea
                                                                            name="remark">${dailyDiary?.remark}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="description create-item">
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <h4>Description</h4>
                                                            </div>

                                                            <div class="col-md-9">
                                                                <div class="form-textarea-wrapper">
                                                                    <textarea
                                                                            name="description">${dailyDiary?.description}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-submit-1">
                                                        <div class="col-md-6">
                                                            <input type="submit" value="Update"
                                                                   class="mc-btn btn-style-1">
                                                        </div>

                                                        <div class="col-md-6">
                                                            <a class="xsm"
                                                               href="${createLink(controller: 'teacher', action: 'viewUpdateDailyDiary')}">
                                                                <div class="mc-btn btn-style-1">

                                                                    Back

                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>

                                                </g:form>
                                            </div>

                                        </div>
                                        <!-- END / DC SECTION BODY -->

                                    </div>
                                    <!-- END / DC SECTION INFO -->

                                    <!-- BUTTON ADD AND POPUP SECTION -->
                                    <!-- END / BUTTON ADD AND POPUP SECTION -->

                                </div>
                                <!-- END / SECTIONS -->


                                <!-- ADD QUESTION POPUP -->
                                <!-- END / ADD QUESTION POPUP -->

                            </div>
                            <!-- END / DESIGN OUTLINE -->

                            <!-- DESIGN QUESTION -->
                            <!-- END / DESIGN QUESTION -->

                            <!-- DESIGN ASSIGNMENT -->
                            <!-- END / DESIGN ASSIGNMENT -->

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- END / CREATE COURSE CONTENT -->

</body>
</html>