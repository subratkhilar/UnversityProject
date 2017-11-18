package com.institute.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.institute.bean.RegisterInstituteBean;
import com.institute.bean.SQLConstanats;
import com.institute.dao.RegisterInstituteDao;

@Repository("registerCollegeDao")
public class RegisterInstituteDaoImpl implements RegisterInstituteDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public Map<String, String> getAllInstitute() {
		SqlRowSet rs = jdbcTemplate.queryForRowSet(SQLConstanats.getAllInstitute);

		Map<String, String> map = new HashMap<String, String>();
		while (rs.next()) {
			map.put(rs.getString("institute_name"), rs.getString("address"));
		}
		return map;
	}

	public void saveRegisterInstitute(RegisterInstituteBean regInstMap) {
		System.out.println("jdbcTemplate..." + jdbcTemplate);
		System.out.println("regInstMap..." + regInstMap.getInstName());
		Map<String, ArrayList<String>> arrayMap = new HashMap<String, ArrayList<String>>();
		ArrayList<String> array = regInstMap.getArray();
		System.out.println("array is " + array);
		if (null != array && array.size() > 0) {
			for (String str : array) {
				String key = str.split("~!~")[0];
				String value = str.split("~!~")[1];
				if (null != arrayMap && arrayMap.containsKey(key)) {
					ArrayList<String> valueList = arrayMap.get(key);
					valueList.add(value);
					arrayMap.put(key, valueList);

				} else {
					ArrayList<String> valueList = new ArrayList<String>();
					valueList.add(value);
					arrayMap.put(key, valueList);
				}
			}
		}
		System.out.println("arrayMap.get('emailid') "
				+ arrayMap.get("emailid").toString().length());

		String emailId = arrayMap.get("emailid").toString()
				.substring(1, arrayMap.get("emailid").toString().length() - 1);
		String pno = arrayMap.get("pno").toString()
				.substring(1, arrayMap.get("pno").toString().length() - 1);
		String designation = arrayMap
				.get("designation")
				.toString()
				.substring(1,
						arrayMap.get("designation").toString().length() - 1);
		System.out.println("arrayMap is " + arrayMap);
		System.out
				.println("emailId " + emailId + " " + pno + " " + designation);

		int count = jdbcTemplate.update(SQLConstanats.registerInstituteQuery,
				regInstMap.getInstName(), regInstMap.getAddress(),
				regInstMap.getCity(), regInstMap.getPin(),
				regInstMap.getState(), regInstMap.getCountry(), emailId,
				designation, pno, regInstMap.getRegNumber());

		// Map<String, String> institutes = getAllInstituteDetails();
		System.out.println("count is " + count);
	}

	public List<RegisterInstituteBean> getAllInstituteIds() {
		// SqlRowSet rs =
		// jdbcTemplate.queryForRowSet(SQLConstanats.getAllInstitute);
		List<RegisterInstituteBean> listInstitute = new ArrayList<RegisterInstituteBean>();
		RegisterInstituteBean beanInstitute = new RegisterInstituteBean();
		beanInstitute.setInstName("abc");
		beanInstitute.setInstId("def");
		listInstitute.add(beanInstitute);
		/*
		 * while (rs.next()) { RegisterInstituteBean beanInstitute = new
		 * RegisterInstituteBean();
		 * beanInstitute.setInstName(rs.getString("institute_name"));
		 * beanInstitute.setInstId(rs.getString("id"));
		 * listInstitute.add(beanInstitute); }
		 */
		return listInstitute;
	}

	public List<RegisterInstituteBean> listOfInstitute() {

		return jdbcTemplate.query(SQLConstanats.getAllInstitute,
				new ResultSetExtractor<List<RegisterInstituteBean>>() {

					public List<RegisterInstituteBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<RegisterInstituteBean> oList = new ArrayList<RegisterInstituteBean>();

						while (rs.next()) {

							RegisterInstituteBean insti = new RegisterInstituteBean();
							insti.setInstName(rs.getString("institute_name"));
							insti.setAddress(rs.getString("address"));
							insti.setInstId(rs.getString("id"));

							oList.add(insti);

						}
						return oList;
					}
				});
	}

	public List<RegisterInstituteBean> getInstituteByName(String instituteName) {

		List<RegisterInstituteBean> instituteList = this.jdbcTemplate.query(
				SQLConstanats.getInstituteByName,
				 new RowMapper<RegisterInstituteBean>() {
				 public RegisterInstituteBean mapRow(ResultSet rs, int rowNum) throws SQLException {
					 	RegisterInstituteBean insti = new RegisterInstituteBean();
						insti.setInstName(rs.getString("institute_name"));
						insti.setAddress(rs.getString("address"));
						return insti;
					 }
				 });
		System.out.println("instituteList "+instituteList.get(0).getInstName());
		return instituteList;
	}
	
	

	/*
	 * public List<RegisterInstituteBean> getAllInstituteIds() { return
	 * jdbcTemplate.query(SQLConstanats.getAllInstitute,new
	 * ResultSetExtractor<List<RegisterInstituteBean>>() {
	 * 
	 * @Override public List<RegisterInstituteBean> extractData(ResultSet rst)
	 * throws SQLException, DataAccessException { List<RegisterInstituteBean>
	 * sList = new ArrayList<RegisterInstituteBean>(); while (rst.next()) {
	 * RegisterInstituteBean beanInstitute = new RegisterInstituteBean();
	 * beanInstitute.setInstName(rs.getString("institute_name"));
	 * beanInstitute.setInstId(rs.getString("id")); sList.add(store); } return
	 * sList; } }); }
	 */
}
