package com.institute.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Curriculum {
	private int id;
	private String attendanceDate;
	private String eventName;
	private ArrayList<String> teachersList = new ArrayList<String>();
	private int totalActualPrice;
	private int totalEstimatedPrice;
	private String teacherName;
	private String teachersParticipate;
	private Map<String,Object> eventList = new HashMap<String,Object>();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(String attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public int getTotalActualPrice() {
		return totalActualPrice;
	}
	public void setTotalActualPrice(int totalActualPrice) {
		this.totalActualPrice = totalActualPrice;
	}
	public int getTotalEstimatedPrice() {
		return totalEstimatedPrice;
	}
	public void setTotalEstimatedPrice(int totalEstimatedPrice) {
		this.totalEstimatedPrice = totalEstimatedPrice;
	}
	public void setTeachersList(ArrayList<String> teachersList) {
		this.teachersList = teachersList;
	}
	public ArrayList<String> getTeachersList() {
		return teachersList;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeachersParticipate(String teachersParticipate) {
		this.teachersParticipate = teachersParticipate;
	}
	public String getTeachersParticipate() {
		return teachersParticipate;
	}
	public void setEventList(Map<String,Object> eventList) {
		this.eventList = eventList;
	}
	public Map<String,Object> getEventList() {
		return eventList;
	}

}
