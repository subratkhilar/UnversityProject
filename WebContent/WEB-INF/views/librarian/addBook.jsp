


<!-- CREATE COURSE CONTENT -->
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">

                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">
                            <li class="active"><span class="count">1</span>Add Book</li>
                            <li>
                                <a href="updateBook"><span
                                        class="count">2</span>Update Book</a>
                            </li>
                            <li><a href="viewAddedBooks"><span
                                    class="count">3</span>View Added Books</a></li>
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
                                   <!--  <g:render template="/common/flash"/> -->
                                    <!-- DC SECTION INFO -->
                                    <div class="dc-section-info">
                                        <div class="title-section">
                                            <h4 class="xsm">Add New Book</h4>

                                        </div>

                                        <!-- DC SECTION BODY -->
                                        <div class="dc-section-body">

                                            <!-- DC UNIT -->
                                            <div class="promo-video create-item form-group">
                                                <form>

                                                    <div class="description create-item">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="col-md-5">
                                                                    <h4>Title</h4>
                                                                </div>

                                                                <div class="col-md-7">
                                                                    <div class="form-item">
                                                                        <input type="text" name="title"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="col-md-5">
                                                                    <h4>Author</h4>
                                                                </div>

                                                                <div class="col-md-7">
                                                                    <div class="form-item">
                                                                        <input type="text" name="author"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="col-md-5">
                                                                    <h4>Edition</h4>
                                                                </div>

                                                                <div class="col-md-7">
                                                                    <div class="form-item">
                                                                        <input type="text" name="edition"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <div class="col-md-6">
                                                                <div class="col-md-5">
                                                                    <h4>Publisher</h4>
                                                                </div>

                                                                <div class="col-md-7">
                                                                    <div class="form-item">
                                                                        <input type="text" name="publisher"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="col-md-5">
                                                                    <h4>No. Of Copies</h4>
                                                                </div>

                                                                <div class="col-md-7">
                                                                    <div class="form-item">
                                                                        <input type="text" name="quantity"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="col-md-5">
                                                                    <h4>Book Cost</h4>
                                                                </div>

                                                                <div class="col-md-7">
                                                                    <div class="form-item">
                                                                        <input type="text" name="bookCost"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="col-md-5">
                                                                    <h4>Book Category</h4>
                                                                </div>

                                                                <div class="col-md-7">
                                                                    <div class="form-item">

                                                                        <div id="bookCategorySelect" class="form-group">
                                                                            <select id="bookCategoryId1"
                                                                                    class="col-md-12 form-item form-control"
                                                                                    name="bookCategoryId">
                                                                                <option value=""
                                                                                        selected="">Select Category</option>
                                                                               <%--  <g:each in="${bookCategoryList?.sort {
                                                                                    it?.categoryName
                                                                                }}" var="bookCategory">
                                                                                    <option value="${bookCategory?.id}">${bookCategory?.categoryName}</option>
                                                                                </g:each> --%>
                                                                            </select>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-submit-1">
                                                        <input type="submit" value="Submit"
                                                               class="mc-btn btn-style-1">
                                                    </div>

                                                </form>
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



<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>
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

