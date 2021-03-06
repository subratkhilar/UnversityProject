<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div id="header" class="header" style="height: 90px">
	<div class="container">

		<!-- LOGO -->
		<div class="logo">
			<a href="/public/dashboard"><img
				style="margin-top: 20px !important;" src="images/logo1.png"
				alt=""></a>
		</div>
		<!-- END / LOGO -->

		<!-- NAVIGATION -->
		<nav class="navigation" style="margin-top: 10px">

			<div class="open-menu">
				<span class="item item-1"></span> <span class="item item-2"></span>
				<span class="item item-3"></span>
			</div>

			<!-- MENU -->
			<ul class="menu" style="">
				<li class="current-menu-item"><a href="#">Home</a></li>

					<li class="menu-item-has-children megamenu col-4"><a
						href="javascript:void(0)">Tasks</a>
						<ul class="sub-menu">
							<li class="menu-item-has-children"><a
								href="javascript:void(0)">Create</a>
								<ul class="sub-menu">
									<sec:authorize access=" hasRole('ROLE_INSTITUTE')">
									<li><a href="instituteRegistration">Institute Registration</a></li>
									</sec:authorize>
									<li><a href="#">Subject</a></li>
									<li><a href="#">Teacher</a></li>
									<li><a href="#">Section</a></li>
									<li><a href="#">Admission</a></li>
									<li><a href="#">Timetable</a></li>
									<li><a href="#">Principal</a></li>
									<li><a href="#">Vendor</a></li>
									<li><a href="#">Feedback Criteria</a></li>
									<li><a href="#">Librarian</a></li>

								</ul></li>
							<li class="menu-item-has-children"><a
								href="javascript:void(0)">Create</a>
								<ul class="sub-menu">
									<li><a href="#">Approve Inventory Request</a></li>
									<li><a href="#">Create Admin</a></li>
									<li><a href="javascript:void(0)">Create Basic
											Information</a></li>
									<li><a href="javascript:void(0)">Create Design Course</a></li>
									<li><a href="javascript:void(0)">Create Publish Course</a></li>
									<li><a href="javascript:void(0)">Request Teacher</a></li>
									<li><a href="javascript:void(0)">Search Result Found</a></li>
									<li><a href="javascript:void(0)">Search Result Found</a></li>
								</ul></li>

							<li class="menu-item-has-children"><a
								href="javascript:void(0)">Assignment</a>
								<ul class="sub-menu">
									<li><a href="#">Teacher With Subject</a></li>
									<li><a href="#">Assign Class Teacher</a></li>

									<li><a href="#">Vendor to Inventory</a></li>
									<li><a href="javascript:void(0)">Asignment Submit</a></li>
									<li><a href="javascript:void(0)">Become Teacher</a></li>
									<li><a href="javascript:void(0)">Categories</a></li>
								</ul></li>

							<li class="menu-item-has-children"><a
								href="javascript:void(0)">Learn 3</a>
								<ul class="sub-menu">
									<li><a href="javascript:void(0)">Learning</a></li>
									<li><a href="javascript:void(0)">Quizz 1</a></li>
									<li><a href="javascript:void(0)">Quizz 2</a></li>
									<li><a href="javascript:void(0)">Quizz 3</a></li>
									<li><a href="javascript:void(0)">Quizz 5</a></li>
									<li><a href="javascript:void(0)">Quizz 20</a></li>
									<li><a href="javascript:void(0)">Quizz Finish</a></li>
									<li><a href="javascript:void(0)">Quizz Intro</a></li>
								</ul></li>
						</ul></li>
					
					
				
				
			</ul>
			<!-- END / MENU -->

			<!-- SEARCH BOX -->
			<div class="search-box" style="margin-right: 70px !important;">
				<i class="icon fa fa-search"></i>

				<div class="search-inner">
					<form>
						<input type="text" placeholder="key words">
					</form>
				</div>
			</div>

			<!-- END / SEARCH BOX -->
			
				<!-- LIST ACCOUNT INFO -->
				<ul class="list-account-info">
					 <li class="list-item messages">
                            <div class="message-info item-click">
                                <i class="icon fa fa-envelope"></i>
                                <span class="itemnew"></span>
                            </div>

                            <div class="toggle-message toggle-list">
                                <div class="list-profile-title">
                                    <h4>Inbox message</h4>
                                    <span class="count-value">3</span>
                                    <a href="javascript:void(0)" class="new-message"><i class="icon fa fa-pencil"></i></a>
                                </div>
                                <ul class="list-message">

                                    <!-- LIST ITEM -->
                                    <li class="ac-new">
                                        <a href="javascript:void(0)">
                                            <div class="image">
                                                <img src="images/team-13.jpg" alt="">
                                        </div>

                    <div class="list-body">
                        <div class="author">
                            <span>Megacourse</span>

                            <div class="div-x"></div>
                        </div>

                        <p>Welcome message</p>

                        <div class="time">
                            <span>12:53</span>
                        </div>

                        <div class="indicator">
                            <i class="icon fa fa-paperclip"></i>
                        </div>
                    </div>
                    </a>
                </li>
                <!-- END / LIST ITEM -->

                <!-- LIST ITEM -->
                    <li class="ac-new">
                        <a href="javascript:void(0)">
                            <div class="image">
                                <img src="images/team-13.jpg" alt="">
                            </div>

                            <div class="list-body">
                                <div class="author">
                                    <span>Name of sender</span>

                                    <div class="div-x"></div>
                                </div>

                                <p>Message title</p>

                                <div class="time">
                                    <span>5 days ago</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!-- END / LIST ITEM -->

                    <!-- LIST ITEM -->
                    <li class="ac-new">
                        <a href="javascript:void(0)">
                            <div class="image">
                                <img src="images/team-13.jpg" alt="">
                            </div>

                            <div class="list-body">
                                <div class="author">
                                    <span>Sasha Grey</span>

                                    <div class="div-x"></div>
                                </div>

                                <p>Maecenas sodales, nisl eget dign...</p>

                                <div class="time">
                                    <span>5 days ago</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!-- END / LIST ITEM -->

                    <!-- LIST ITEM -->
                    <li>
                        <a href="javascript:void(0)">
                            <div class="image">
                                <img src="images/team-13.jpg" alt="">
                            </div>

                            <div class="list-body">
                                <div class="author">
                                    <span>Amanda Gleam</span>

                                    <div class="div-x"></div>
                                </div>

                                <p>Message title</p>

                                <div class="time">
                                    <span>5 days ago</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!-- END / LIST ITEM -->

                    <!-- LIST ITEM -->
                    <li>
                        <a href="javascript:void(0)">
                            <div class="image">
                                <img src="images/team-13.jpg" alt="">
                            </div>

                            <div class="list-body">
                                <div class="author">
                                    <span>Amanda Gleam</span>

                                    <div class="div-x"></div>
                                </div>

                                <p>Message title</p>

                                <div class="time">
                                    <span>5 days ago</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!-- END / LIST ITEM -->

                    <!-- LIST ITEM -->
                    <li>
                        <a href="javascript:void(0)">
                            <div class="image">
                                <img src="images/team-13.jpg" alt="">
                            </div>

                            <div class="list-body">
                                <div class="author">
                                    <span>Amanda Gleam</span>

                                    <div class="div-x"></div>
                                </div>

                                <p>Message title</p>

                                <div class="time">
                                    <span>5 days ago</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!-- END / LIST ITEM -->

                </ul>

                    <div class="viewall">
                        <a href="javascript:void(0)">view all 80 messages</a>
                    </div>
                    </div>
                </li>
					<li class="list-item account">
						<div class="account-info item-click">
							<img src="images/team-13.jpg" alt="">
						</div>

						<div class="toggle-account toggle-list">
							<ul class="list-account">
								<li><a href="javascript:void(0)"><i
										class="icon  fa fa-cog"></i>Setting</a></li>
								<li><a href="<c:url value="/logout" />"><i
										class="icon fa fa-arrow-right"></i>Sign Out</a></li>
							</ul>
						</div>
					</li>
				</ul>
		
			<!-- END / LIST ACCOUNT INFO -->

		</nav>
		<!-- END / NAVIGATION -->

	</div>
</div>


