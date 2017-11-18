
<section class="profile">
    <div class="container">
        <h3 class="md black">Timetable</h3>

        <div class="row">
            <div class="col-md-9 avatar-acount" style="background-color: #95B3D7">
                <div style="padding-bottom: 100px">
                   <!--  <g:render template="/teacher/template/timetableTemplate" model="[lectureList: lectureList]"/> -->
                </div>
            </div>

            <div class="col-md-3">
                <div class="social-connect">
                    <h5>Social connect</h5>
                    <ul>
                        <li>
                            <a href="#" class="twitter">
                                <i class="icon fa fa-twitter"></i>

                                <p>https://www.facebook.com/</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="facebook">
                                <i class="icon fa fa-facebook"></i>

                                <p>https://www.facebook.com/</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="gg-plus">
                                <i class="icon fa fa-google-plus"></i>

                                <p>https://www.facebook.com/</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="printerest">
                                <i class="icon fa fa-pinterest-p"></i>

                                <p>https://www.facebook.com/</p>
                            </a>
                        </li>
                    </ul>

                    <div class="add-link">
                        <i class="icon fa fa-plus"></i>
                        <input type="text" placeholder="paste link here">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<link rel="stylesheet" type="text/css" href="css/datepicker.css"/>
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script>

    $(document).on('click', '#finalSubmit', function () {
        var jsonObj = [];
        var dateStr = $('#attendanceDate').val();
        var lecture = $('#lecture').val();

        $(".attendanceRow").each(function () {
            var item = {};
            item ["student"] = $(this).find(".student").val();
            item ["attendance"] = $(this).find(".attendance").is(":checked");
            item ["remark"] = $(this).find(".remark").val();
            jsonObj.push(item);
        });
        var jsonData = JSON.stringify(jsonObj);

        $.ajax({
            url: 'attendance',
            method: 'POST',
            data: {
                jsonData: jsonData,
                dateStr: dateStr,
                lecture: lecture
            },
            success: function (resp) {
                var json = JSON.parse(resp);
                toastr.info(json.message)
            }
        })
    });
    $(document).on('change', '#checkAll', function () {
        var boolean = this.checked;
        $(".attendance").each(function () {
            if (boolean) {
                $(this).prop("checked", true);
            } else {
                $(this).prop("checked", false);
            }
        })
    });

    $(document).on('click', "#searchBtn", function () {
        $("#tableContent").hide();
        $.ajax({
            url: 'renderAttendanceForm',
            method: 'POST',
            data: {
                lecture: $("#lecture").val(),
                attendanceDate: $("#attendanceDate").val()
            },
            success: function (resp) {
                $("#tableContent").replaceWith(resp)
            }
        })
    });
    $('#attendanceDate').datepicker({
        format: 'dd/mm/yyyy',
        changeYear: true,
        changeMonth: true,
        autoclose: true,
        yearRange: "-50:+50", showButtonPanel: true,
        prevText: '<i class="fa fa-angle-left"></i>',
        nextText: '<i class="fa fa-angle-right"></i>'
    }).on('changeDate', function (ev) {
        var dateStr = $('#attendanceDate').val()
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