package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.AttendanceBean;
import com.institute.bean.GardianBean;
import com.institute.bean.StudentBean;
import com.institute.dao.GardianDao;
import com.institute.service.GuardianService;

@Service("gardianService")
public class GuardianServiceImpl implements GuardianService {
	@Autowired
	private GardianDao gardianDao;

	public void createGardian(GardianBean gardian) {
		gardianDao.createGardian(gardian);

	}

	public List<GardianBean> getAllGardian() {
		return gardianDao.getAllGardian();
	}

	public List<StudentBean> getAllStuentForGard(String id) {
		return gardianDao.getAllStuentForGard(id);
	}

	public List<AttendanceBean> getAllLeaveList(String userId) {
		return gardianDao.getAllLeaveList(userId);
	}

	public List<AttendanceBean> getAllguardianNotification(String userId) {
		return gardianDao.getAllguardianNotification(userId);
	}

}
