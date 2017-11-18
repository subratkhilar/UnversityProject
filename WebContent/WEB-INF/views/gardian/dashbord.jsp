<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta name="layout" content="guardian">
    <title>Parent Dashboard</title>
    <style>
    .circle {
        margin-top: 20px;
        padding-top: 30px;
        width: 150px;
        height: 150px;
        border-radius: 250px;
        font-size: 18px;
        border: 2px solid white;
        color: white;
        line-height: 30px;
        text-align: center;
        background: #2E7DCC;
    }

    .circle:hover {
        box-shadow: 5px 5px 15px;
        -moz-transform: scale(1.1);
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }

    @media screen and (max-width: 540px) {
        .categories-content .content [class*="col-"],
        .course-concern [class*="col-"] {
            width: 50% !important;
            float: right;
        }
    }

    @media (min-width: 768px) {
        .col-sm-4 {
            width: 24.333333%;
        }
    }
    </style>
    
    <link rel="stylesheet" type="text/css" href="css/datepicker.css">
	<c:url var="collegeRegister" value="collegeRegistration/save" scope="request" />
	<script type="text/javascript" src="<c:url value='/js/library/jquery-1.11.0.min.js' />"></script> 
	<link rel="stylesheet" type="text/css" href="css/datepicker.css">
	<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
	
	<script type="text/javascript">
		var jq = jQuery.noConflict();
		
		function guardianNotification(){
			
			alert("inside guardianNotification");
			
			//collegeId = jq("#collegeId").val();
			
			jq.ajax({
				url : 'guardianNotification',
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				//data :"collegeId=" + collegeId,
				success : function() {
					alert(" success ");
					/* console.log(JSON.stringify(data));
					//alert(JSON.stringify(data));
					 select.html('');
					 jq.each(data, function(i, item) {
						 console.log(item);
						 select.append('<option value="' + item.branchCode + '">' + item.branchName + '</option>');
						//var div_data = "<option value=" + item.branchCode + ">" + item.branchName + "</option>";
				       // alert(div_data);
				       // $(div_data).appendTo('#collegeId');
						
					}); */
				}
			});
			
		}
	</script>


</head>

<body>
<%-- <c:import url="/WEB-INF/views/gardian/profile/profile.jsp"></c:import> --%>

<section id="course-concern" class="course-concern" style="padding-bottom: 11%">
    <div class="container">
        <div class="row">
       	<c:if test="${!empty studList}">
        </c:if>
            <c:forEach items="${studList}" var="student">
                <a href="studentView?studentId='+ ${student.id}+'">
                    <div class="col-xs-6 col-sm-4 col-md-3">
                        <div class="circle">
                            <i class="fa fa-user fa-3x"></i>
                            <br/>
                            ${student.name}
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>
</body>
</html>