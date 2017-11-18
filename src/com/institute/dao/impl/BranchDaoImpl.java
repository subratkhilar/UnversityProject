package com.institute.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.institute.bean.BranchBean;
import com.institute.bean.PrincipalBean;
import com.institute.bean.SQLConstanats;
import com.institute.dao.BranchDao;

@Repository("branchDao")
public class BranchDaoImpl implements BranchDao {
	String BRANCH_DETAIL = " ";
	private String INSERT_BRANCH_QUERY = "INSERT INTO branch_details(college_id,branch_name,branch_code) VALUES(?,?,?)";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<BranchBean> getAllBranch(String collegeId) {
		if (collegeId != null && !collegeId.equals("")) {
			BRANCH_DETAIL = "SELECT b.id,b.BRANCH_NAME,b.BRANCH_CODE,c.college_name FROM  BRANCH_DETAILS b inner join college_details c on b.college_id=c.id where college_id ='"
					+ collegeId + "'";
		} else {
			BRANCH_DETAIL = "SELECT b.id,b.BRANCH_NAME,b.BRANCH_CODE,c.college_name FROM  BRANCH_DETAILS b inner join college_details c on b.college_id=c.id";
		}
		return jdbcTemplate.query(BRANCH_DETAIL,
				new ResultSetExtractor<List<BranchBean>>() {

					public List<BranchBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<BranchBean> brList = new ArrayList<BranchBean>();
						while (rs.next()) {

							BranchBean branchBean = new BranchBean();
							branchBean.setBranchCode(rs
									.getString("BRANCH_CODE"));
							branchBean.setBranchName(rs
									.getString("BRANCH_NAME"));
							branchBean.setId(rs.getInt("id"));
							branchBean.setCollegeId(rs.getString("college_name"));
							brList.add(branchBean);
						}
						return brList;
					}
				});
	}

	public void ceateBranch(BranchBean branchBean) {
		String branchCode = "";
		if (branchBean.getBranchName() != null && !branchBean.getBranchName().equals("")) {
			branchCode = branchBean.getBranchName().substring(0, 2);
		}

		jdbcTemplate.update(INSERT_BRANCH_QUERY, branchBean.getCollegeId(),
				branchBean.getBranchName(), branchCode);

	}

}
