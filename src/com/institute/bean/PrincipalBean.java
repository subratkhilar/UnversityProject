package com.institute.bean;

import java.util.HashMap;
import java.util.Map;

public class PrincipalBean {
	private Map<String, String> regPrincipalMap = new HashMap<String, String>();
	private String principalId = null;
	private String collegeId = null;
	private String collegeName = null;
	private String instId = null;
	private String emailid = null;
	private String principalName = null;
	private String password = null;
	private String contactNumber = null;
	private String dob = null;
	private String gender = null;
	
	
	public Map<String, String> getRegPrincipalMap() {
		return regPrincipalMap;
	}
	public void setRegPrincipalMap(Map<String, String> regPrincipalMap) {
		this.regPrincipalMap = regPrincipalMap;
	}
	public String getPrincipalId() {
		return principalId;
	}
	public void setPrincipalId(String principalId) {
		this.principalId = principalId;
	}
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	public String getInstId() {
		return instId;
	}
	public void setInstId(String instId) {
		this.instId = instId;
	}
	public String getPrincipalName() {
		return principalName;
	}
	public void setPrincipalName(String principalName) {
		this.principalName = principalName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}
	public String getCollegeName() {
		return collegeName;
	}
	
}
