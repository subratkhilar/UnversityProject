package com.institute.service;

import java.util.List;

import com.institute.bean.Curriculum;
import com.institute.bean.PrincipalBean;

public interface PrincipalService {

	public void savePrincipal(PrincipalBean regPrincipalMap);

	public List<PrincipalBean> listOfPrincipals();
	public PrincipalBean getPrincipalById(int pricipalId);

	public List<Curriculum> getSchoolEventDet();

}
