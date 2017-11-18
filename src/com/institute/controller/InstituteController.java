package com.institute.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.institute.bean.RegisterInstituteBean;
import com.institute.service.RegisterInstituteService;

@Controller
public class InstituteController {
	@Autowired
	private RegisterInstituteService registerInstituteService;
	
	@RequestMapping(value = "/instituteRegistration", method = RequestMethod.GET)
	public String instituteRegistration(Model model, Principal principal,
			HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		System.out.println("inside here");
		model.addAttribute("instituteDet",registerInstituteService.getAllInstitute());
		return "instituteRegistration";
	}
	@RequestMapping(value = "/allRegistration", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")
	public @ResponseBody String getAllRegistrationList() throws JsonGenerationException, JsonMappingException, IOException {
		System.out.println("inside getAllRegistrationList here");
		/*model.addAttribute("instituteDet",registerInstituteService.getAllInstitute());
		return "instituteRegistration";*/
		ObjectMapper mapper = new ObjectMapper();
		List<RegisterInstituteBean> instiList = registerInstituteService.listOfInstitute();
		return mapper.writeValueAsString(instiList);
	}
	
	@RequestMapping(value = "/getInstituteByName", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")
	public @ResponseBody String getInstituteByName(@RequestBody String instName) throws JsonGenerationException, JsonMappingException, IOException {
		System.out.println("inside getAllRegistrationList here");
		/*model.addAttribute("instituteDet",registerInstituteService.getAllInstitute());
		return "instituteRegistration";*/
		System.out.println("instName "+instName);
		ObjectMapper mapper = new ObjectMapper();
		List<RegisterInstituteBean> instiList = registerInstituteService.getInstituteByName(instName);
		return mapper.writeValueAsString(instiList);
	}
	
	
	@RequestMapping(value = "/instituteRegistration/save", method = RequestMethod.POST)
	public String saveInstituteRegistration(Model model, Principal principal,
			HttpServletRequest request, @RequestBody RegisterInstituteBean regInstMap) {
		System.out.println("inside institute registration");
		System.out.println("saveInstituteRegistration "+regInstMap.getInstName());
		registerInstituteService.saveRegisterInstitute(regInstMap);
		
		model.addAttribute("instituteDet",registerInstituteService.getAllInstitute());
		return "instituteRegistration";
	}

}
