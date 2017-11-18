<html>
<head>
    <meta name="layout" content="librarian">
    <title>Update Book</title>
    <link rel="stylesheet" href="css/chosen.css"/>

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
                            <li>
                                <a href="bookAssignment">
                                    <span class="count">1</span>Create Book Assignment
                                </a>
                            </li>
                            <li class="active"><span class="count">2</span>Update Book Assignment</li>
                            <li>
                                <a href="libraryMonthlyReport">
                                    <span class="count">3</span>Library Report
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>

                <div class="col-md-9 form-group">
                    <div class="create-course-content" style="padding-bottom: 22%">

                        <div class="tab-content">
                            <!-- DESIGN OUTLINE -->
                            <div class="tab-pane fade in active" id="design-outline">

                                <!-- SECTIONS -->
                                <div class="dc-sections">
                                    <!-- <g:render template="/common/flash"/> -->
                                </div>

                                <div class="col-md-12">
                                   

                                    <div class="col-md-3">
                                        <select name="schoolSectionMapping" id="schoolSectionMapping"
                                                class="schoolSectionMappingChosen form-control col-md-12"
                                                placeholder="Select Class">
                                          <%--   <g:each in="${com.spandhan.utility.Fetch.getSections(librarian?.school)}"
                                                    var="schoolSectionMapping">
                                                <option value="${schoolSectionMapping?.id}">${schoolSectionMapping?.section?.displayClassDetail}</option>
                                            </g:each> --%>
                                        </select>
                                    </div>

                                    <div class="col-md-5">
                                       <!--  <g:render template="template/studentFilter"/> -->
                                    </div>

                                    <div class="col-md-3">
                                        <a href="javascript:void(0)" id="search" class="mc-btn btn-style-1"
                                           style="margin-top: 0px !important;">Search</a>
                                    </div>

                                   <!--  <g:render template="template/updateBookAssignmentBody"/> -->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- END / CREATE COURSE CONTENT -->


<script src="js/chosen.jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>

    $(document).on('click', "#search", function () {
        $.ajax({
            url: 'renderIssueBook',
            method: 'POST',
            data: {
                student: $("#studentId").val()
            },
            success: function (resp) {
                $("#content").replaceWith(resp)
            }
        })
    });

    $(document).on('change', "#bookReturnStatus", function () {
        var bookReturnStatus = $(this).val();
        var libraryBookIssueId = $(this).attr('libraryBookIssueId');
        $.ajax({
            url: 'updateBookAssignment',
            method: 'POST',
            data: {
                libraryBookIssueId: libraryBookIssueId,
                libraryBookReturnStatus: bookReturnStatus
            },
            success: function (resp) {
                window.location.reload()
            }
        })
    });
    function autofillStudent() {
        $.ajax({
            url: 'renderStudent',
            method: 'POST',
            data: {
                schoolSectionMapping: $("#schoolSectionMapping").val()
            },
            success: function (resp) {
                $("#student").replaceWith(resp)
            }
        })
    }
    $(document).ready(function () {
        $(".chosenStudent").data("placeholder", "Select Student").chosen();
        $(".chosen").data("placeholder", "Search By Title with Edition").chosen();
        $(".schoolSectionMappingChosen").data("placeholder", "Select Class").chosen().change(function () {
            autofillStudent()
        });

        autofillStudent();

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
    });

</script>

</body>
</html>