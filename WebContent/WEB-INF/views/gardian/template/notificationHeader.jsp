<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<li class="list-item notification">
	<div class="notification-info item-click">
		<i class="icon fa fa-bell"></i> <span class="badge itemnew"
			style="background-color: transparent; top: -11px !important;">${count}</span>
	</div>

	<div class="toggle-notification toggle-list">
		<div class="list-profile-title">
			<h4>Notification</h4>
			<span class="count-value">${count}</span>
		</div>

		<ul class="list-notification">
			<%-- <g:if test="${guardianNotifications}">
                <g:each in="${guardianNotifications}" var="leaveApplication">
                    <li class="ac-new">
                        <a href="javascript:void(0)">
                            <div class="list-body" style="padding-right: 0px !important;">
                                <div class="author">
                                    <span>${leaveApplication?.notificationMsg}</span>

                                    <div class="div-x"></div>
                                </div>

                                <div class="time">
                                    <span>${leaveApplication?.dateCreated?.format("dd/MMM/yyyy")}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </g:each>
            </g:if>
            <g:if test="${leaveApplicationList}">
                <g:each in="${leaveApplicationList}" var="leaveApplication">
                    <li class="ac-new">
                        <a href="${com.spandhan.utility.AppUtil.getUrlOf_LL_Or_DN(leaveApplication)}">
                            <div class="list-body" style="padding-right: 0px !important;">
                                <div class="author">
                                    <span>${leaveApplication?.notificationMsg}</span>

                                    <div class="div-x"></div>
                                </div>

                                 <div class="time">
                                    <span>${leaveApplication?.dateCreated?.format("dd/MMM/yyyy")}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </g:each>
            </g:if> --%>
			<c:if test="${!empty leaveList}">
				<c:forEach items="${leaveList}" var="leaveApplication">
					  <li class="ac-new">
                        <a href="">
                            <div class="list-body" style="padding-right: 0px !important;">
                                <div class="author">
                                    <span>${leaveApplication.notificationMsg}</span>

                                    <div class="div-x"></div>
                                </div>

                                 <div class="time">
                                    <span>${leaveApplication.attendanceDate}</span>
                                </div>
                            </div>
                        </a>
                    </li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
</li>

