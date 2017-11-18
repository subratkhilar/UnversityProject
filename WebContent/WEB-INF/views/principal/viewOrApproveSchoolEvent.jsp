<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="principal">
    <title>Spandhan: View / Approve School Event</title>
    <script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
    $(document).on('click', '#search', function() {
    	
    	$.ajax({
			url : 'getSchoolEventDet',
			type : "GET",
			contentType : "application/json",
			
			success : function(item) {
				alert("get events "+JSON.stringify(item));
				var trHTML = '';
				/* jq('#records_table').html('');
				trHTML = '<thead><tr><th>Name</th><th>College</th><th>&nbsp;</th></tr></thead>'; */
				
				trHTML = trHTML += '<td>' + item.teacherName+ '</td>';
				trHTML = trHTML += '<td>' + item.eventName+ '</td>';
				
				
				/* $.each(data, function(i, item) {

					trHTML += '<tbody><tr><td>' + item.teacherName
							+ '</td><td>' + item.eventName
							/* + '</td><td><a data-popup-open="popup-1" href="#" '
							+' onClick=\"javascript:getPrincipalDetailsById('+item.eventName+')">Details </a></td></tr></tbody>' */;

				//}); */
				$('#event_table').append(trHTML);
			},error : function(e) {
				alert("failed to create curriculum "+JSON.stringify(e));
			}
		});
    });
    </script>
</head>

<body>

<section id="create-course-section" class="create-course-section">
    <div class="first-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="create-course-sidebar">
                        <ul class="list-bar">
                            <li class="active"><span class="count">1</span>Create School Event</li>
                             <li><a href="viewApproveSchoolEvent">
                            <span class="count">2</span>View / Approve School Event</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-9 avatar-acount" style="">
                    <div class=" ">
                        <!-- FORM -->

                        <div class="col-lg-12 col-md-12" style="">
                            <div class=" well well-lg">
                                <form controller="principal" action="schoolEvent">

                                    <!-- <g:render template="/common/flash"/> -->


                                    <div class="form-email">


                                        <div class="form-email" style="padding-top: 10px;padding-bottom: 10px">
                                            <select id="month" class="col-md-12 form-control" name="month">
                                                <option value="" selected="">Select Academic</option>
                                                    <option value="2016">2016</option>
                                            </select>
                                        </div>
                                        
                                        <div class="form-email" style="padding-top: 10px;padding-bottom: 10px">
                                        </div>
                                        
                                        
                                        <div class="form-email" style="padding-top: 10px;padding-bottom: 10px">
                                            <select id="month" class="col-md-12 form-control" name="month">
                                                <option value="" selected="">Select School Event</option>
                                                    <option value="1">January 26</option>
                                                    <option value="2">August 15</option>
                                            </select>
                                        </div>
                                        
                                        <div class="form-email" style="padding-top: 20px;padding-bottom: 10px">
                                        </div>
                                        
                                        <div class="col-md-2" align:centre>
                                    			<a href="javascript:void(0)" id="search" class="mc-btn btn-style-1"
                                       			style="margin-top: 0px">Search</a>
                                		</div>
                                
                                		<div class="form-email" style="padding-top: 30px;padding-bottom: 10px">
                                        </div>
										<div id = "eventDet" class="table-responsive" >
										
										<!-- <table class="table table-bordered table-hover "
												style="margin-top: 10px" id="event_table">
										</table> -->
											<table class="table table-bordered" id="event_table">
												<thead>
													<td>Teacher Name</td>
													<td>Event Name</td>
													<td>List of Teacher</td>
													<td>Estimated Price</td>
													<td>Actual Price</td>
													<td>Status</td>
													<td>To Approve</td>
													<td>Details</td>
													<td>Action</td>
												</thead>
												<tr>
												</tr>
											</table>
										</div>
                                        
                                    </div>

                                </form>
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