package com.institute.dao;

import java.util.List;

import com.institute.bean.Subject;

public interface SubjectDao {
	public int createSubject(Subject subject);

	public List<Subject> getAllSubject(String collegeId,String branchId);

	public int deleteSubject(int subjectId);

}
