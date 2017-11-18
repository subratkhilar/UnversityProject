package com.institute.service;

import java.util.List;

import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.CollegeBean;
import com.institute.bean.TimeTableBean;

public interface RegisterCollegeService {

	void saveRegisterInstitute(CollegeBean regClgMap);

	List<CollegeBean> listOfColleges();

	public void assignSubjectToTeach(AssignTeacherToSubjectBean assignBean);

	public List<AssignTeacherToSubjectBean> getAssignSubjectLst();

	public List<TimeTableBean> getTimetableDetails(String collegeId,
			String section);

}
