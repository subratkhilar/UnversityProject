package com.institute.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.institute.bean.CollegeBean;
import com.institute.bean.LibrarianBean;
import com.institute.bean.Message;
import com.institute.bean.StudentBean;
import com.institute.bean.Subject;
import com.institute.service.LibrarianService;
import com.institute.service.RegisterCollegeService;
import com.institute.service.SubjectService;

@Controller
public class SubjectController {
	@Autowired
	private RegisterCollegeService registerClgService;
	@Autowired
	private SubjectService subjectService;
	private String message = "";

	@RequestMapping(value = "/createSubject", method = RequestMethod.GET)
	public String setSubjectPage(Model model) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<CollegeBean> clgList = registerClgService.listOfColleges();

		model.addAttribute("clgList", clgList);
		return "subject";
	}

	@RequestMapping(value = "/addSubject", method = RequestMethod.POST)
	public ResponseEntity<Message> addSubject(@RequestBody Subject subject,
			Model model) {
		Message msg = new Message();
		int count = 0;
		// model.addAttribute("user", HomeController.getPrincipal());
		try {
			subjectService.createSubject(subject);
			System.out.println("coming to subject controller >>");
			message = "Subject Created Sucesssfully !!";
			msg.setMessage(message);
			return new ResponseEntity<Message>(msg, HttpStatus.OK);
		} catch (Exception e) {
			message = "Error in Subject Creation,Please contact System admin !!";
			msg.setMessage(message);
			return new ResponseEntity(msg, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/getAllSubjects", method = RequestMethod.GET)
	public @ResponseBody String getAllSubjects(Model model,
			Principal principal, HttpServletRequest request) throws Exception,
			JsonMappingException, IOException {
		String collegeId = request.getParameter("collegeId");
		String branchId = request.getParameter("branchId");
		System.out.println("to call Subject details" + collegeId);
		if (collegeId == null) {
			collegeId = "";
		}
		if (branchId == null) {
			branchId = "";
		}
		ObjectMapper mapper = new ObjectMapper();
		List<Subject> subjectList = subjectService.getAllSubject(collegeId,
				branchId);
		return mapper.writeValueAsString(subjectList);
	}

	
}
