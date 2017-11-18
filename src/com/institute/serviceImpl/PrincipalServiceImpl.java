package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.Curriculum;
import com.institute.bean.PrincipalBean;
import com.institute.dao.PrincipalDao;
import com.institute.service.PrincipalService;
@Service("principalService")
public class PrincipalServiceImpl implements PrincipalService{

	@Autowired
	private PrincipalDao principalDao;
	
	public void savePrincipal(PrincipalBean regPrincipalMap) {
		principalDao.savePrincipal(regPrincipalMap);
	}

	public List<PrincipalBean> listOfPrincipals() {
		return principalDao.listOfPrincipals();
	}

	public PrincipalBean getPrincipalById(int pricipalId) {
		// TODO Auto-generated method stub
		return principalDao.getPrincipalById(pricipalId);
	}

	public List<Curriculum> getSchoolEventDet() {
		return principalDao.getSchoolEventDet();
	}

}
