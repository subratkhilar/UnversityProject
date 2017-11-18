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
import com.institute.bean.Section;
import com.institute.dao.SectionDao;

@Repository("sectionDao")
public class SectionDaoImpl implements SectionDao {
	Logger logger = Logger.getLogger(SubjectDaoImpl.class);
	String SECTION_DETAIL = "";
	private String INSERT_SECTION_QUERY = "INSERT INTO section(college_id,branch_id,section_name) VALUES(?,?,?)";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int createSection(Section section) {
		int count = jdbcTemplate.update(INSERT_SECTION_QUERY,
				section.getCollegeId(), section.getBranchId(),
				section.getAssociatedSection());
		logger.info("No of Record Insert into Section table ==" + count);
		return count;
	}

	public List<Section> getAllSetion(String collegeId, String branchId) {
		if (collegeId != null && !collegeId.equals("")) {
			SECTION_DETAIL = "select s.id,s.section_name,b.branch_name from section s inner join branch_details b on s.branch_id=b.id where s.college_id='"
					+ collegeId + "'";

		} else if (branchId != null && branchId.equals("")) {
			SECTION_DETAIL = "select s.id,s.section_name,b.branch_name from section s inner join branch_details b on s.branch_id=b.id where s.branch_id='"
					+ branchId + "'";
		} else {
			SECTION_DETAIL = "select s.id,s.section_name,b.branch_name from section s inner join branch_details b on s.branch_id=b.id";
		}
		return jdbcTemplate.query(SECTION_DETAIL,
				new ResultSetExtractor<List<Section>>() {

					public List<Section> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<Section> secList = new ArrayList<Section>();
						while (rs.next()) {

							Section section = new Section();
							section.setId(rs.getInt("id"));
							section.setBranchId(rs.getString("branch_name"));
							section.setAssociatedSection(rs
									.getString("section_name"));
							secList.add(section);
						}
						return secList;
					}
				});
	}
}
