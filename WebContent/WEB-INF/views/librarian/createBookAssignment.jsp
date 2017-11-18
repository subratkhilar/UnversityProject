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
                            <li class="active"><span class="count">1</span>Create Book Assignment</li>
                            <li>
                                <a href="updateBookAssignment">
                                    <span class="count">2</span>Update Book Assignment
                                </a>
                            </li>
                            <li>
                                <a href="libraryMonthlyReport">
                                    <span class="count">3</span>Library Report
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
                <form  class="form-group">
                    <div class="col-md-9">
                        <div class="create-course-content" style="padding-bottom: 100px">

                            <div class="tab-content">
                                <!-- DESIGN OUTLINE -->
                                <div class="tab-pane fade in active" id="design-outline">

                                    <!-- SECTIONS -->
                                    <div class="dc-sections">
                                       <!--  <g:render template="/common/flash"/> -->
                                    </div>

                                    <div class="col-md-12">
                                        <div class="col-md-5">
                                            <div class="form-item">
                                                <select name="libraryItemId" id="libraryItemId"
                                                        class="chosen form-control col-md-12">
                                                   <%--  <g:each in="${com.spandhan.librarian.LibrarianUtil.getAllLibraryBook(librarian?.school)}"
                                                            var="libraryItem">
                                                        <option value="${libraryItem?.id}">${libraryItem?.book?.title} (${libraryItem?.book?.edition})</option>
                                                    </g:each> --%>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <select name="schoolSectionMapping" id="schoolSectionMapping"
                                                    class="schoolSectionMappingChosen form-control col-md-12"
                                                    placeholder="Select Class">
                                               <%--  <g:each in="${com.spandhan.utility.Fetch.getSections(librarian?.school)}"
                                                        var="schoolSectionMapping">
                                                    <option value="${schoolSectionMapping?.id}">${schoolSectionMapping?.section?.displayClassDetail}</option>
                                                </g:each> --%>
                                            </select>
                                        </div>

                                        <div class="col-md-5">
                                           <!--  <g:render template="template/studentFilter"/> -->
                                        </div>

                                        <div class="col-md-2"></div>

                                        <div class="col-md-3" style="padding: 20px 20px">
                                            <input type="text" class="date form-control" name="fromDate"
                                                   value="${new java.util.Date().format("dd/MM/yyyy")}">
                                        </div>

                                        <div class="col-md-3" style="padding: 20px 20px">
                                            <input type="text" class="date form-control" name="toDate"
                                                   value="">
                                        </div>

                                        <div class="col-md-3">
                                            <input type="button" name="Submit" class="mc-btn btn-style-1"/>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- END / CREATE COURSE CONTENT -->


<script src="js/chosen.jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>
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

        autofillStudent()

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