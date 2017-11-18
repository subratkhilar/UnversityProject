package com.institute.bean;

import java.util.ArrayList;
import java.util.List;

public class AttendanceBean {
	private int id;
	private String rollNo;
	private String name;
	private String remark;
	private String period;
	private String subject;
	private String attendanceDate;
	private String student;
	private boolean attendance;
	private boolean late;
	private String status;
	private String notificationMsg;

	List<AttendanceBean> attendanceList = new ArrayList<AttendanceBean>();
	
	
	public String getNotificationMsg() {
		return notificationMsg;
	}
	public void setNotificationMsg(String notificationMsg) {
		this.notificationMsg = notificationMsg;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<AttendanceBean> getAttendanceList() {
		return attendanceList;
	}
	public void setAttendanceList(List<AttendanceBean> attendanceList) {
		this.attendanceList = attendanceList;
	}
	public String getStudent() {
		return student;
	}
	public void setStudent(String student) {
		this.student = student;
	}
	public boolean isAttendance() {
		return attendance;
	}
	public void setAttendance(boolean attendance) {
		this.attendance = attendance;
	}
	public boolean isLate() {
		return late;
	}
	public void setLate(boolean late) {
		this.late = late;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(String attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	

}
