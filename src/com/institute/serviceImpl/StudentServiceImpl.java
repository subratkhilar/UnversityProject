package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.StudentBean;
import com.institute.dao.StudentDao;
import com.institute.service.StudentService;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao sutdentDao;

	public int createStudent(StudentBean studentBean) {
		return sutdentDao.createStudent(studentBean);
	}

	public List<StudentBean> getAllStudent(String collegeId) {
		return sutdentDao.getAllStudent(collegeId);
	}

	public StudentBean getStudentById(int id) {
		return sutdentDao.getStudentById(id);
	}

	public void editStudent(StudentBean studBean) {
		sutdentDao.editStudent(studBean);

	}

}
