<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<c:url var="collegeRegister" value="collegeRegistration/save" scope="request" />
<script type="text/javascript"	src="<c:url value='/js/library/jquery-1.11.0.min.js' />"></script> 
<link rel="stylesheet" type="text/css" href="css/datepicker.css">
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="css/popup.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
var jq = jQuery.noConflict();
	jq(document).ready(function() {
		
	});
	function getNotificationMessageById()
	{
		
		var id="";
		var trHTML = '';
		var select = '<div class="mc-select-wrap"><div class="mc-select"><select class="select" name="notificationType" id="notificationType" style="z-index: 10; opacity: 0;">';
		
		select+='<option value="" selected="">Select</option><option value="diartNote">Diary Note </option><option value="female">Emergency Leave</option><option value="female">Sick Leave</option>';
		select+='</select><i class="fa fa-angle-down"></i></div></div>';
		trHTML = trHTML += '<tbody><tr><td>'+select+'</td><td>';
		
		/* jq.ajax({
			url : 'getPrincipalById',
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : "principalId=" + id,
			success : function(data) {
				//alert(JSON.stringify(data));
				console.log(data);
				jq('#loadPopUpdata').html('');
				//jq.each(data, function(i, item) {

					/* trHTML = trHTML += '<tbody><tr><td>Name</td><td>' + data.principalName+ '</td></tr>';
					trHTML = trHTML += '<tbody><tr><td>College  Name </td><td>' + data.collegeName+ '</td></tr>';
					trHTML = trHTML += '<tbody><tr><td>Email Id </td><td>' + data.emailid+ '</td></tr>';
					trHTML = trHTML += '<tbody><tr><td>Contact Number </td><td>' + data.contactNumber+ '</td></tr>';
					trHTML = trHTML += '<tbody><tr><td>Date Of Birth</td><td>' + data.dob+ '</td></tr>';
					trHTML = trHTML += '<tbody><tr><td>Gender</td><td>' + data.gender+ '</td></tr>';
					trHTML = trHTML +='</tbody>'; */
					
					
				//});
				
				/*jq('#loadPopUpdata').append(trHTML);

			}
		}); */
		jq('#loadPopUpdata').html('');
		jq('#loadPopUpdata').append(trHTML);
	
		
		//-----popup-- OPEN--
	    $('[data-popup-open]').on('click', function(e)  {
	        var targeted_popup_class = jQuery(this).attr('data-popup-open');
	        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
	 
	        e.preventDefault();
	    });
	 
	    //----- CLOSE
	    $('[data-popup-close]').on('click', function(e)  {
	        var targeted_popup_class = jQuery(this).attr('data-popup-close');
	        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
	 
	        e.preventDefault();
	    });
	    //end
	}
	</script>
</head>
<body>


<div class="popup" data-popup="popup-1">
    <div class="popup-inner">
    	 <h2>Notification</h2><hr>
       <div>
       		<table class="table table-bordered table-hover " style="margin-top: 10px" id="loadPopUpdata">
			</table>
       </div>
        <p><a data-popup-close="popup-1" href="#">Close</a></p>
        <a class="popup-close" data-popup-close="popup-1" href="#">x</a>
    </div>
</div>

	<section id="course-concern" class="course-concern" style="padding-bottom: 11%">
	
    <div class="container">
        <div class="row">
        
       	<c:if test="${!empty guardianNotification}">
				<c:forEach items="${guardianNotification}" var="guardianNoti">
					  <li class="ac-new">
                        <a href="guardianNotificationPopUp">
                            <div class="list-body" style="padding-right: 0px !important;">
                                <div class="author">
                               
									<%-- <a data-popup-open="popup-1" href="#" onClick="getNotificationMessageById()">
	                                    <span>${guardianNoti.notificationMsg}</span>
                                    </a> --%>
                                    <a  href="showNotificationData" >
	                                    <span>${guardianNoti.notificationMsg}</span>
                                    </a>

                                    <div class="div-x"></div>
                                </div>

                                 <div class="time">
                                    <span>${guardianNoti.attendanceDate}</span>
                                </div>
                            </div>
                        </a>
                    </li>
				</c:forEach>
			</c:if>
        </div>
    </div>
</section>
<input type="hidden" id="csrfToken" value="${_csrf.token}" /> <input
					type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
</body>
</html>