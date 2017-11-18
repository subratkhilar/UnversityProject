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

import com.institute.bean.BranchBean;
import com.institute.bean.SQLConstanats;
import com.institute.bean.Subject;
import com.institute.dao.SubjectDao;

@Repository("subjectDao")
public class SubjectDaoImpl implements SubjectDao {
	Logger logger = Logger.getLogger(SubjectDaoImpl.class);
	String SUBJECT_DETAIL = "";
	private String INSERT_SUBJECT_QUERY = "INSERT INTO subject(College_id,branch_id,Subject_name,colorCode) VALUES(?,?,?,?);";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int createSubject(Subject subject) {

		int count = jdbcTemplate.update(INSERT_SUBJECT_QUERY,
				subject.getCollegeId(), subject.getBranchId(),
				subject.getSubject(), subject.getColorCode());
		logger.info("No of Record Insert into Subject table ==" + count);
		System.out.println("count is " + count);
		return count;
	}

	public List<Subject> getAllSubject(String collegeId, String branchId) {
		
		if (branchId != null && !branchId.equals("")) {
			SUBJECT_DETAIL = "select * from subject where branch_id ='"
					+ branchId + "'";
		} else {
			SUBJECT_DETAIL = "select * from subject";
		}

		return jdbcTemplate.query(SUBJECT_DETAIL,
				new ResultSetExtractor<List<Subject>>() {

					public List<Subject> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<Subject> subList = new ArrayList<Subject>();
						while (rs.next()) {

							Subject subject = new Subject();
							subject.setId(rs.getInt("id"));
							subject.setSubject(rs.getString("Subject_name"));
							subject.setColorCode(rs.getString("colorCode"));
							subList.add(subject);
						}
						return subList;
					}
				});

	}

	public int deleteSubject(int subjectId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
