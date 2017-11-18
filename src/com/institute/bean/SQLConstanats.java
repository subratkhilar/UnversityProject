package com.institute.bean;

public interface SQLConstanats {

	public static String ID = "ID";
	public static String institute_name = "institute_name";
	public static String registerInstituteQuery = "insert into institute_details (institute_name, address, city,"
			+ " pin, state, country, emailId, designation, phone_number, registration_number)"
			+ " values(?,?,?,?,?,?,?,?,?,?)";

	public static String getAllInstitute = "select * from institute_details";
	public static String getInstituteByName = "select * from institute_details where institute_name = ?";

	public static String registerCollegeQuery = "insert into college_details (college_name, institute_name, address, city,"
			+ " pin, state, country, emailId, designation, phone_number, registration_number)"
			+ " values(?,?,?,?,?,?,?,?,?,?,?)";

	public static String getAllCollges = "select * from college_details";

	public static String REGISTER_PRINCIPAL_QUERY = "insert into PRINCIPAL_DETAILS ( institute_id, college_id, email_id, principal_name, "
			+ " password, contact_Number, dob, gender) values(?,?,?,?,?,?,?,?)";

	public static String PRINCIPAL_DETAILS = " SELECT principal.ID, principal.principal_name, clg.college_name FROM PRINCIPAL_DETAILS principal, "
			+ "college_details clg WHERE principal.college_id= clg.id ";

	public static String BRANCH_DETAIL = " SELECT BRANCH_NAME,BRANCH_CODE FROM  BRANCH_DETAILS";

	public static String REGISTER_STUDENT_QUERY = "insert into student_details (college_id, branch_code, email_id, name,password, contact_Number, dob, gender,father_name,mother_name,highest_quaification,address) values(?,?,?,?,?,?,?,?,?,?,?,?)";

	public static String STUDENT_DETAILS = "SELECT clg.college_name,stu.name,br.branch_name  from student_details stu ,college_details clg ,branch_details br where stu.college_id = clg.id and stu.branch_code= br.branch_code";
	public static String USER_REGD_QUERY = "INSERT INTO users(username,password,active)  VALUES(?,?,'YES')";
	public static String USER_AUTHORITY_QUERY = "INSERT INTO user_roles(user_id,authority)VALUES(?,?)";
	
	public static String GUARDIAN_NOTIFICATION_QUERY = "SELECT  det.name,atte.attendance_date FROM attendance atte, student_details det " +
														" WHERE created_date = (SELECT DISTINCT created_date FROM attendance ORDER BY " +
														" created_date DESC LIMIT 1) AND det.id=atte.student_id  AND atte.isPresent='N'";
	public static String GET_EVENT_SEQUENCE_ID = "SELECT * FROM EVENT_SEQ";
	public static String QUERY_TEACHER_IN_EVENT = "insert into event_teacher values (?,?)";

	String TEACHER_DETAIL = "select * from teacher_details";
	String INSERT_ATTENDANCE_QUERY = "INSERT INTO attendance(branch,section,student_id,attendance_date,IsPresent,IsLate,Remark,attendance_period,created_date) VALUES(?,?,?,?,?,?,?,?,?)";
	String INSERT_NOTIFICATION_QUERY="INSERT INTO notification(student_id,notification_date,status) VALUES(?,?,?)";
	String ABSENT_DETAILS ="select (at.id)attendance_id,s.name,n.status,n.notification_date from student_details s inner join  notification n inner join attendance at "
			+ " on s.id = n.student_id  and n.student_id = at.student_id and n.notification_date = at.attendance_date "
			+ "where approve_status='N' and at.isPresent='N'";
	
	String EVENT_DETAILS = "select * from EVENT_REGISTRATION";
	
	String QUERY_SAVE_CURRICULUM = "INSERT INTO curriculum (EVENT_NAME, CREATED_BY, TEACHERS_ID, ESTIMATED_PRICE, ACTUAL_PRICE) VALUES (?,?,?,?,?)";
	
	String QUERY_GET_CURRICULUM = "SELECT * FROM CURRICULUM";
	
	String QUERY_GET_ALL_EVENT = "SELECT id, event_name FROM curriculum WHERE created_by=?";
	public static String QUERY_TO_UPDATE_SEQ = "UPDATE EVENT_SEQ SET id=LAST_INSERT_ID(id+1)";
	public static String QUERY_TO_INSERT_EVENT_DET = "INSERT INTO event_details(EVENT_ID, DATE, ITEM, QUANTITY," +
			"ESTIMATED_PRICE, ACTUAL_PRICE, COMMENT) VALUES(?,?,?,?,?,?,?)";
	
	String QUERY_GET_EVENT_DETAILS = "SELECT * FROM event_details WHERE event_id=?";
	//public static String QUERY_TO_INSERT_EVENT_DET = "INSERT INTO event_details(EVENT_ID, CREATED_DATE) VALUES(?,?)";

}
