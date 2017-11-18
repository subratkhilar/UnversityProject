package com.institute.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
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
import com.institute.bean.RegisterInstituteBean;
import com.institute.service.PrincipalService;
import com.institute.service.RegisterCollegeService;
import com.institute.service.RegisterInstituteService;
import com.institute.service.TeacherService;

@Controller
public class PrincipalController {
	
	@Autowired
	private RegisterInstituteService registerInstituteService;
	@Autowired
	private RegisterCollegeService registerClgService;
	@Autowired
	private PrincipalService principalService;
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value = "/principal", method = RequestMethod.GET)
	public String instituteRegistration(Model model, Principal principal,HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<RegisterInstituteBean> instiList = registerInstituteService.listOfInstitute();
		List<CollegeBean> clgList = registerClgService.listOfColleges();
		model.addAttribute("instiList", instiList);
		model.addAttribute("clgList", clgList);
		return "principalRegistration";
	}
	
	@RequestMapping(value = "/getPrincipalById", method = RequestMethod.GET)
	public @ResponseBody String getPrincipalById(Model model, Principal principal,HttpServletRequest request) throws Exception, JsonMappingException, IOException {
		String principalId = request.getParameter("principalId");
		int pid = 0;
		if(principalId!=null){
			pid = Integer.parseInt(principalId);
		}
		ObjectMapper mapper = new ObjectMapper();
		//List<PrincipalBean> principalList = new ArrayList<PrincipalBean>();
		PrincipalBean principalBean = principalService.getPrincipalById(pid);
		return mapper.writeValueAsString(principalBean);
	}
	
	@RequestMapping(value = "/allPrincipals", method = RequestMethod.GET)
	public @ResponseBody String getallPrincipals(Model model, Principal principal,HttpServletRequest request) throws Exception, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		List<PrincipalBean> principalList = principalService.listOfPrincipals();
		return mapper.writeValueAsString(principalList);
	}
	@RequestMapping(value = "/principalRegistration/Save", method = RequestMethod.POST)
	public String savePrincipalRegistration(Model model, Principal principal,
			HttpServletRequest request, @RequestBody PrincipalBean regPrincipalMap) {
		principalService.savePrincipal(regPrincipalMap);
		//model.addAttribute("instituteDet",registerInstituteService.getAllInstitute());
		return "collegeRegistration";
	}
	
	@RequestMapping(value = "/broadCastMessage")
	public String broadCastMessage(Model model, HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		model.addAttribute("teacherDet",teacherService.getAllTeacher());
		return "broadCastMessage";
	}
	
	@RequestMapping(value = "/assetManagement")
	public String assetManagement(Model model, HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		model.addAttribute("teacherDet",teacherService.getAllTeacher());
		return "assetManagement";
	}
	
	@RequestMapping(value = "/createVendor")
	public String createVendor(Model model, HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		model.addAttribute("teacherDet",teacherService.getAllTeacher());
		return "createVendor";
	}
	@RequestMapping(value = "/mapVendorInventory")
	public String mapVendorInventory(Model model, HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		model.addAttribute("teacherDet",teacherService.getAllTeacher());
		return "mapVendorInventory";
	}
	
	@RequestMapping(value = "/schoolEvent")
	public String schoolEvent(Model model, HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "schoolEvent";
	}
	
	@RequestMapping(value = "/viewApproveSchoolEvent")
	public String viewApproveSchoolEvent(Model model, HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "viewApproveSchoolEvent";
	}
	
	@RequestMapping(value = "/getSchoolEventDet")
	public @ResponseBody String getSchoolEventDet(Model model, HttpServletRequest request) throws Exception, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("schoolEventDet", principalService.getSchoolEventDet());
		return mapper.writeValueAsString(principalService.getSchoolEventDet());
	}
	
	

}
