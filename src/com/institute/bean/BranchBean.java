package com.institute.bean;

import java.util.HashMap;
import java.util.Map;

public class BranchBean {
	private int id;
	private String branchCode;
	private String branchName;
	
	private Map<String, String> branchMap = new HashMap<String, String>();
	private String collegeId;
	
	public Map<String, String> getBranchMap() {
		return branchMap;
	}
	public void setBranchMap(Map<String, String> branchMap) {
		this.branchMap = branchMap;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	
	
	

}
