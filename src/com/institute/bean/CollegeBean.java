package com.institute.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CollegeBean {
	private Map<String, String> regClgMap = new HashMap<String, String>();
	private String instId = null;
	private String collegeId = null;
	private String instName = null;
	private String collegeName = null;
	private String address = null;
	private String city = null;
	private String pin = null;
	private String state = null;
	private String country = null;
	private String pno = null;
	private String regNumber = null;
	private ArrayList<String> array = new ArrayList<String>();
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public void setInstName(String instName) {
		this.instName = instName;
	}

	public String getInstName() {
		return instName;
	}

	public void setArray(ArrayList<String> array) {
		this.array = array;
	}

	public ArrayList<String> getArray() {
		return array;
	}

	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}

	public String getRegNumber() {
		return regNumber;
	}

	public void setInstId(String instId) {
		this.instId = instId;
	}

	public String getInstId() {
		return instId;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeId() {
		return collegeId;
	}

	public void setRegClgMap(Map<String, String> regClgMap) {
		this.regClgMap = regClgMap;
	}

	public Map<String, String> getRegClgMap() {
		return regClgMap;
	}


}
