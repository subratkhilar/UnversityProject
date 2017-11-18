package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.Subject;
import com.institute.dao.SubjectDao;
import com.institute.service.SubjectService;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {
	@Autowired
	private SubjectDao subjectDao;

	public int createSubject(Subject subject) {

		return subjectDao.createSubject(subject);
	}

	public List<Subject> getAllSubject(String collegeId,String branchId) {

		return subjectDao.getAllSubject(collegeId,branchId);
	}

	public int deleteSubject(int subjectId) {

		return subjectDao.deleteSubject(subjectId);
	}

}
