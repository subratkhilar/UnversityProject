package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.CollegeBean;
import com.institute.bean.TimeTableBean;
import com.institute.dao.RegisterCollegeDao;
import com.institute.service.RegisterCollegeService;
@Service("registerClgService")
public class RegisterCollegeServiceImpl implements RegisterCollegeService{

	@Autowired
	private RegisterCollegeDao registerCollegeDao;
	
	public void saveRegisterInstitute(CollegeBean regClgMap) {
		registerCollegeDao.saveRegisterInstitute(regClgMap);
	}

	public List<CollegeBean> listOfColleges() {
		return registerCollegeDao.getListOfColleges();
	}

	public void assignSubjectToTeach(AssignTeacherToSubjectBean assignBean) {
		registerCollegeDao.assignSubjectToTeach(assignBean);
		
	}

	public List<AssignTeacherToSubjectBean> getAssignSubjectLst() {
		return registerCollegeDao.getAssignSubjectLst();
	}

	public List<TimeTableBean> getTimetableDetails(String collegeId,
			String section) {
		
		return registerCollegeDao.getTimetableDetails(collegeId, section);
	}

}
