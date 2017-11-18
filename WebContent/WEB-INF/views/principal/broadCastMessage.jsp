<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<c:url var="collegeRegister" value="collegeRegistration/save" scope="request" />
<script type="text/javascript" src="<c:url value='/js/library/jquery-1.11.0.min.js' />"></script> 
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>

<script type="text/javascript">
var jq = jQuery.noConflict();
	jq(document).ready(function() {
		 jq('#viewBroadCastMessage').hide();
		 jq('#listOfBroadCast').hide();
	});
	  function showBroadCast(val){
		alert("val is "+val);
		if(val==2){
		 jq('#viewBroadCastMessage').show();
		 jq('#listOfBroadCast').hide();
		 jq('#broadCastMessageCreate').hide();
		}
		if(val==4){
			 jq('#4').closest('li').addClass('active');
			 $('#1').closest('li').removeClass('active');
			 jq('#viewBroadCastMessage').hide();
			 jq('#listOfBroadCast').show();
			 jq('#broadCastMessageCreate').hide();
		}
		if(val==1){
			 jq('#4').closest('li').removeClass('active');
			 $('#1').closest('li').addClass('active');
			 jq('#viewBroadCastMessage').hide();
			 jq('#listOfBroadCast').show();
			 jq('#broadCastMessageCreate').hide();
		}
	}
	       
	</script>
</head>

<body>
<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">

            <div class="row">
                <div class="col-md-3">
                    <div class="create-course-sidebar" id="main-menu">
                         <ul class="list-bar">
                            <li class="active">
                           		<a href="#" onclick="showBroadCast(1)"> <span id="1" class="count">1</span>Broadcast Message</a>
                            </li>
                            <li>
                              	<a href="#" onclick="showBroadCast(2)"> <span class="count">2</span>View Broadcast Message</a>
                            </li>
                            <li>
                                <a href="#" onclick="showBroadCast(3)"><span class="count">3</span>Download Broadcast Message</a>
                            </li>
                            <li>
                                <a href="#" onclick="showBroadCast(4)"><span id ="4" class="count">4</span>List Of Broadcast</a>
                            </li>
                        </ul>
                    </div>
                </div>
			<div id="broadCastMessageCreate">
                <div class="col-md-9">
                    <div class="create-course-content form-group">
                            <div class="promo-video create-item">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>Title</h4>
                                    </div>

                                    <div class="col-md-9">
                                        <div class="form-textarea-wrapper">
                                            <input type="text" name="broadcastName" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- COURSE BANNER -->
                            <div class="course-banner create-item">

                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>Select Receiver</h4>
                                    </div>

                                    <div class="col-md-9">
                                        <div class="col-md-12" name="lecture" id="lecture">
                                            <select id="broadCastCategory"
                                                    class="col-md-12 form-control form-item"
                                                    name="broadCastCategory">
                                                 <option value="" selected="0">Select Receiver</option>
                                                 <option value="" selected="1">Broadcast to Parent</option>
                                                 <option value="" selected="2">Broadcast to Teacher</option>
                                                 <option value="" selected="3">Broadcast to All</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END / COURSE BANNER -->

                            <!-- PROMO VIDEO -->
                            <div class="promo-video create-item">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>Teacher</h4>
                                    </div>

                                    <div class="col-md-9">
                                        <div class="form-textarea-wrapper">
                                            <div class="form-group col-md-12">
                                              <select name="selectTeacher" class="chosen form-control col-md-12"
                                                        multiple="true"
                                                        placeholder="Select Teacher">
                                                    <c:forEach items="${teacherDet}" var="teacherDet">
														<option value="${teacherDet.id}">${teacherDet.name}</option>
													</c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END / PROMO VIDEO -->
                            <div class="promo-video create-item">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>Broadcast Message</h4>
                                    </div>

                                    <div class="col-md-9">
                                        <div class="form-textarea-wrapper">
                                            <textarea name="message" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END / PROMO VIDEO -->

                            <!-- DESCRIPTION -->
                            <div class="description create-item">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>Upload Reference</h4>
                                    </div>

                                    <div class="col-md-9">
                                        <label class="input">
                                          <!--   %{--<i class="icon-append glyphicon glyphicon-upload"></i>--}% -->
                                            <input type="file" name="broadCastFile"
                                                   placeholder="Upload Reference">
                                            <b class="tooltip tooltip-bottom-right">Upload Reference
                                            </b>

                                        </label>
                                    </div>
                                </div>
                            </div>
                            <!-- END / DESCRIPTION -->


                            <div class="form-submit-1">
                                <input type="submit" value="Send"
                                       class="mc-btn btn-style-1">
                            </div>
                       </div>
                    </div>
                </div>
                <div id="viewBroadCastMessage">
	                <div class="col-md-9">
	                    <div class="create-course-content form-group">
	                        <!-- COURSE BANNER -->
	                        <div class="course-banner create-item">
	                            <div class="row">
	                                <div class="col-md-3">
	                                    <h4>Broadcast Name</h4>
	                                </div>
	                                <div class="col-md-9">
	                                    <div class="col-md-12" id="lecture">
	                                        <select id="broadCastName"
	                                                class="col-md-12 form-control form-item"
	                                                name="broadCastName">
	                                            <option value="" selected="">Broadcast Name</option>
	                                        </select>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="form-submit-1">
	                        	<input type="submit" value="Send" class="mc-btn btn-style-1">
	                        </div>
	                      </div>
	                  </div>
                </div>
                
                <div id="listOfBroadCast">
	                <div class="col-md-9">
	                    <div class="create-course-content form-group">
	                        <!-- COURSE BANNER -->
	                        <div class="course-banner create-item">
	                            <div class="row">
	                                <table class="table table-bordered">
								        <tr>
								            <th>
								                No
								            </th>
								            <th>
								                Broadcast Name
								            </th>
								            <th>
								                Teacher Accepted
								            </th>
								            <th>
								                Parent  Accept
								            </th>
								            <th>
								                Total
								            </th>
								            <th>
								                Non Acceptance
								            </th>
								            <th>
								                Acceptance %
								            </th>
								        </tr>
								        <%-- <g:each in="${broadcastMessages}" var="broadcastMessage" status="i">
								            <tr>
								                <td>${i + 1}</td>
								                <td>${broadcastMessage?.broadcastName}</td>
								                <td>${com.spandhan.utility.Count.getBroadcastTeacherAcceptedCount(broadcastMessage)}</td>
								                <td>${com.spandhan.utility.Count.getBroadcastGuardianAcceptedCount(broadcastMessage)}</td>
								                <td>${com.spandhan.utility.Count.getBroadcastTotalUserCount(broadcastMessage)}</td>
								                <td>${com.spandhan.utility.Count.getBroadcastNonAcceptedCount(broadcastMessage)}</td>
								            </tr>
								        </g:each> --%>

    								</table>
	                            </div>
	                        </div>
	
	                        <div class="form-submit-1">
	                        	<input type="submit" value="Send" class="mc-btn btn-style-1">
	                        </div>
	                      </div>
	                  </div>
                </div>
                
            </div>
        </div>
</section>
<!-- END / CREATE COURSE CONTENT -->
<%-- <script src="${resource(dir: 'js', file: 'chosen.jquery.js')}"></script>
<script>
    $(document).ready(function () {
        $(".chosen").data("placeholder", "Select Teacher").chosen();
    });
</script> --%>
</body>
</html>