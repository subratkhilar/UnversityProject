package com.institute.bean;

import java.util.HashMap;
import java.util.Map;

public class StudentBean {

	private int id;
	private String emailid = null;
	private String principalName = null;
	private String password = null;
	private String contactNumber = null;
	private String dob = null;
	private String gender = null;
	private String collegeId;
	private String branchId;
	private String name;
	private String fatherName;
	private String motherName;
	private String highestQualification;
	private String address;
	private Map<String, String> studentMap = new HashMap<String, String>();
	
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public Map<String, String> getStudentMap() {
		return studentMap;
	}
	public void setStudentMap(Map<String, String> studentMap) {
		this.studentMap = studentMap;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getHighestQualification() {
		return highestQualification;
	}
	public void setHighestQualification(String highestQualification) {
		this.highestQualification = highestQualification;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
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
	
	
}
