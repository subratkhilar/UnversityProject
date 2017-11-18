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
                                <a href="addBooks"><span
                                        class="count">1</span>Add Book</a>
                            </li>
                            <li class="active"><span class="count">2</span>Update Book</li>
                            <li><a href="viewAddedBooks"><span
                                    class="count">3</span>View Added Books</a></li>
                        </ul>

                    </div>
                </div>
                <form>
                    <div class="col-md-9">
                        <div class="create-course-content">

                            <div class="tab-content">
                                <!-- DESIGN OUTLINE -->
                                <div class="tab-pane fade in active" id="design-outline">

                                    <!-- SECTIONS -->
                                    <div class="dc-sections">
                                        <!-- <g:render template="/common/flash"/> -->
                                        <!-- DC SECTION INFO -->
                                        <div class="dc-section-info">
                                            <div class="title-section">
                                                <h4 class="xsm">Update Book</h4>

                                            </div>

                                            <!-- DC SECTION BODY -->
                                            <div class="dc-section-body">

                                                <!-- DC UNIT -->
                                                <div class="promo-video create-item form-group">
                                                    <div class="col-md-12">
                                                        <div class="col-md-7">
                                                            <div class="form-item">
                                                                <select name="libraryItemId" id="libraryItemId"
                                                                        class="chosen form-control col-md-12">
                                                                   <%--  <g:each in="${com.spandhan.librarian.LibrarianUtil.getAllLibraryBook(librarian?.school)}"
                                                                            var="libraryItem">
                                                                        <option value="${libraryItem?.id}">${libraryItem?.book?.title}</option>
                                                                    </g:each> --%>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                  <!--   <g:render template="template/updateBook"
                                                              model="[libraryBookCO: libraryBookCO, librarian: librarian]"/> -->
                                                    <div class="form-submit-1">
                                                        <input type="submit" value="Submit"
                                                               class="mc-btn btn-style-1">
                                                    </div>
                                                </div>

                                            </div>
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
<link rel="stylesheet" type="text/css" href="css/datepicker.css"/>
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>
    function autofillUpdateBook() {
        $.ajax({
            url: 'autofillUpdateBook',
            method: 'POST',
            data: {
                libraryItemId: $("#libraryItemId").val()
            },
            success: function (resp) {
                $("#autofillBody").replaceWith(resp)
            }

        })
    }
    $(document).ready(function () {
        $(".chosen").data("placeholder", "Search By Title with Edition").chosen().change(function () {
            autofillUpdateBook()
        });
        autofillUpdateBook()
    });
    $('#diaryDate').datepicker({
        format: 'dd/mm/yyyy',
        changeYear: true,
        changeMonth: true,
        autoclose: true,
        yearRange: "-50:+50", showButtonPanel: true,
        prevText: '<i class="fa fa-angle-left"></i>',
        nextText: '<i class="fa fa-angle-right"></i>'
    }).on('changeDate', function (ev) {
        var dateStr = $('#diaryDate').val()
        console.log("////////diaryDate")
        $.ajax({
            url: 'renderLectureDropDown',
            method: 'POST',
            data: {
                attendanceDate: dateStr
            },
            success: function (resp) {
                $("#lectureSelect").replaceWith(resp)
            }
        })
    });

</script>

</body>
</html>