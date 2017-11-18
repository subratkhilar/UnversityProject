package com.institute.util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.scheduling.annotation.Scheduled;

import com.institute.bean.AttendanceBean;

public class NotificationCronJob {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	String query = "SELECT  student_id,attendance_date FROM spandan.attendance where created_date = "
			+ "(select distinct created_date from attendance order by created_date desc limit 1) and isPresent='N'";
	private static String INSERT_NOTIFICATION_QUERY = "INSERT INTO notification(student_id,notification_date,status) VALUES(?,?,?)";

	// @Scheduled(cron="*/55 * * * * ?")
	//@Scheduled(cron="0 0/5 * * * ?")
	public void demoServiceMethod() {
		 System.out.println("Method executed at every 5 seconds. Current time is :: "+ new Date());

		final List<AttendanceBean> attendanceList = new ArrayList<AttendanceBean>();

		jdbcTemplate.query(query,
				new ResultSetExtractor<List<AttendanceBean>>() {

					public List<AttendanceBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {

						while (rs.next()) {

							AttendanceBean attendanceBean = new AttendanceBean();
							attendanceBean.setStudent(rs
									.getString("student_id"));
							attendanceBean.setAttendanceDate(rs
									.getString("attendance_date"));

							attendanceList.add(attendanceBean);
						}
						return attendanceList;

					}
				});

		/*
		 * for(int i=0;i<attendanceList.size();i++) { AttendanceBean attbean =
		 * attendanceList.get(i);
		 * System.out.println("attendance id >>"+attbean.getStudent());
		 * System.out.println("attendance date >>"+attbean.getAttendanceDate());
		 * }
		 */

		jdbcTemplate.batchUpdate(INSERT_NOTIFICATION_QUERY,
				new BatchPreparedStatementSetter() {

					public void setValues(PreparedStatement ps, int i)
							throws SQLException {
						AttendanceBean attendance = attendanceList.get(i);

						ps.setString(1, attendance.getStudent());
						ps.setString(2, attendance.getAttendanceDate());
						ps.setString(3, "LL Not Submitted");
					}

					public int getBatchSize() {
						return attendanceList.size();
					}
				});
		
		System.out.println("cron job execution done "+new Date());

	}
}
