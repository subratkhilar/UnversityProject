package com.institute.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.institute.bean.CollegeBean;
import com.institute.bean.Curriculum;
import com.institute.bean.LoginBean;
import com.institute.bean.PrincipalBean;
import com.institute.bean.SQLConstanats;
import com.institute.dao.PrincipalDao;

@Repository("principalDao")
public class PrincipalDaoImpl implements PrincipalDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void savePrincipal(PrincipalBean regPrincipalMap) {
		System.out.println("jdbcTemplate " + jdbcTemplate);

		int count = jdbcTemplate.update(SQLConstanats.REGISTER_PRINCIPAL_QUERY,
				regPrincipalMap.getInstId(), regPrincipalMap.getCollegeId(),
				regPrincipalMap.getEmailid(),
				regPrincipalMap.getPrincipalName(),
				regPrincipalMap.getPassword(),
				regPrincipalMap.getContactNumber(), regPrincipalMap.getDob(),
				regPrincipalMap.getGender());

		System.out.println("count is " + count);
	}

	public List<PrincipalBean> listOfPrincipals() {
		return jdbcTemplate.query(SQLConstanats.PRINCIPAL_DETAILS,
				new ResultSetExtractor<List<PrincipalBean>>() {

					public List<PrincipalBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<PrincipalBean> oList = new ArrayList<PrincipalBean>();
						while (rs.next()) {
							System.out.println(rs.getString("principal_name")
									+ "  " + rs.getString("college_name"));
							PrincipalBean principal = new PrincipalBean();
							principal.setPrincipalName(rs
									.getString("principal_name"));
							principal.setCollegeName(rs
									.getString("college_name"));
							principal.setPrincipalId(rs.getString("ID"));
							oList.add(principal);
						}
						return oList;
					}
				});
	}

	public PrincipalBean getPrincipalById(int pricipalId) {
		String sql ="SELECT principal.ID,principal.email_Id,principal.contact_number,principal.dob,principal.gender,principal.principal_name, clg.college_name FROM PRINCIPAL_DETAILS principal inner join college_details clg on principal.college_id= clg.id WHERE principal.id= '"+pricipalId+"'";
		return jdbcTemplate.query(sql,
				new ResultSetExtractor<PrincipalBean>() {
					public PrincipalBean extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						if (rs.next()) {
							PrincipalBean princBean = new PrincipalBean();
							princBean.setCollegeName(rs
									.getString("college_name"));
							princBean.setPrincipalName(rs
									.getString("principal_name"));
							princBean.setEmailid(rs.getString("email_Id"));
							princBean.setContactNumber(rs
									.getString("contact_number"));
							princBean.setGender(rs.getString("gender"));
							princBean.setDob(rs.getString("dob"));
							return princBean;
						}

						return null;
					}

				});
	}
	
	public List<Curriculum> getSchoolEventDet() {
		return jdbcTemplate.query(SQLConstanats.QUERY_GET_CURRICULUM,
				new ResultSetExtractor<List<Curriculum>>() {

					public List<Curriculum> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<Curriculum> curriculumList = new ArrayList<Curriculum>();
						while (rs.next()) {
							Curriculum curriculum = new Curriculum();
							curriculum.setTeacherName(rs.getString("CREATED_BY"));
							curriculum.setEventName(rs.getString("EVENT_NAME"));
							//curriculum.setTeachersParticipate(rs.getString("TEACHERS_ID"));
							curriculum.setTotalActualPrice(rs.getInt("ESTIMATED_PRICE"));
							curriculum.setTotalEstimatedPrice(rs.getInt("ACTUAL_PRICE"));
							curriculumList.add(curriculum);
						}
						return curriculumList;
					}
				});
	}

}
