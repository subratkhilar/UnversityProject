package com.institute.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.institute.bean.AssignTeacherToSubjectBean;
import com.institute.bean.CollegeBean;
import com.institute.bean.Message;
import com.institute.bean.RegisterInstituteBean;
import com.institute.bean.TimeTableBean;
import com.institute.service.RegisterCollegeService;
import com.institute.service.RegisterInstituteService;

@Controller
public class CollegeController {

	@Autowired
	private RegisterInstituteService registerInstituteService;
	@Autowired
	private RegisterCollegeService registerClgService;
	private String message = "";

	@RequestMapping(value = "/collegeRegistration", method = RequestMethod.GET)
	public String instituteRegistration(Model model, Principal principal,
			HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<RegisterInstituteBean> instiList = registerInstituteService
				.listOfInstitute();
		System.out.println("instiList**** " + instiList.size());
		model.addAttribute("instiList", instiList);
		return "collegeRegistration";
	}

	@RequestMapping(value = "/allColleges", method = RequestMethod.GET)
	public @ResponseBody String getAllCollges(Model model, Principal principal,
			HttpServletRequest request) throws Exception, JsonMappingException,
			IOException {
		System.out.println("to call collge details");
		ObjectMapper mapper = new ObjectMapper();
		List<CollegeBean> clgList = registerClgService.listOfColleges();
		return mapper.writeValueAsString(clgList);
	}

	@RequestMapping(value = "/collegeRegistration/Save", method = RequestMethod.POST)
	public String saveCollegeRegistration(Model model, Principal principal,
			HttpServletRequest request, @RequestBody CollegeBean regClgMap) {
		System.out.println("collegeRegistration " + regClgMap + "***"
				+ regClgMap.getInstName());

		registerClgService.saveRegisterInstitute(regClgMap);

		// model.addAttribute("instituteDet",registerInstituteService.getAllInstitute());
		return "collegeRegistration";
	}

	@RequestMapping(value = "/assignSubjToTech", method = RequestMethod.POST)
	public ResponseEntity<Message> assignTeacherToSubject(
			@RequestBody AssignTeacherToSubjectBean assignBean) {

		Message msg = new Message();
		try {
			registerClgService.assignSubjectToTeach(assignBean);
			System.out.println("coming to college controller >>");
			message = "Subject is Sucessfully Assign to Teacher!!";
			msg.setMessage(message);
			return new ResponseEntity<Message>(msg, HttpStatus.OK);
		} catch (Exception e) {
			message = "Error in Subject Asignnation,Please contact System admin !!";
			msg.setMessage(message);
			return new ResponseEntity(msg, HttpStatus.NOT_FOUND);
		}

	}

	@RequestMapping(value = "/getSubjAssgnDetails", method = RequestMethod.GET)
	public @ResponseBody String getSubjectAssgnDetails(
			HttpServletRequest request) throws Exception, JsonMappingException,
			IOException {
		ObjectMapper mapper = new ObjectMapper();
		List<AssignTeacherToSubjectBean> assignList = registerClgService.getAssignSubjectLst();
		return mapper.writeValueAsString(assignList);
	}
	@RequestMapping(value = "/createTimeTable", method = RequestMethod.GET)
	public String setTimeTablePage(Model model) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<CollegeBean> clgList = registerClgService.listOfColleges();

		model.addAttribute("clgList", clgList);
		return "createTimeTable";
	}
	
	@RequestMapping(value = "/getTimeTablesDetails", method = RequestMethod.GET)
	public @ResponseBody String getTimeTablesDetails(Model model, Principal principal,
			HttpServletRequest request) throws Exception, JsonMappingException,
			IOException {
		System.out.println("to call collge details");
		String college ="";
		String section ="";
		ObjectMapper mapper = new ObjectMapper();
		List<TimeTableBean> timeTableList = registerClgService.getTimetableDetails(college, section);
		return mapper.writeValueAsString(timeTableList);
	}
}
