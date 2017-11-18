package com.institute.dao;

import java.util.List;
import java.util.Map;


import com.institute.bean.RegisterInstituteBean;

public interface RegisterInstituteDao {

	public void saveRegisterInstitute(RegisterInstituteBean regInstMap);
	public Map<String, String> getAllInstitute();
	public List<RegisterInstituteBean> listOfInstitute();
	public List<RegisterInstituteBean> getInstituteByName(String instituteName);

}
