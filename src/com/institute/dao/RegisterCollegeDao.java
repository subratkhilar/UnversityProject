package com.institute.dao;

import java.util.List;

import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.CollegeBean;
import com.institute.bean.TimeTableBean;

public interface RegisterCollegeDao {

	public void saveRegisterInstitute(CollegeBean regClgMap);

	public List<CollegeBean> getListOfColleges();

	public void assignSubjectToTeach(AssignTeacherToSubjectBean assignBean);

	public List<AssignTeacherToSubjectBean> getAssignSubjectLst();
	
	public List<TimeTableBean> getTimetableDetails(String collegeId,String section);

}
