package com.institute.service;

import java.util.List;

import com.institute.bean.Subject;

public interface SubjectService {

	public int createSubject(Subject subject);

	public List<Subject> getAllSubject(String collegeId,String branchId);

	public int deleteSubject(int subjectId);

}
