<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="teacher">
    <title></title>
</head>

<body>
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">
                            <li class="active"><span class="count">1</span> Upload Profile Image</li>

                        </ul>
                    </div>
                </div>

                <div class="col-md-9 avatar-acount" style="margin-bottom: 5%">
                    <div class="avatar-acount ">
                        <div class="col-md-12">
                           <%--  <g:if test="${flash.success}">
                                <div class="alert alert-success" style="text-align: center">
                                    <i class="fa fa-asterisk"></i> ${raw(flash.success)}
                                </div>
                            </g:if>
                            <g:if test="${flash.error}">
                                <div class="alert alert-danger" style="text-align: center">
                                    <i class="fa fa-asterisk"></i> ${raw(flash.error)}
                                </div>
                            </g:if> --%>
                            <div class="col-md-9">

                                <div>
                                    <i class="fa fa-exclamation-triangle"></i>
                                    <b>Upload Profile Image</b>
                                    <form  action="saveProfilePic"
                                            enctype="multipart/form-data">
                                        <div class="col-md-8">
                                            <input id="upload" name="profilePic" accept='image/*' type="file" />
                                        </div>

                                        <div class="col-md-4">
                                            <input type="submit" id="profilePicSubmit" class="mc-btn btn-style-2" style="margin-top: 0px;text-align: center">
                                        </div>
                                    </form>
                                    <center>

                                    </center>
                                </div>
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