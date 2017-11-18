package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.AttendanceBean;
import com.institute.bean.Curriculum;
import com.institute.bean.Event;
import com.institute.bean.TeacherBean;
import com.institute.dao.TeacherDao;
import com.institute.service.TeacherService;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
	@Autowired
	private TeacherDao teacherDao;

	public List<TeacherBean> getAllTeacher() {
		return teacherDao.getAllTeacher();
	}

	public TeacherBean getTeacherDetailById(String id) {
		
		return teacherDao.getTeacherDetailById(id);
	}

	public List<AssignTeacherToSubjectBean> getTeacherSubjectDetailsById(
			String id) {
		return teacherDao.getTeacherSubjectDetailsById(id);
	}

	public List<AttendanceBean> getAllStudentInASection(String section) {
		return teacherDao.getAllStudentInASection(section);
	}

	public int createAttendance(AttendanceBean attendane) {
		return teacherDao.createAttendance(attendane);
	}

	public List<AttendanceBean> getAbsentList() {
		return teacherDao.getAbsentList();
	}

	public List<Event> getEventList() {
		return teacherDao.getEventList();
	}

	public String saveCurriculum(Curriculum curriculum, String createdBy) {
		return teacherDao.saveCurriculum(curriculum, createdBy);
	}

	public List<Event> getAllEvent(String user) {
		return teacherDao.getAllEvent(user);
	}

	public List<Event> getEventDetails(String user) {
		// TODO Auto-generated method stub
		return teacherDao.getEventDetails(user);
	}
	

}
