package com.institute.service;

import java.util.List;

import com.institute.bean.StudentBean;

public interface StudentService {
	public int createStudent(StudentBean studentBean);

	public List<StudentBean> getAllStudent(String collegeId);

	public StudentBean getStudentById(int id);

	public void editStudent(StudentBean studBean);

}
