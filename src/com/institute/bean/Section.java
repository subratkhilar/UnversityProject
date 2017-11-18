package com.institute.bean;

import java.util.HashMap;
import java.util.Map;

public class Section {
	private int id;
	private String collegeId;
	private String branchId;
	private String associatedSection;
	/*private Map<String, String> sectionMap = new HashMap<String, String>();
	
	public Map<String, String> getSectionMap() {
		return sectionMap;
	}
	public void setSectionMap(Map<String, String> sectionMap) {
		this.sectionMap = sectionMap;
	}*/
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
	public String getAssociatedSection() {
		return associatedSection;
	}
	public void setAssociatedSection(String associatedSection) {
		this.associatedSection = associatedSection;
	}
	
	

}
