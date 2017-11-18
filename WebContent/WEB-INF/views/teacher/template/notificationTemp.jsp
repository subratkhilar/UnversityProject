<div class="col-md-12">
    <g:if test="${leaveApplicationList}">
        <g:each in="${leaveApplicationList}" var="leaveApplication">
            <div class="well well-lg col-md-12">
                <div class="col-md-3">
                    Name:<b>${leaveApplication?.student?.name}</b>
                </div>

                <div class="col-md-2">From: <b>${leaveApplication?.leaveFrom?.format("dd/MMM/yyyy")}</b>
                </div>

                <div class="col-md-2">To: <b>${leaveApplication?.leaveUpto?.format("dd/MMM/yyyy")}</b>
                </div>

                <div class="col-md-2">
                    Notification: <b>SENT</b>
                </div>

                <div class="col-md-1">
                    Days: <b>${leaveApplication?.leaveCount}</b>
                </div>

                <div class="col-md-2">
                    Class: <b>${leaveApplication?.student?.schoolSectionMapping?.section?.displayClassDetail}</b>
                </div>

                <div class="col-md-3">
                    Status: <b><a href="javascript:void(0)" class="openModal"
                                  leaveNotificationType="${leaveApplication?.leaveNotificationType?.key}"
                                  leaveApplication="${leaveApplication?.id}">${leaveApplication?.leaveNotificationType?.value}</a>
                </b>
                </div>
                <g:if test="${leaveApplication?.leaveApplicationState == com.spandhan.setting.Enums.LeaveApplicationState.DN_SUBMITTED}">
                    <g:form controller="teacher" action="notification">
                        <g:hiddenField name="id" value="${leaveApplication?.id}"/>
                        <div class="col-md-7">
                            <br/>
                            %{--Response: <b></b>--}%
                            <div class="col-md-12"
                                 style="margin-top: 20px;margin-bottom: 10px">
                                <div class="col-md-2">
                                    <input type="radio" checked value="DN_ACCEPTED"
                                           name="status"> <b>ACCEPT</b>
                                </div>

                                <div class="col-md-2">
                                    <input type="radio" value="DN_REJECTED"
                                           name="status"> <b>REJECT</b>
                                </div>

                                <div class="col-md-2">
                                    <input type="submit" value="Submit"
                                           style="margin-top: 0px !important;"
                                           class="mc-btn btn-style-2">
                                </div>
                            </div>
                        </div>
                    </g:form>
                </g:if>
                <g:if test="${leaveApplication?.leaveApplicationState == com.spandhan.setting.Enums.LeaveApplicationState.LL_SUBMITTED}">
                    <g:form controller="teacher" action="notification">
                        <g:hiddenField name="id" value="${leaveApplication?.id}"/>
                        <div class="col-md-7">
                            <br/>
                            %{--Response: <b></b>--}%
                            <div class="col-md-12"
                                 style="margin-top: 10px;margin-bottom: 10px">
                                <div class="col-md-2">
                                    <input type="radio" checked value="LL_ACCEPTED"
                                           name="status"> <b>ACCEPT</b>
                                </div>

                                <div class="col-md-2">
                                    <input type="radio" value="LL_REJECTED"
                                           name="status"> <b>REJECT</b>
                                </div>

                                <div class="col-md-2">
                                    <input type="submit" value="Submit"
                                           style="margin-top: 0px !important;"
                                           class="mc-btn btn-style-2">
                                </div>
                            </div>
                        </div>
                    </g:form>
                </g:if>
            </div>
      

        </g:each>
    </g:if>
    <g:else>
        <div class="col-md-4"></div>

        <div class="col-md-4 well well-lg"
             style="margin-top: 2%;margin-bottom: 2%;font-weight: bold;text-align: center">
            <i class="fa fa-times fa-2x"></i>
            <br/>
            No Notification Found
        </div>

        <div class="col-md-4"></div>

    </g:else>

</div>
