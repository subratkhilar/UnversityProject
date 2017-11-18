<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <!-- <sec:ifAnyGranted roles="ROLE_PRINCIPAL">
        <meta name="layout" content="principal">
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_ADMINISTRATOR">
        <meta name="layout" content="administrator">
    </sec:ifAnyGranted> -->
    <title>Spandhan:Create Vendor</title>
</head>

<body>
<section id="course-concern" class="course-concern">
    <div class="container">
        <div class="row">
            <!-- FORM -->
            <div class="col-lg-7 col-md-6" style="margin-top: 10px">
                <!-- <g:render template="vendorListing" model="[user: user, school: school]"></g:render> -->
                
               <%--  <div class="form-login well well-lg"
						style="background-color: #E9E9E9 !important;">
						<h2 style="color: #37abf2">Vendor List</h2>

						<div class="form-email" style="margin-top: 18px">
							<div class="mc-select-wrap">
								<div class="mc-select">
									<select class="select" name="school"
										style="z-index: 10; opacity: 0;">
										<option value="" selected="">Please Select College</option>
										<c:forEach items="${clgList}" var="clgList">
											<option value="${clgList.collegeId}">${clgList.collegeName}</option>
										</c:forEach>

									</select><i class="fa fa-angle-down"></i>
								</div>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table table-bordered table-hover "
								style="margin-top: 10px" id="records_table">
							</table>
						</div>
					</div> --%>
		<div class="form-login well well-lg"
			style="background-color: #E9E9E9 !important;">
			<h2 style="color: #37abf2">Vendor List</h2>
				<div class="table-responsive">
			        <table class="table table-bordered table-hover " style="margin-top: 10px">
			            <tr>
			                <th>Company Name</th>
			                <th>Address</th>
			                <th>Phone</th>
			                <th>Email</th>
			                <th>Contact Person</th>
			            </tr>
			            <tr>
			            	<td>abc</td>
			            	<td>abc</td>
			            	<td>abc</td>
			            	<td>abc</td>
			            	<td>abc</td>
			            </tr>
			        </table>
			    </div>
	</div>
								
					

            </div>

            <div class="col-lg-1 col-md-1"></div>

            <div class="col-lg-4 col-md-4" style="margin-top: 10px">
                <div class="form-login" style="background-color: #E9E9E9 !important;">
                    <!-- <g:form controller="administrator" action="createVendor">
                        <g:render template="/common/flash"/> -->
                        <h2 style="color: #37abf2 !important;">Create New Vendor</h2>

                       <!--  <sec:ifAnyGranted roles="ROLE_ADMINISTRATOR"> -->
                            <div class="form-email" style="margin-top: 18px">
                                <div class="mc-select-wrap">
                                    <div class="mc-select">
                                        <select id="schoolDropdown" class="select" name="school"
                                                style="z-index: 10; opacity: 0;">
                                            <option value="" selected="">Please Select COllege/School</option>


                                           <%--  <g:each in="${user?.schoolRepresentative?.schools?.sort { it?.name }}"
                                                    var="schoolItr">
                                                <option ${schoolItr == school ? 'selected' : ''}
                                                        value="${schoolItr?.id}">${schoolItr?.name}</option>
                                            </g:each> --%>

                                        </select><i  class="fa fa-angle-down"></i>
                                    </div>
                                </div>
                            </div>
                       <!--  </sec:ifAnyGranted> -->

                        <div class="form-phone">
                            <input type="text" name="companyName" placeholder="Company Name">
                        </div>


                        <div class="form-address">
                            <textarea type="text" name="companyAddress" placeholder="Company Address"></textarea>
                        </div>

                        <div class="form-phone">
                            <input type="text" name="companyPhone" placeholder="Company Phone">
                        </div>

                        <div class="form-phone">
                            <input type="email" name="companyEmail" placeholder="Company Email">
                        </div>

                        <div class="form-phone">
                            <input type="text" name="contactPerson" placeholder="Contact Person">
                        </div>


                        <div class="form-submit-1">
                            <input type="submit" value="Assign" class="mc-btn btn-style-1">
                        </div>

                        <div class="link" style="margin-top: 20px !important;">
                           <%--  <a href="${createLink(controller: 'login', action: 'auth')}">
                                %{--<i class="icon fa fa-arrow-right"></i>Already have account ? Log in--}%
                            </a> --%>
                        </div>
                    <!-- </g:form> -->
                </div>
            </div>

            <!-- END / FORM -->

            <div class="image">
            </div>

        </div>
    </div>

</section>
<%-- %{--<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'datepicker.css')}">--}%
%{--<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-datepicker.js')}"></script>--}%

%{--<script>--}%
%{--$('#birthDate').datepicker({--}%
%{--dateFormat: 'dd/mm/yyyy',--}%
%{--changeYear: true,--}%
%{--changeMonth: true,--}%
%{--autoclose: true,--}%
%{--yearRange: "-50:+50", showButtonPanel: true,--}%
%{--prevText: '<i class="fa fa-angle-left"></i>',--}%
%{--nextText: '<i class="fa fa-angle-right"></i>'--}%
%{--});--}%
%{--</script>--}% --%>

</body>
</html>