<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="layout" content="teacher">
<title>View/Update Curriculum</title>
</head>
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="css/chosen.css"/>
     <script src="js/chosen.jquery.js"></script>
<script type="text/javascript">
var jq = jQuery.noConflict(); 
	jq(document).on('change', '#event', function() {
		
		var eventId = jq('#event').val();
		alert("event id is " + eventId);
		getAllEventDetails(eventId);
		jq('#submitDiv').hide();
		jq(".chosen").data("placeholder", "Select Teacher").chosen();
	    jq(".delete").hide();
	});
	function getAllEventDetails(eventId) {
		//var eventId = jq('#event');
		
		alert("eventId===="+eventId);
		jq
				.ajax({
					url : 'getEventDet',
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					//data :eventId,
					data : "eventId="+eventId,
					success : function(returnMap) {
						data = returnMap.eventList;
						teachers = returnMap.teacherList;
						console.log(data);
						var trHTML = '';
						var teacherHTML = '';
						var totalEstPrice = 0;
						var totalActPrice = 0;
						jq('#updateCurrData').html('');
						teacherHTML += '<select name="selectTeacher" class="chosen form-control col-md-12" multiple="true" placeholder="Select Teacher">';
                            alert(JSON.stringify(teachers));
						jq.each(teachers, function(i, teacher){
							//teacherHTML += ''; 
							teacherHTML += '<option value="'+teacher.id+'">'+teacher.name+'</option>';
							console.log(teacher);
							
						});
						teacherHTML += '</select>';						
						jq('#teachersList').append(teacherHTML);
						jq
								.each(
										data,
										function(i, item) {
											trHTML += '<div class=" col-md-12 form-group well well-lg"><div class="col-md-3 "><input type="text" class="form-control date"  value="'+item.createdDate+'" name="date'+i+'" id="date'+i+'"   placeholder="Date"></div>';
											trHTML += '<div class="col-md-5 curriculum"><input type="text" class="form-control" name="item" value="'+item.item+'" placeholder="Item"></div>';

											trHTML += '<div class="col-md-4 curriculum"><input type="text" class="form-control" name="qty'+i+'" id="qty'+i+'" value="'+item.qty+'" placeholder="Quantity"></div>';
											trHTML += '<div class="col-md-3" style="margin-top: 10px"><input type="text" class="form-control estimatedPrice" name="estimatedPrice'+i+'" id="estimatedPrice'+i+'" placeholder="Estimated Price" value="'+item.estmatedPrice+'"></div>';
											trHTML += ' <div class="col-md-3" style="margin-top: 10px"><input type="text" class="form-control actualPrice" name="actualPrice'+i+'" id="actualPrice'+i+'" value="'+item.actPrice+'" placeholder="Actual Price"> </div>';
											trHTML += '       <div class="col-md-4" style="margin-top: 10px"><input type="text" class="form-control" name="comment'+i+'" id="comment'+i+'" placeholder="Comment"  value="'+item.comment+'"> </div>';
											trHTML += '     <div class="col-md-5" style="margin-top: 10px"><input type="file" class="form-control col-md-12" title="Upload Invoice"  name="UploadInvoice'+i+'" name="UploadInvoice'+i+'"  value="Upload Invoice"/></div>';

											trHTML += '<div class="col-md-2"><input type="submit" class="mc-btn btn-style-2" name="Update'+i+'" id="Update'+i+'" onclick="javascript:update('+i+')" value="Update"></div>';
											trHTML += '</div>';
											totalEstPrice += parseInt(item.estmatedPrice);
											totalActPrice += parseInt(item.actPrice);

										});
						trHTML += '<div class=" col-md-12 form-group well well-lg"><div class="col-md-6 ">Total Estimated Price:<b>'
								+ totalEstPrice
								+ '</b> </div><div class="col-md-6 ">Total Actual Price :<b> '
								+ totalActPrice + ' </b></div></div>';
						jq('#updateCurrData').append(trHTML);

					}
				});
	}
	function update(i)
	{
		var date = jq("#date"+i).val();
		alert("date >> "+date);
	}
</script>
<body>
	<div id="create-course-section" class="create-course-section">
		<div class="first-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="create-course-sidebar">
							<ul class="list-bar">
								<li>
									<%-- <a href="${createLink(controller: 'teacher', action: 'curriculum')}">
                                    <span class="count">1</span>Create Curriculum
                                </a> --%> <a href="curriculum"> <span
										class="count">1</span>Create Curriculum
								</a>
								</li>
								<li class="active"><span class="count">2</span>Update
									Curriculum</li>
							</ul>
						</div>
					</div>

					<div class="col-md-9 avatar-acount" style="padding-bottom: 5%">
						<!-- <g:render template="/common/flash"/> -->
						<form>
							<div style="padding-bottom: 100px">
								<div class="col-md-6">
									<select name="event" class="chosen form-control col-md-12"
										id="event">
										<option>Select Event</option>
										<c:forEach items="${eventList}" var="eventList">
											<option value="${eventList.eventId}">${eventList.eventName}</option>
										</c:forEach>
									</select>
								</div>
								<div></div>
							</div>
						</form>
						<div id="curriculumId">
							<div class="col-md-12">
								<div class="col-md-4">
									<h4 style="color: black">Teacher</h4>
								</div>
								<div class="group">
									<div id="teachersList"></div>
									
								</div>
							</div>

							<div class="col-md-12">
								<span style="color: black; font-size: 17px">Curriculum
									Item Detail</span> <span style="float: right"> <a
									href="javascript:void(0)" class="mc-btn btn-style-2"
									id="addMore">Add More</a>
								</span>
							</div>
							<div>


								<%-- <g:each in="${curriculum?.curriculumItemDetails}" var="curriculumItemDetail">
						            <g:form controller="teacher" action="createOrUpdateCurriculumItemDetail" enctype="multipart/form-data"> --%>
								<div class="group">
									<%--  <g:hiddenField name="curriculumId" value="${curriculum?.id}"/>
						                    <g:hiddenField name="curriculumItemDetailId" value="${curriculumItemDetail?.id}"/>
						                    --%>
									<div id="updateCurrData"></div>
									
								</div>
								
							</div>
						</div>
						<div class="col-md-12" style="margin-top: 20px;margin-bottom: 10px">
                                <div class="col-md-2">
                                    <input type="radio" checked value="OPEN" name="curriculumStatus"> OPEN
                                </div>

                                <div class="col-md-2">
                                    <input type="radio" value="CLOSE" name="curriculumStatus"> CLOSE
                                </div>

                            </div>

                            <div class="col-md-12">
                                <!-- <div id="submitDiv">
 -->
								<a href="javascript:void(0)" id="finalSubmit" style=""
									class="mc-btn btn-style-2">Submit</a>

							<!-- </div> -->
                            </div>
					</div>
					
				</div>
			</div>
			<script>
				
			</script>
</body>
</html>