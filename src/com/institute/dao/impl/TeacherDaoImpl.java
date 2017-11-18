package com.institute.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.AttendanceBean;
import com.institute.bean.Curriculum;
import com.institute.bean.Event;
import com.institute.bean.SQLConstanats;
import com.institute.bean.TeacherBean;
import com.institute.dao.TeacherDao;

@Repository("teacherDao")
public class TeacherDaoImpl implements TeacherDao {
	Logger logger = Logger.getLogger(SubjectDaoImpl.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<TeacherBean> getAllTeacher() {
		return jdbcTemplate.query(SQLConstanats.TEACHER_DETAIL,
				new ResultSetExtractor<List<TeacherBean>>() {

					public List<TeacherBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<TeacherBean> techList = new ArrayList<TeacherBean>();
						while (rs.next()) {

							TeacherBean teacher = new TeacherBean();
							teacher.setId(rs.getInt("id"));
							teacher.setName(rs.getString("name"));
							techList.add(teacher);
						}
						return techList;
					}
				});
	}

	public TeacherBean getTeacherDetailById(String id) {
		String teacherDetails = "select id,name,address from teacher_details where emailid='"
				+ id + "'";
		return jdbcTemplate.query(teacherDetails,
				new ResultSetExtractor<TeacherBean>() {

					public TeacherBean extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						TeacherBean teacherBean = new TeacherBean();
						while (rs.next()) {

							teacherBean.setName(rs.getString("name"));
							teacherBean.setAddress(rs.getString("address"));
						}
						return teacherBean;
					}
				});
	}

	public List<AssignTeacherToSubjectBean> getTeacherSubjectDetailsById(
			String id) {
		String assignSubjectQuery = "select sa.branch_id,sa.subject,sa.section,br.branch_code,s.subject_name,sc.section_name from subject_assignto_teacher sa inner join subject s inner join  "
				+ "section sc inner join teacher_details td inner join branch_details br "
				+ " on sa.subject = s.id and sa.section =sc.id  and sa.branch_id = br.id where td.emailid='"
				+ id + "'";
		return jdbcTemplate.query(assignSubjectQuery,
				new ResultSetExtractor<List<AssignTeacherToSubjectBean>>() {

					public List<AssignTeacherToSubjectBean> extractData(
							ResultSet rs) throws SQLException,
							DataAccessException {
						List<AssignTeacherToSubjectBean> techList = new ArrayList<AssignTeacherToSubjectBean>();
						while (rs.next()) {

							AssignTeacherToSubjectBean teacherBean = new AssignTeacherToSubjectBean();
							teacherBean.setSubject(rs.getString("subject_name")
									+ "(" + rs.getString("branch_code") + "-"
									+ rs.getString("section_name") + ")");
							teacherBean.setSection(rs.getString("branch_code")
									+ "#" + rs.getString("section"));
							techList.add(teacherBean);
						}
						return techList;
					}
				});
	}

	public List<AttendanceBean> getAllStudentInASection(String section) {
		String branchCode = "";
		String perticularSec = "";
		if (section != null) {
			String[] tokensVal = section.split("#");
			branchCode = tokensVal[0];
			// perticularSec = tokensVal[1];
		}
		String assignSubjectQuery = "SELECT id,name,registration_number FROM student_details where branch_code='"
				+ branchCode + "'";
		return jdbcTemplate.query(assignSubjectQuery,
				new ResultSetExtractor<List<AttendanceBean>>() {

					public List<AttendanceBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<AttendanceBean> attendanceList = new ArrayList<AttendanceBean>();
						while (rs.next()) {

							AttendanceBean attendanceBean = new AttendanceBean();
							attendanceBean.setId(rs.getInt("id"));
							attendanceBean.setName(rs.getString("name"));
							attendanceBean.setRollNo(rs
									.getString("registration_number"));
							attendanceList.add(attendanceBean);
						}
						return attendanceList;
					}
				});
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int createAttendance(final AttendanceBean attendaneBean) {
		final List<AttendanceBean> attendaneList = attendaneBean
				.getAttendanceList();
		String subject = attendaneBean.getSubject();
		final String attendDate = attendaneBean.getAttendanceDate();
		final String section = subject.substring(subject.indexOf("#") + 1);
		final String subCODE = subject.substring(0, subject.indexOf("#"));
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		final Timestamp timeStamp = new java.sql.Timestamp(new Date().getTime());
		final String period = attendaneBean.getPeriod();
		String sql = "INSERT INTO lastattendance(branch_id,section,lastAttendance_date) VALUES(?,?,?);";
		jdbcTemplate.update(sql, subCODE, section, attendDate);
		jdbcTemplate.batchUpdate(SQLConstanats.INSERT_ATTENDANCE_QUERY,
				new BatchPreparedStatementSetter() {

					public void setValues(PreparedStatement ps, int i)
							throws SQLException {
						AttendanceBean attendance = attendaneList.get(i);
						ps.setString(1, subCODE);
						ps.setString(2, section);
						ps.setString(3, attendance.getStudent());
						ps.setString(4, attendDate);
						if (!attendance.isAttendance()) {
							ps.setString(5, "N");
							// createNotification(attendance.getStudent(),attendDate);
						} else {
							ps.setString(5, "Y");
						}
						if (!attendance.isLate()) {
							ps.setString(6, "N");
						} else {
							ps.setString(6, "Y");
						}
						ps.setString(7, attendance.getRemark());
						ps.setString(8, period);
						ps.setTimestamp(9, timeStamp);
					}

					public int getBatchSize() {
						return attendaneList.size();
					}
				});

		return 1;
	}

	private void createNotification(String studentId, String attendancedate) {
		// condition need to be check before data insert into nofication table
		jdbcTemplate.update(SQLConstanats.INSERT_NOTIFICATION_QUERY, studentId,
				attendancedate, "LL Not Submitted");
	}

	public List<AttendanceBean> getAbsentList() {
		return jdbcTemplate.query(SQLConstanats.ABSENT_DETAILS,
				new ResultSetExtractor<List<AttendanceBean>>() {

					public List<AttendanceBean> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<AttendanceBean> attendanceList = new ArrayList<AttendanceBean>();
						while (rs.next()) {

							AttendanceBean attendanceBean = new AttendanceBean();
							attendanceBean.setStudent(rs.getString("name"));
							attendanceBean.setStatus(rs.getString("status"));
							attendanceBean.setAttendanceDate(rs
									.getString("notification_date"));
							attendanceBean.setId(rs.getInt("attendance_id"));
							attendanceList.add(attendanceBean);
						}
						return attendanceList;
					}
				});
	}

	public List<Event> getEventList() {

		return jdbcTemplate.query(SQLConstanats.EVENT_DETAILS,
				new ResultSetExtractor<List<Event>>() {

					public List<Event> extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						List<Event> eventList = new ArrayList<Event>();
						while (rs.next()) {

							Event event = new Event();
							event.setEventId(rs.getInt("ID"));
							event.setEventName(rs.getString("EVENT_NAME"));
							eventList.add(event);
						}
						return eventList;
					}
				});
	}

	public String saveCurriculum(Curriculum curriculum, String createdBy) {
		String Teachers = "";
		String getEventIdFromSeq = SQLConstanats.GET_EVENT_SEQUENCE_ID;
		SqlRowSet rs = jdbcTemplate.queryForRowSet(getEventIdFromSeq);
		String eventId = "";
		while (rs.next()) {
			eventId = rs.getString("ID");
		}
		String finalEventId = eventId;
		System.out.println("event id " + finalEventId);

		if (null != curriculum.getTeachersList()
				&& curriculum.getTeachersList().size() > 0) {
			final ArrayList<String> teacherList = curriculum.getTeachersList();
			String EVENT_TEACHER = SQLConstanats.QUERY_TEACHER_IN_EVENT;
			/*
			 * jdbcTemplate.batchUpdate(SQLConstanats.QUERY_TEACHER_IN_EVENT,
			 * new BatchPreparedStatementSetter() {
			 * 
			 * public void setValues(PreparedStatement ps, int i) throws
			 * SQLException {
			 * 
			 * String id = teacherList.get(i); ps.setString(1, finalEventId);
			 * ps.setString(2, id); } public int getBatchSize() { return
			 * teacherList.size(); } });
			 */
		}
		// now insert event details from the map of input
		if (null != curriculum.getEventList()
				&& curriculum.getEventList().size() > 0) {
			Map<String, Object> eventMap = curriculum.getEventList();
			for (Entry<String, Object> entry : eventMap.entrySet()) {
				List<String> listString = (List<String>) entry.getValue();
				String date = "";
				String item = "";
				String quantity = "";
				String estimatedPrice = "";
				String actualPrice = "";
				String comment = "";
				// String date = "";

				if (null != listString && listString.size() > 0) {
					for (int i = 0; i < listString.size(); i++) {
						date = listString.get(i);
						item = listString.get(i + 1);
						quantity = listString.get(i + 2);
						estimatedPrice = listString.get(i + 3);
						actualPrice = listString.get(i + 4);
						// comment = listString.get(i+5);
					}
					jdbcTemplate.update(
							SQLConstanats.QUERY_TO_INSERT_EVENT_DET,
							finalEventId, date, item, quantity, estimatedPrice,
							actualPrice, comment);
				}

			}
		}

		/*
		 * jdbcTemplate.update(SQLConstanats.QUERY_SAVE_CURRICULUM,
		 * curriculum.getEventName(), createdBy,
		 * Teachers,curriculum.getTotalEstimatedPrice
		 * (),curriculum.getTotalActualPrice());
		 */

		// finally update the event sequence
		jdbcTemplate.update(SQLConstanats.QUERY_TO_UPDATE_SEQ);
		System.out.println("====>done ");
		return "success";
	}

	public List<Event> getAllEvent(String user) {

		List<Event> eventList = jdbcTemplate.query(
				SQLConstanats.QUERY_GET_ALL_EVENT, new Object[] { user },
				new RowMapper<Event>() {

					public Event mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Event event = new Event();
						event.setEventId(rs.getInt("id"));
						event.setEventName(rs.getString("EVENT_NAME"));
						return event;
					}
				});
		return eventList;
	}

	public List<Event> getEventDetails(String user) {
		List<Event> eventList = jdbcTemplate.query(
				SQLConstanats.QUERY_GET_EVENT_DETAILS, new Object[] { user },
				new RowMapper<Event>() {

					public Event mapRow(ResultSet rs, int arg1)
							throws SQLException {
						Event event = new Event();
						event.setCreatedDate(rs.getString("CREATED_DATE"));
						event.setItem(rs.getString("ITEM"));
						event.setQty(rs.getString("QUANTITY"));
						event.setEstmatedPrice(rs.getString("ESTIMATED_PRICE"));
						event.setActPrice(rs.getString("ACTUAL_PRICE"));
						event.setComment(rs.getString("COMMENT"));
						return event;
					}
				});
		return eventList;
	}
}
