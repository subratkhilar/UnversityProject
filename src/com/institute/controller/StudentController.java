package com.institute.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.institute.bean.CollegeBean;
import com.institute.bean.PrincipalBean;
import com.institute.bean.StudentBean;
import com.institute.service.RegisterCollegeService;
import com.institute.service.RegisterInstituteService;
import com.institute.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private RegisterInstituteService registerInstituteService;
	@Autowired
	private RegisterCollegeService registerClgService;
	@Autowired
	private StudentService studentService;

	@RequestMapping(value = "/studentReg", method = RequestMethod.GET)
	public String setStudPage(Model model) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<CollegeBean> clgList = registerClgService.listOfColleges();

		model.addAttribute("clgList", clgList);
		return "studentRegd";
	}

	@RequestMapping(value = "/studentRegistration/Save", method = RequestMethod.POST)
	public String savePrincipalRegistration(Model model, Principal principal,
			HttpServletRequest request, @RequestBody StudentBean studentBean) {
		System.out.println("coming to student Registration " + studentBean);
		studentService.createStudent(studentBean);

		// model.addAttribute("instituteDet",registerInstituteService.getAllInstitute());
		return "studentRegd";
	}

	@RequestMapping(value = "/getAllStudents", method = RequestMethod.GET)
	public @ResponseBody String getallPrincipals(Model model, Principal principal,HttpServletRequest request) throws Exception, JsonMappingException, IOException {
		String collegeId= request.getParameter("collegeId");
		System.out.println("to call Student details"+collegeId);
		
		ObjectMapper mapper = new ObjectMapper();
		List<StudentBean> studentList = studentService.getAllStudent(collegeId);
		return mapper.writeValueAsString(studentList);
	}
}
