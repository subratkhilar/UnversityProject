<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta name="layout" content="teacher">
    
	<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/datepicker.css" />
	<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" href="css/chosen.css"/>
	<script src="js/chosen.jquery.js"></script>
    <title>Curriculum</title>
    <script type="text/javascript">
    var jq = jQuery.noConflict();
    jq(document).ready(function () {
        jq(".chosen").data("placeholder", "Select Teacher").chosen();
        jq(".delete").hide();
      
    });
    
    jq(document).on('click', '#finalSubmit', function() {
		var jsonObj = [];
		var curriculum = {};
		var dateStr = jq('#event_date').val();
		curriculum["attendanceDate"]=dateStr;
		curriculum["eventName"]=jq("#eventName").val();
		curriculum["teachersList"]=jq("#selectTeacher").val();
		curriculum["totalActualPrice"]=jq("#totalActualPrice").html();
		curriculum["totalEstimatedPrice"]=jq("#totalEstimatedPrice").html();
		
		var dataArray= [];
		var dataMap = {};
		
		
				
		//eventDet
		 jq("#eventTbl tr").each(function(i) {
			 dataArray= [];
			 jq(this).find("input").each(function(){
				 dataArray.push(jq(this).val());
			 });
			 dataMap[i]=dataArray;
		});
		
		//alert(JSON.stringify(dataMap));
		//alert(JSON.stringify(curriculum));
		curriculum["eventList"]=dataMap;
		alert(JSON.stringify(curriculum));
		
		var token = jq('#csrfToken').val();
		var header = jq('#csrfHeader').val();
		jq.ajax({
			url : 'curriculum/save',
			data: JSON.stringify(curriculum), 
			type : "POST",
			contentType : "application/json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},
			success : function(resp) {
				alert("curriculum saved successfully");
			},error : function(e) {
				alert("failed to create curriculum "+JSON.stringify(e));
			}
		});
	});
		
     /* jq('body').on('click', "#event_date", function () {
    	jq(this).datepicker({
            format: 'dd/mm/yyyy',
            changeYear: true,
            changeMonth: true,
            autoclose: true,
            yearRange: "-50:+50", showButtonPanel: true,
            prevText: '<i class="fa fa-angle-left"></i>',
            nextText: '<i class="fa fa-angle-right"></i>'
        });
    }); */
     
    jq(document).on('click', "#addMore", function () {
    	 var fileName = "invoiceFile" + parseInt(jq(".group").length + 1);
        console.log(fileName);

        var clone = jq(".group:first").clone();
        clone.find("input").val("");
        jq(".group:last").after(clone);
        jq(".invoiceFile").each(function (index, value) {
            var fileName = "invoiceFile" + parseInt(index + 1);
            console.log("fileName::" + fileName);
            jq(value).attr("name", fileName);
        });
        jq(".delete").show();
    });
    
    jq(document).on('click', '.delete', function () {
        if (jq(".group").length != 1) {
            jq(this).closest('.group').remove();
            jq(".invoiceFile").each(function (index, value) {
                var fileName = "invoiceFile" + parseInt(index + 1);
                jq(value).attr("name", fileName);
            });
            if (jq(".group").length == 1) {
                jq(".delete").hide();
            }
            totalEstimatedPrice();
            totalActualPrice();
            
        } else {
            toastr.info("Unable to delete last row");
        }
    });
    function totalEstimatedPrice() {
        var total = 0;
        jq(".estimatedPrice").each(function () {
            total = total + parseFloat(jq(this).val());
        });
        jq("#totalEstimatedPrice").html(total);
    }
    
    function totalActualPrice() {
        var total = 0;
        jq(".actualPrice").each(function () {
            total = total + parseFloat(jq(this).val());
        });
        jq("#totalActualPrice").html(total);

    }
    jq(document).on('blur', '.estimatedPrice', function () {
        totalEstimatedPrice();
    });
    jq(document).on('blur', '.actualPrice', function () {
    	totalActualPrice();
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
                            <li class="active"><span class="count">1</span>Create Curriculum</li>
                            <li>
                            		<a href="viewUpdCurriculum">
                           				<span class="count">2</span>Update Curriculum
                           			</a>
                           	</li>
                        </ul>
                    </div>
                </div>
                <form>
                    <div class="col-md-9 avatar-acount" style="padding-bottom: 5%">
                        <!-- <g:render template="/common/flash"/> -->
                        <div style="padding-bottom: 100px">
                            <div class="col-md-12">
                                <div class="form-group col-md-4">
                                    <select id="event" class="col-md-12 form-item form-control" name="schoolEvent">
                                        <option value="" selected="">Select School Event</option>
                                        <c:forEach items="${eventList}" var="eventList">
                                            <option value="${eventList.eventId}">${eventList.eventName}</option>
                                        </c:forEach>
                                        <%-- <g:each in="${teacher?.school?.activeSchoolEvent}"
                                                var="schoolEvent">
                                            <option value="${schoolEvent?.id}">${schoolEvent?.name}</option>
                                        </g:each> --%>
                                    </select>
                                </div>

                                <%-- <div class="form-group col-md-6">
                                    <select name="selectTeacher" id="selectTeacher" class="chosen form-control col-md-12" 
                                    		multiple="true" placeholder="Select Teacher">
                                            <c:forEach items="${teacherList}" var="teacherList">
                                           		<option value="${teacherList.id}">${teacherList.name}</option>
                                            </c:forEach>
                                    </select>
                                </div> --%>
                                <div class="form-group col-md-6">
                                    <select name="selectTeacher" class="chosen form-control col-md-12" multiple="true"
                                            placeholder="Select Teacher">
                                         <c:forEach items="${teacherList}" var="teacherList">
                                           		<option value="${teacherList.id}">${teacherList.name}</option>
                                            </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">

                                <div class="form-group col-md-6">
                                    <input type="text" class="form-control" name="eventName" id="eventName" placeholder="Event Name">
                                </div>

                                <div class="form-group col-md-6">
                                    <a href="javascript:void(0)" id="addMore" style="margin-top: 0px !important;"
                                       class="mc-btn btn-style-2">Add More</a>
                                </div>
                            </div>
							<table id="eventTbl" name="eventTbl">
                            	<tr class="group" id="eventDet" name="eventDet">
                            		<td>
                            		<!-- <div class="group" id="eventDet" name="eventDet"> -->
	                                	<div class=" col-md-12 form-group well well-lg">
		                                    <div class="col-md-3 ">
		                                        <input type="text" class="form-control date" name="event_date" id="event_date" placeholder="Date">
		                                    </div>
		
		                                    <div class="col-md-5 ">
		                                        <input type="text" class="form-control" name="item" id="item" placeholder="Item">
		                                    </div>
		
		                                    <div class="col-md-4">
		                                        <input type="text" class="form-control" name="qty" id="qty" placeholder="Quantity">
		                                    </div>
		
		                                    <div class="col-md-3" style="margin-top: 10px">
		                                        <input type="text" class="form-control estimatedPrice" name="estimatedPrice"
		                                               placeholder="Estimated Price">
		                                    </div>
		
		                                    <div class="col-md-3" style="margin-top: 10px">
		                                        <input type="text" class="form-control actualPrice" name="actualPrice"
		                                               placeholder="Actual Price">
		                                    </div>
		
		                                    <div class="col-md-4" style="margin-top: 10px">
		                                        <input type="text" class="form-control" name="comment" placeholder="Comment">
		                                    </div>
		
		                                    <div class="col-md-5" style="margin-top: 10px">
		                                        <input type="file" class="form-control invoiceFile col-md-12"
		                                               title="Upload Invoice" name="invoiceFile1" value="Upload Invoice"/>
		                                    </div>
		
		                                    <div class="col-md-2">
		                                        <a href="javascript:void(0)" class="mc-btn btn-style-2 delete">Delete</a>
		                                    </div>
	                                	</div>
	                            	</div>
								</td>
							</tr>
							</table>
                            <div class="col-md-12" style="margin-top: 20px;margin-bottom: 10px">
                                <div class="col-lg-8">
                                    <div class="col-md-6">
                                        Total Estimated Price: <b id="totalEstimatedPrice"></b>
                                    </div>

                                    <div class="col-md-6">
                                        Total Actual Price: <b id="totalActualPrice"></b>
                                    </div>
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
                </form>
            </div>
            <input type="hidden" id="csrfToken" value="${_csrf.token}" />
		 	<input type="hidden" id="csrfHeader" value="${_csrf.headerName}" />
        </div>
    </div>
</section>
<<%-- script src="${resource(dir: 'js', file: 'chosen.jquery.js')}"></script>
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'datepicker.css')}">
<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-datepicker.js')}"></script>

