package com.institute.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.institute.bean.LibrarianBean;
import com.institute.bean.SQLConstanats;
import com.institute.bean.Subject;
import com.institute.dao.LibrarianDao;

@Repository("librarianDao")
public class LibrarianDaoImpl implements LibrarianDao {
	private Logger logger = Logger.getLogger(LibrarianDaoImpl.class);
	private static String INSERT_LIBARAIN_QUERY = "INSERT INTO librarian(college_id,name,address,gender,height,weight,phoneNo,educationQualification,email_id,password)VALUES(?,?,?,?,?,?,?,?,?,?);";
	private static String SELECT_ALL_LIBRAIAN = "SELECT * FROM LIBRARIAN";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int createLibrarian(LibrarianBean libBean) {
		System.out.println("coming to Librain daoimpl>>");
		int count = jdbcTemplate.update(INSERT_LIBARAIN_QUERY,
				libBean.getCollegeId(), libBean.getName(),
				libBean.getAddress(), libBean.getGender(), libBean.getHeight(),
				libBean.getWeight(), libBean.getPhoneNo(),
				libBean.getEducationQualification(), libBean.getEmailId(),
				libBean.getPassword());
		logger.info("No of Record Insert into Librarian table ==" + count);
		jdbcTemplate.update(SQLConstanats.USER_REGD_QUERY,
				libBean.getEmailId(), libBean.getPassword());
		jdbcTemplate.update(SQLConstanats.USER_AUTHORITY_QUERY,
				libBean.getEmailId(), "ROLE_LIBRARIAN");

		return count;
	}

	public List<LibrarianBean> getAllLibrarian(String collegeId) {
		if(collegeId!=null && !collegeId.equals(""))
		{
			SELECT_ALL_LIBRAIAN="SELECT * FROM LIBRARIAN where college_id='"+collegeId+"'";
		}
		return jdbcTemplate.query(SELECT_ALL_LIBRAIAN,
				new ResultSetExtractor<List<LibrarianBean>>() {

					public List<LibrarianBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<LibrarianBean> librList = new ArrayList<LibrarianBean>();
						while (rs.next()) {

							LibrarianBean libBean = new LibrarianBean();
							libBean.setName(rs.getString("name"));
							libBean.setAddress(rs
									.getString("address"));
							libBean.setEducationQualification(rs
									.getString("educationQualification"));
							librList.add(libBean);
						}
						return librList;
					}
				});
	}

	public LibrarianBean getLibrianById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deletelibraian(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
