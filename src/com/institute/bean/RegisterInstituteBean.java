package com.institute.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class RegisterInstituteBean {
	private Map<String, String> regInstMap = new HashMap<String, String>();
	private String instId = null;
	private String instName = null;
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


	public void setRegInstMap(Map<String, String> regInstMap) {
		this.regInstMap = regInstMap;
	}

	public Map<String, String> getRegInstMap() {
		return regInstMap;
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


}
