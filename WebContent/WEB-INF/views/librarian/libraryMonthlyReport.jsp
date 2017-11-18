<html>
<head>
    <meta name="layout" content="librarian">
    <title>Library Monthly Report</title>
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
                            <li>
                                <a href="updateBookAssignment">
                                    <span class="count">2</span>Update Book Assignment
                                </a>
                            </li>
                            <li class="active"><span class="count">3</span>Library Report</li>
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
                                  <!--   <g:render template="/common/flash"/> -->
                                </div>

                                <div class="col-md-12">

                                    <div class="col-md-2">
                                        <select name="year" id="year"
                                                class=" form-control col-md-12"
                                                placeholder="Select Year">
                                           <%--  <g:each in="${2016..new java.util.Date().year}"
                                                    var="year">
                                                <option value="${year}">${year}</option>
                                            </g:each> --%>
                                        </select>
                                    </div>

                                    <div class="col-md-2">
                                        <select name="month" id="month"
                                                class=" form-control col-md-12"
                                                placeholder="Select Month">
                                          <%--   <g:each in="${com.spandhan.setting.Enums.Month.list()}"
                                                    var="month">
                                                <option value="${month?.key}">${month?.value}</option>
                                            </g:each> --%>
                                        </select>
                                    </div>


                                    <div class="col-md-3">
                                        <select name="status" id="status"
                                                class=" form-control col-md-12"
                                                placeholder="Select Submitted Status">
                                            <%-- <g:each in="${com.spandhan.setting.Enums.LibraryBookReturnStatus.list()}"
                                                    var="status">
                                                <option value="${status?.key}">${status?.value}</option>
                                            </g:each> --%>
                                        </select>
                                    </div>

                                  

                                    <div class="col-md-2">
                                        <a href="javascript:void(0)" id="search" style="margin-top: 0px"
                                           class="mc-btn btn-style-1">Submit</a>
                                    </div>

                                    <div class="col-md-12">
                                       <!--  <g:render template="/schoolAdmin/template/libraryMonthlyTemplate"/> -->
                                    </div>
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
    $(document).on('click', '#search', function () {
        search()
    });
    function search() {
        $.ajax({
            url: 'libraryMonthlyReport',
            method: 'POST',
            data: {
                year: $("#year").val(),
                month: $("#month").val(),
                status: $("#status").val()
            },
            success: function (data) {
                $("#report").replaceWith(data)
            }
        })
    }
</script>

</body>
</html>