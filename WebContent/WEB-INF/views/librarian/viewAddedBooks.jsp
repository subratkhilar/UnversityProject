<!-- CREATE COURSE CONTENT -->
<section id="create-course-section" class="create-course-section" style="padding-bottom: 5%">
    <div class="first-footer">
        <div class="container">
            <div class="row">

                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">

                            <li><a href="addBooks"><span
                                    class="count">1</span>Add Book</a></li>
                            <li>
                                <a href="updateBook"><span
                                        class="count">2</span>Update Book</a>
                            </li>
                            <li class="active"><span class="count">3</span>View Added Books</li>
                        </ul>

                    </div>
                </div>

                <div class="col-md-9">

                    <div class="tab-pane fade active in create-course-content" id="design-question">
                       
                        <br>
                        <br>

                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>S. No.</th>
                                    <th>Title <span class="caret"></span></th>
                                    <th>Author</th>
                                    <th>Quantity</th>
                                    <th>Cost</th>
                                   <!--  %{--<th>Status<span class="caret"></span></th>--}% -->
                                    <th>Publisher<span class="caret"></span></th>
                                </tr>
                                </thead>

                                <tbody>
                               <%--  <g:each in="${libraryItemList}" var="libraryItem" status="i">
                                    <tr>
                                        <td>${i + 1}</td>
                                        %{--<td>${libraryItem?.book?.isbnNumber}</td>--}%
                                        %{--<td>${libraryItem?.book?.bookNumber}</td>--}%
                                        <td>${libraryItem?.book?.title} (${libraryItem?.book?.edition})</td>
                                        <td>${libraryItem?.book?.author}</td>
                                        <td>${libraryItem?.book?.quantity}</td>
                                        <td>${libraryItem?.book?.bookCost}</td>
                                        <td>${libraryItem?.book?.publisher}</td>
                                        %{--<td>${libraryItem?.book?.shelfNumber}</td>--}%
                                    </tr>
                                </g:each> --%>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


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
