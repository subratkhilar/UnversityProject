package com.institute.bean;

import java.util.ArrayList;
import java.util.List;

public class GardianBean {
	private int id;
	private String name;
	private String address;
	
	private List<StudentBean> student = new ArrayList<StudentBean>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<StudentBean> getStudent() {
		return student;
	}

	public void setStudent(List<StudentBean> student) {
		this.student = student;
	}
	
	

}
