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

import com.institute.bean.AttendanceBean;
import com.institute.bean.GardianBean;
import com.institute.bean.SQLConstanats;
import com.institute.bean.StudentBean;
import com.institute.dao.GardianDao;
@Repository("gardianDao")
public class GardianDaoImpl implements GardianDao {

	private String SELET_STUDENT_DETAILS = "";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void createGardian(GardianBean gardian) {
		// TODO Auto-generated method stub

	}

	public List<GardianBean> getAllGardian() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<StudentBean> getAllStuentForGard(String id) {
		String query = "select  st.name,(st.id) studentId from gardian_details g inner join student_details st on g.student_id = st.id where g.email_id='"
				+ id + "'";
		return jdbcTemplate.query(query,
				new ResultSetExtractor<List<StudentBean>>() {

					public List<StudentBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<StudentBean> oList = new ArrayList<StudentBean>();
						while (rs.next()) {

							StudentBean student = new StudentBean();

							student.setName(rs.getString("name"));
							student.setId(rs.getInt("studentId"));

							oList.add(student);
						}
						return oList;
					}
				});
	}

	public List<AttendanceBean> getAllLeaveList(String userId) {
		String query ="select  st.name,(st.id)studentId,n.status,n.notification_date from gardian_details g "
				+ "inner join student_details st inner join notification n on g.student_id = st.id and g.student_id=n.student_id "
				+ " where g.email_id='"+userId+"' and n.Approve_status='N' and n.status='LL Not Submitted'";
		return jdbcTemplate.query(query,
				new ResultSetExtractor<List<AttendanceBean>>() {

					public List<AttendanceBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<AttendanceBean> oList = new ArrayList<AttendanceBean>();
						while (rs.next()) {

							AttendanceBean attendance = new AttendanceBean();
							attendance.setName(rs.getString("name"));
							String noticMsg ="";
							StringBuffer buffer = new StringBuffer();
							buffer.append(rs.getString("name").toUpperCase());
							buffer.append("is absent from "+rs.getString("notification_date"));
							buffer.append(".Hope Every thing is fine.Please submit Diary Note if more than 3 days please submit leave letter");
							buffer.append("at the end of the leave to updated in system.");
						/*	noticMsg+=rs.getString("name")+" is absent from "+rs.getString("notification_date")+
									".Hope Every thing is fine.Please submit Diary Note if more than 3 days please submit leave letter"
									+ " at the end of the leave to updated in system.";
							System.out.println("noticMsg >> "+noticMsg);*/
							attendance.setNotificationMsg(buffer.toString());
							attendance.setAttendanceDate(rs.getString("notification_date"));
							oList.add(attendance);
						}
						return oList;
					}
				});
	}

	public List<AttendanceBean> getAllguardianNotification(String userId) {
		
		return jdbcTemplate.query(SQLConstanats.GUARDIAN_NOTIFICATION_QUERY,
				new ResultSetExtractor<List<AttendanceBean>>() {

					public List<AttendanceBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<AttendanceBean> oList = new ArrayList<AttendanceBean>();
						
						while (rs.next()) {
							AttendanceBean attendance = new AttendanceBean();
							attendance.setName(rs.getString("name"));
							StringBuffer buffer = new StringBuffer();
							buffer.append("MESSAGE: ");
							buffer.append(rs.getString("name").toUpperCase());
							buffer.append("is absent from "+rs.getString("attendance_date"));
							buffer.append(".Hope Every thing is fine.Please submit Diary Note if more than 3 days please submit leave letter");
							buffer.append("at the end of the leave to updated in system.");
							attendance.setNotificationMsg(buffer.toString());
							attendance.setAttendanceDate(rs.getString("attendance_date"));
							System.out.println("116====> "+attendance.getNotificationMsg());
							oList.add(attendance);
						}
						return oList;
					}
			});
		}

}
