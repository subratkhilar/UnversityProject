package com.institute.service;

import java.util.List;

import com.institute.bean.AttendanceBean;
import com.institute.bean.GardianBean;
import com.institute.bean.StudentBean;

public interface GuardianService {
	public void createGardian(GardianBean gardian);

	public List<GardianBean> getAllGardian();

	public List<StudentBean> getAllStuentForGard(String id);

	public List<AttendanceBean> getAllLeaveList(String userId);

	public List<AttendanceBean> getAllguardianNotification(String userId);

}
