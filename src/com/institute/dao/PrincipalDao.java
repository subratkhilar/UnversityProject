package com.institute.dao;

import java.util.List;

import com.institute.bean.CollegeBean;
import com.institute.bean.Curriculum;
import com.institute.bean.PrincipalBean;

public interface PrincipalDao {

	public void savePrincipal(PrincipalBean regPrincipalMap);

	public List<PrincipalBean> listOfPrincipals();
	public PrincipalBean getPrincipalById(int pricipalId);

	public List<Curriculum> getSchoolEventDet();
		
}
