package com.institute.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.institute.bean.RegisterInstituteBean;
import com.institute.dao.RegisterInstituteDao;
import com.institute.service.RegisterInstituteService;
@Service("registerInstituteService")
public class RegisterInstituteServiceImpl implements  RegisterInstituteService {
	
	@Autowired
	private RegisterInstituteDao registerInstituteDao;

	public void saveRegisterInstitute(RegisterInstituteBean regInstMap) {
		registerInstituteDao.saveRegisterInstitute(regInstMap);
		
	}

	public Map<String, String> getAllInstitute() {
		return registerInstituteDao.getAllInstitute();
	}

	public List<RegisterInstituteBean> listOfInstitute() {
		return registerInstituteDao.listOfInstitute();
	}

	public List<RegisterInstituteBean> getInstituteByName(String instituteName) {
		return registerInstituteDao.getInstituteByName(instituteName);
	}
}
