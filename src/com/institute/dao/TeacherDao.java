package com.institute.dao;

import java.util.List;

import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.AttendanceBean;
import com.institute.bean.Curriculum;
import com.institute.bean.Event;
import com.institute.bean.TeacherBean;

public interface TeacherDao {
	public List<TeacherBean> getAllTeacher();

	public TeacherBean getTeacherDetailById(String id);

	public List<AssignTeacherToSubjectBean> getTeacherSubjectDetailsById(
			String id);

	public List<AttendanceBean> getAllStudentInASection(String section);

	public int createAttendance(AttendanceBean attendane);

	public List<AttendanceBean> getAbsentList();

	public List<Event> getEventList();

	public String saveCurriculum(Curriculum curriculum, String createdBy);

	public List<Event> getAllEvent(String user);

	public List<Event> getEventDetails(String user);

}
