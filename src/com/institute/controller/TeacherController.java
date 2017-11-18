package com.institute.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.AttendanceBean;
import com.institute.bean.CollegeBean;
import com.institute.bean.Curriculum;
import com.institute.bean.Message;
import com.institute.bean.Subject;
import com.institute.bean.TeacherBean;
import com.institute.service.RegisterCollegeService;
import com.institute.service.TeacherService;

@Controller
public class TeacherController {
	Logger logger = Logger.getLogger(TeacherController.class);
	@Autowired
	private RegisterCollegeService registerClgService;
	@Autowired
	private TeacherService teacherService;

	private String message = "";

	@RequestMapping(value = "/getAllTeachers", method = RequestMethod.GET)
	public @ResponseBody String getAllTeachers(Model model,
			Principal principal, HttpServletRequest request) throws Exception,
			JsonMappingException, IOException {

		ObjectMapper mapper = new ObjectMapper();
		List<TeacherBean> techerList = teacherService.getAllTeacher();
		return mapper.writeValueAsString(techerList);
	}

	@RequestMapping(value = "/teacherRegd", method = RequestMethod.GET)
	public String teacherRegd(Model model, Principal principal,
			HttpServletRequest request) {
		System.out.println("inside Teacher controller");
		model.addAttribute("user", HomeController.getPrincipal());

		return "teacherRegd";
	}
	
	@RequestMapping(value = "/weeklyPlanner", method = RequestMethod.GET)
	public String techWeeklyPlanner(Model model, Principal principal,
			HttpServletRequest request) {
		System.out.println("inside Teacher controller");
		model.addAttribute("user", HomeController.getPrincipal());

		return "techWeeklyPlanner";
	}

	@RequestMapping(value = "/viewWeeklyPlanner", method = RequestMethod.GET)
	public String viewWeeklyPlanner(Model model, Principal principal,
			HttpServletRequest request) {
		System.out.println("inside Teacher controller");
		model.addAttribute("user", HomeController.getPrincipal());

		return "techViewWeeklyPlanner";
	}

	@RequestMapping(value = "/classTimeTable", method = RequestMethod.GET)
	public String classTimeTable(Model model, Principal principal,
			HttpServletRequest request) {
		System.out.println("inside Teacher controller");
		model.addAttribute("user", HomeController.getPrincipal());

		return "techTimeTable";
	}

	@RequestMapping(value = "/attendance", method = RequestMethod.GET)
	public String attendance(Model model, Principal principal) {
		System.out.println("inside Teacher controller");
		model.addAttribute("user", HomeController.getPrincipal());
		System.out.println(" username >> " + HomeController.getPrincipal());
		return "attendance";
	}

	@RequestMapping(value = "/registerTeacherWithSubject", method = RequestMethod.GET)
	public String registerTeacherWithSubject(Model model) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<CollegeBean> clgList = registerClgService.listOfColleges();
		model.addAttribute("clgList", clgList);
		return "registerTeacherWithSubject";
	}

	@RequestMapping(value = "/registerLibrarian", method = RequestMethod.GET)
	public String registerLibrarian(Model model) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<CollegeBean> clgList = registerClgService.listOfColleges();
		model.addAttribute("clgList", clgList);
		return "registerLibrarian";
	}

	@RequestMapping(value = "/getAllSecSubForTech", method = RequestMethod.GET)
	public @ResponseBody String getAllSecSubForTech(Model model,
			Principal principal, HttpServletRequest request) throws Exception,
			JsonMappingException, IOException {
		String id = HomeController.getPrincipal();
		System.out.println("use id >>>>>>>>>..." + id);
		ObjectMapper mapper = new ObjectMapper();
		List<AssignTeacherToSubjectBean> techerList = teacherService
				.getTeacherSubjectDetailsById(id);
		return mapper.writeValueAsString(techerList);
	}

	@RequestMapping(value = "/attendanceStudent", method = RequestMethod.GET)
	public @ResponseBody String attendanceStudent(Model model,
			Principal principal, HttpServletRequest request) throws Exception,
			JsonMappingException, IOException {
		String section = request.getParameter("section");
		ObjectMapper mapper = new ObjectMapper();
		List<AttendanceBean> studentList = teacherService
				.getAllStudentInASection(section);
		return mapper.writeValueAsString(studentList);
	}

	@RequestMapping(value = "/teacherDetails", method = RequestMethod.GET)
	public @ResponseBody String teacherDetails(Model model,
			Principal principal, HttpServletRequest request) throws Exception,
			JsonMappingException, IOException {

		ObjectMapper mapper = new ObjectMapper();
		TeacherBean teacherBean = teacherService
				.getTeacherDetailById(HomeController.getPrincipal());
		return mapper.writeValueAsString(teacherBean);
	}

	@RequestMapping(value = "/" +"" +"", method = RequestMethod.POST)
	public ResponseEntity<Message> attendance(
			@RequestBody AttendanceBean attendace,/*
												 * @RequestParam("attendanceList[]"
												 * ) String[] names, //replace
												 * names with names[]
												 * 
												 * @RequestParam("attendanceDate"
												 * ) String globalClassId,
												 */
			Model model) {
		Message msg = new Message();
		int count = 0;

		System.out.println("Attend list "
				+ attendace.getAttendanceList().size());
		System.out
				.println("attendance date >>" + attendace.getAttendanceDate());
		System.out.println("attendance Perid >>" + attendace.getPeriod());
		// System.out.println("attendance Student >>"+attendace.getStudent());

		// model.addAttribute("user", HomeController.getPrincipal());
		try {
			teacherService.createAttendance(attendace);
			System.out.println("coming to attendance controller >>"
					+ attendace.getAttendanceDate());
			message = "Attendance updated Sucesssfully !!";
			msg.setMessage(message);
			return new ResponseEntity<Message>(msg, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			message = "Error in Subject Creation,Please contact System admin !!";
			msg.setMessage(message);
			return new ResponseEntity(msg, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.GET)
	public String updateProfile(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "updateProfile";
	}

	@RequestMapping(value = "/viewAttendance", method = RequestMethod.GET)
	public String viewAttendance(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		model.addAttribute("leaveApplicationList", teacherService.getAbsentList());
		return "viewAttendance";
	}

	@RequestMapping(value = "/createSelfAttendance", method = RequestMethod.GET)
	public String selfAttendance(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "selfAttendance";
	}

	@RequestMapping(value = "/viewSelfAttendance", method = RequestMethod.GET)
	public String viewSelfAttendance(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "viewSelfAttendance";
	}
	@RequestMapping(value = "/curriculum", method = RequestMethod.GET)
	public String curriculum(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		model.addAttribute("eventList", teacherService.getEventList());
		model.addAttribute("teacherList", teacherService.getAllTeacher());
		return "curriculum";
	}
	
	@RequestMapping(value = "/curriculum/save", method = RequestMethod.POST)
	public String saveCurriculum(ModelMap model, @RequestBody Curriculum curriculum, HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		System.out.println("coming to curriculumSave >>" + curriculum.getEventList());
		teacherService.saveCurriculum(curriculum, HomeController.getPrincipal());
		return "curriculum";
	}
	@RequestMapping(value = "/viewUpdCurriculum", method = RequestMethod.GET)
	public String viewUpdCurriculum(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		model.addAttribute("eventList", teacherService.getAllEvent(HomeController.getPrincipal()));
		return "viewUpdCurriculum";
	}
	
	@RequestMapping(value = "/getEventDet")
	public @ResponseBody String getEventDetails(Model model, HttpServletRequest request) throws Exception, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(teacherService.getEventDetails(request.getParameter("eventId")));
	}

}
