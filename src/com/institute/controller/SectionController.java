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
import com.institute.bean.Message;
import com.institute.bean.Section;
import com.institute.bean.Subject;
import com.institute.service.RegisterCollegeService;
import com.institute.service.SectionService;

@Controller
public class SectionController {
	@Autowired
	private RegisterCollegeService registerClgService;
	@Autowired
	private SectionService sectionService;
	private String message = "";

	@RequestMapping(value = "/createSection", method = RequestMethod.GET)
	public String setSectionPage(Model model) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<CollegeBean> clgList = registerClgService.listOfColleges();
		model.addAttribute("clgList", clgList);
		return "section";
	}

	@RequestMapping(value = "/addSection", method = RequestMethod.POST)
	public ResponseEntity<Message> addSection(@RequestBody Section section) {
		System.out.println("Section >>> " + section.getAssociatedSection());
		Message msg = new Message();
		try {

			sectionService.createSection(section);
			message = "Section Created Sucesssfully !!";
			msg.setMessage(message);
			return new ResponseEntity<Message>(msg, HttpStatus.OK);

		} catch (Exception e) {
			message = "Error in Section Creation,Please contact System admin !!";
			msg.setMessage(message);
			return new ResponseEntity(msg, HttpStatus.FAILED_DEPENDENCY);
		}

	}

	@RequestMapping(value = "/getAllSections", method = RequestMethod.GET)
	public @ResponseBody String getAllSubjects(HttpServletRequest request)
			throws Exception, JsonMappingException, IOException {
		String collegeId = request.getParameter("collegeId");
		String branchId = request.getParameter("branchId");
		System.out.println("to call Section details" + collegeId);
		
		ObjectMapper mapper = new ObjectMapper();
		List<Section> sectionList = sectionService.getAllSetion(collegeId,branchId);
		return mapper.writeValueAsString(sectionList);
	}
}
