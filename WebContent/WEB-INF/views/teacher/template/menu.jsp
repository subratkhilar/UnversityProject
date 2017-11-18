<script type="text/javascript"
	src="js/library/jquery-1.11.0.min.js"></script> 
	<script>
 
	/* $(document).on('click', '#menu > ul li a', function(e) {
	
		alert("menu link");
	    var $this = $(this);
	    $this.parent().siblings().removeClass('active').end().addClass('active');
	    e.preventDefault();
	});  */
	 $(document).on('click', '#menu > ul li a', function(e) {
		//alert("coming to menu");
	    var $this = $(this);
	    $this.parent().siblings().removeClass('current');
	    $this.addClass('current');
	   // e.preventDefault();
	 // Load the page content in to element
	    // with id #content using ajax (There are other ways)
	   // $('#content').load($this.href()); 
	    
		// $('#menu a[href^="/' + location.pathname.split("/")[1] + '"]').addClass('current');
	    
	});
	
	$(document).ready(function() {
		$
		.ajax({
			url : 'teacherDetails',
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				
				$('#user').append(data.name);
				$('#location').append(data.address);
			}
		});
		})
		
	</script>
	
<!-- PROFILE FEATURE -->
    <section class="profile-feature">
    <div class="awe-parallax bg-profile-feature"></div>

    <div class="awe-overlay overlay-color-3"></div>

    <div class="container">
        <div class="info-author">
            <div class="image">
                
                <!-- <img src="/teacher/downloadDocument?type=LOGO&amp;teacherId=2" alt=""> -->
                <img src="images/team-13.jpg" alt="">
            </div>

            <div class="name-author">
                <h2 class="big"><div id="user"></h2>
            </div>

            <div class="address-author">
                <i class="fa fa-map-marker"></i>

                <h3><div id="location"></div></h3>
            </div>
        </div>
         </div>
</section>
    <!-- END / PROFILE FEATURE -->
<!-- CONTEN BAR -->
    <section class="content-bar ps-container col-md-12">
    <div class="container" id="menu">
        <ul id="menuLinks" >

            <li class="current">
                <a href="teacher">
                    <i class="fa fa-home"></i>
                    Dashboard
                </a>
            </li>
            <li class="">
                <a href="classTimeTable">
                    <i class="fa fa-calendar"></i>
                    Timetable
                </a>
            </li>

            <li class="">
                <a href="weeklyPlanner">
                    <i class="fa fa-th-large"></i>
                    Planner
                </a>
            </li>
          
            
            <li class="">
                <a href="attendance">
                    <i class="fa fa-check-square-o"></i>
                    Attendance
                </a>
            </li>
            <li class="">
                <a href="dailyDiaryByTeacher">
                    <i class=" fa fa-book"></i>
                    Daily Diary
                </a>
            </li>
            <li class="">
                <a href="dailyClassTeaching">
                    <i class=" fa fa-child"></i>
                    Teaching
                </a>
            </li>
            <li class="">
                <a href="studentFeedback">
                    <i class=" fa fa-comment"></i>
                    Feedback
                </a>
            </li>

            <li class="">
                <a href="curriculum">
                    <i class="fa fa-book"></i>
                    Curriculum
                </a>
            </li>
            <li class="">
                <a href="notification">
                    <i class="fa fa-bell"></i>
                    Notification
                </a>
            </li>
            <li class="">
                <a href="createExaminationDetail">
                    <i class="fa fa-book"></i>
                    Results
                </a>
            </li>
            <li></li>
            
           
            
        </ul>
    </div>
</section>

<script>
    $().ready(function () {
        $("#menuLinks").attr("width", "100%");
    });
    
    
</script>