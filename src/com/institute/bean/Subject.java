package com.institute.bean;

import java.util.HashMap;
import java.util.Map;

public class Subject {
	private int id;
	private String collegeId;
	private String branchId;
	private String colorCode;
	private String subject;
	
	private Map<String, String> subjectMap = new HashMap<String, String>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public String getColorCode() {
		return colorCode;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Map<String, String> getSubjectMap() {
		return subjectMap;
	}

	public void setSubjectMap(Map<String, String> subjectMap) {
		this.subjectMap = subjectMap;
	}
	
	

}