<script>
    function totalEstimatedPrice() {
        var total = 0
        $(".estimatedPrice").each(function () {
            total = total + parseFloat($(this).val())
        })
        $("#totalEstimatedPrice").html(total)
    }
    function totalActualPrice() {
        var total = 0
        $(".actualPrice").each(function () {
            total = total + parseFloat($(this).val())
        })
        $("#totalActualPrice").html(total)

    }
    $(document).on('blur', '.estimatedPrice', function () {
        totalEstimatedPrice()
    });

    $(document).on('blur', '.actualPrice', function () {
        totalActualPrice()
    });
    $(document).on('click', '.delete', function () {
        if ($(".group").length != 1) {
            $(this).closest('.group').remove()
            $(".invoiceFile").each(function (index, value) {
                var fileName = "invoiceFile" + parseInt(index + 1)
                $(value).attr("name", fileName)
            });
            if ($(".group").length == 1) {
                $(".delete").hide();
            }
        } else {
            toastr.info("Unable to delete last row")
        }
    });
    $('body').on('focus', ".date", function () {

        $(this).datepicker({
            format: 'dd/mm/yyyy',
            changeYear: true,
            changeMonth: true,
            autoclose: true,
            yearRange: "-50:+50", showButtonPanel: true,
            prevText: '<i class="fa fa-angle-left"></i>',
            nextText: '<i class="fa fa-angle-right"></i>'
        })
    });
    $(document).on('click', "#addMore", function () {
        var fileName = "invoiceFile" + parseInt($(".group").length + 1);
        console.log(fileName)

        var clone = $(".group:first").clone();
        clone.find("input").val("");
        $(".group:last").after(clone);
        $(".invoiceFile").each(function (index, value) {
            var fileName = "invoiceFile" + parseInt(index + 1)
            console.log("fileName::" + fileName)
            $(value).attr("name", fileName)
        });
        $(".delete").show();
    });

    $(document).ready(function () {
        $(".chosen").data("placeholder", "Select Teacher").chosen();
        $(".delete").hide();
        totalEstimatedPrice()
        totalActualPrice()
    });
</script> --%>
</body>
</html>