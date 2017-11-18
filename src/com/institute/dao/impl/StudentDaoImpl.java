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

import com.institute.bean.PrincipalBean;
import com.institute.bean.SQLConstanats;
import com.institute.bean.StudentBean;
import com.institute.dao.StudentDao;

@Repository("sutdentDao")
public class StudentDaoImpl implements StudentDao {
	private String STUDENT_DETAILS = "";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int createStudent(StudentBean studentBean) {

		int count = jdbcTemplate
				.update(SQLConstanats.REGISTER_STUDENT_QUERY,
						studentBean.getCollegeId(), studentBean.getBranchId(),
						studentBean.getEmailid(), studentBean.getName(),
						studentBean.getPassword(),
						studentBean.getContactNumber(), studentBean.getDob(),
						studentBean.getGender(), studentBean.getFatherName(),
						studentBean.getMotherName(),
						studentBean.getHighestQualification(),
						studentBean.getAddress());

		System.out.println("count is " + count);
		return count;
	}

	public List<StudentBean> getAllStudent(String collegeId) {
		if (collegeId != null && !collegeId.equals("")) {
			STUDENT_DETAILS = "SELECT clg.college_name,stu.name,br.branch_name  from student_details stu ,college_details clg ,branch_details br where stu.college_id = clg.id and stu.branch_code= br.branch_code and clg.id ='"+collegeId+"'";
		} else {
			STUDENT_DETAILS = "SELECT clg.college_name,stu.name,br.branch_name  from student_details stu ,college_details clg ,branch_details br where stu.college_id = clg.id and stu.branch_code= br.branch_code";
		}
		return jdbcTemplate.query(STUDENT_DETAILS,
				new ResultSetExtractor<List<StudentBean>>() {

					public List<StudentBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<StudentBean> oList = new ArrayList<StudentBean>();
						while (rs.next()) {

							StudentBean student = new StudentBean();

							student.setName(rs.getString("name"));
							student.setCollegeId(rs.getString("college_name"));
							student.setBranchId(rs.getString("branch_name"));
							oList.add(student);
						}
						return oList;
					}
				});
	}

	public StudentBean getStudentById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void editStudent(StudentBean studBean) {
		// TODO Auto-generated method stub

	}

}
