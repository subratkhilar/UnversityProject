package com.institute.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.CollegeBean;
import com.institute.bean.RegisterInstituteBean;
import com.institute.bean.SQLConstanats;
import com.institute.bean.TimeTableBean;
import com.institute.dao.RegisterCollegeDao;

@Repository("registerInstituteDao")
public class RegisterCollegeDaoImpl implements RegisterCollegeDao {
	Logger logger = Logger.getLogger(RegisterCollegeDaoImpl.class);
	private static String INSERT_SUBJECTASSIGN_QUERY = "INSERT INTO subject_assignto_teacher(teacher_id,branch_id,subject,Section)VALUES(?,?,?,?)";
	private static String GETASSIGNSUBJECT_DETAILS = "select t.name,sb.subject_name,br.branch_name,sc.section_name from subject_assignto_teacher s inner join teacher_detais t inner join subject sb inner join branch_details br inner join section sc on s.teacher_id = t.id and s.subject = sb.id and s.branch_id = br.id and s.section = sc.id";
	private String GETTIMETABLE_DETAILS = "";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void saveRegisterInstitute(CollegeBean regClgMap) {
		System.out.println("i am inside dao class for save collge");

		System.out.println("jdbcTemplate..." + jdbcTemplate);
		System.out.println("regInstMap..." + regClgMap.getInstName());
		Map<String, ArrayList<String>> arrayMap = new HashMap<String, ArrayList<String>>();
		ArrayList<String> array = regClgMap.getArray();
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

		int count = jdbcTemplate.update(SQLConstanats.registerCollegeQuery,
				regClgMap.getCollegeName(), regClgMap.getInstId(),
				regClgMap.getAddress(), regClgMap.getCity(),
				regClgMap.getPin(), regClgMap.getState(),
				regClgMap.getCountry(), emailId, designation, pno,
				regClgMap.getRegNumber());

		// Map<String, String> institutes = getAllInstituteDetails();
		System.out.println("count is " + count);

	}

	public List<CollegeBean> getListOfColleges() {
		return jdbcTemplate.query(SQLConstanats.getAllCollges,
				new ResultSetExtractor<List<CollegeBean>>() {

					public List<CollegeBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<CollegeBean> oList = new ArrayList<CollegeBean>();
						while (rs.next()) {
							CollegeBean clg = new CollegeBean();
							clg.setCollegeName(rs.getString("college_name"));
							clg.setAddress(rs.getString("address"));
							clg.setCollegeId(rs.getString("ID"));
							oList.add(clg);
						}
						return oList;
					}
				});
	}

	public void assignSubjectToTeach(AssignTeacherToSubjectBean assignBean) {
		int count = jdbcTemplate.update(INSERT_SUBJECTASSIGN_QUERY,
				assignBean.getTeacher(), assignBean.getBranchId(),
				assignBean.getSubject(), assignBean.getSection());
		logger.info("No of Record Insert into Subject Assignation  table =="
				+ count);
		System.out.println("count is " + count);

	}

	public List<AssignTeacherToSubjectBean> getAssignSubjectLst() {
		return jdbcTemplate.query(GETASSIGNSUBJECT_DETAILS,
				new ResultSetExtractor<List<AssignTeacherToSubjectBean>>() {

					public List<AssignTeacherToSubjectBean> extractData(
							ResultSet rs) throws SQLException,
							DataAccessException {
						List<AssignTeacherToSubjectBean> oList = new ArrayList<AssignTeacherToSubjectBean>();
						while (rs.next()) {
							AssignTeacherToSubjectBean assignBean = new AssignTeacherToSubjectBean();
							assignBean.setTeacher(rs.getString("name"));
							assignBean.setSubject(rs.getString("subject_name"));
							assignBean.setBranchId(rs.getString("branch_name"));
							assignBean.setSection(rs.getString("section_name"));
							oList.add(assignBean);
						}
						return oList;
					}
				});
	}

	public List<TimeTableBean> getTimetableDetails(String collegeId,
			String section) {
		GETTIMETABLE_DETAILS = "SELECT t.day,(sb.subject_name ) period1,(sb.colorCode) period1Col,(sb1.subject_name) period2,(sb1.colorCode) period2Col "
				+ ",(sb2.subject_name) period3,(sb2.colorCode) period3Col,(sb3.subject_name) period4,(sb3.colorCode) period4Col,(sb4.subject_name) period5,"
				+ "(sb4.colorCode) period5Col  ,(sb5.subject_name) period6,(sb5.colorCode) period6Col "
				+ ",(sb6.subject_name) period7,(sb6.colorCode) period7Col  ,(sb7.subject_name) period8,(sb7.colorCode) period8Col FROM  timetable t "
				+ " inner join subject sb  inner join subject sb1  inner join subject sb2 inner join subject sb3 inner join subject sb4 inner join subject sb5"
				+ " inner join subject sb6 inner join subject sb7    on t.period1 =  sb.id  and t.period2=sb1.id  and t.period3=sb2.id"
				+ "  and t.period4=sb3.id  and t.period5=sb4.id  and t.period6=sb5.id  and t.period7=sb6.id  and t.period8=sb7.id";
		return jdbcTemplate.query(GETTIMETABLE_DETAILS,
				new ResultSetExtractor<List<TimeTableBean>>() {

					public List<TimeTableBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<TimeTableBean> timeTableList = new ArrayList<TimeTableBean>();
						while (rs.next()) {
							TimeTableBean timeTableBean = new TimeTableBean();
							timeTableBean.setDay(rs.getString("day"));
							timeTableBean.setPeriod1(rs.getString("period1")+"#"+rs.getString("period1Col"));
							timeTableBean.setPeriod2(rs.getString("period2")+"#"+rs.getString("period2Col"));
							timeTableBean.setPeriod3(rs.getString("period3")+"#"+rs.getString("period3Col"));
							timeTableBean.setPeriod4(rs.getString("period4")+"#"+rs.getString("period4Col"));
							timeTableBean.setPeriod5(rs.getString("period5")+"#"+rs.getString("period5Col"));
							timeTableBean.setPeriod6(rs.getString("period6")+"#"+rs.getString("period6Col"));
							timeTableBean.setPeriod7(rs.getString("period7")+"#"+rs.getString("period7Col"));
							timeTableBean.setPeriod8(rs.getString("period8")+"#"+rs.getString("period8Col"));
							timeTableList.add(timeTableBean);
						}
						return timeTableList;
					}
				});
	}
}
