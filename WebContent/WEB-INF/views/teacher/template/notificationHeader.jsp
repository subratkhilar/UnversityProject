<li class="list-item notification">
    <div class="notification-info item-click">
        <i class="icon fa fa-bell"></i>
           <span class="badge itemnew" style="background-color: transparent;top: -11px !important;">${count}</span>
    </div>

    <div class="toggle-notification toggle-list">
        <div class="list-profile-title">
            <h4>Notification</h4>
            <span class="count-value">${count}</span>
        </div>

        <ul class="list-notification">
            <g:if test="${notificationDTOList}">
                <g:each in="${notificationDTOList}" var="notificationDTO">
                    <li class="ac-new">
                        <a href="${notificationDTO?.url}">
                            <div class="list-body" style="padding-right: 0px !important;">
                                <div class="author">
                                    <span>${notificationDTO?.notificationMsg}</span>

                                    <div class="div-x"></div>
                                </div>

                                 <div class="time">
                                    <span>${notificationDTO?.dateCreated?.format("dd/MMM/yyyy")}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </g:each>
            </g:if>
        </ul>
    </div>
</li>

