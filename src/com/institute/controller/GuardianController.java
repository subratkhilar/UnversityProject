package com.institute.controller;

import java.io.IOException;
import java.util.List;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.institute.bean.AttendanceBean;
import com.institute.bean.BranchBean;
import com.institute.service.GuardianService;

@Controller
public class GuardianController {
	@Autowired
	private GuardianService guardianService;
	
	@RequestMapping(value = "/guardianNotification", method = RequestMethod.GET)
	public  String getAllguardianNotification(Model model) throws Exception,
			JsonMappingException, IOException {
		Logger logger = Logger.getLogger(GuardianController.class);
		logger.info("========== Branch Controller =========== collegeId::m");
		System.out.println("Coming to GuardianController controller" );
		String userId = HomeController.getPrincipal();//it will change to generic
		model.addAttribute("user", userId);
		guardianService.getAllguardianNotification(userId);
		
		List<AttendanceBean> guardianNotification = guardianService.getAllguardianNotification(userId);
		System.out.println("guardian user id "+userId+" "+guardianNotification.get(0).getNotificationMsg());
		model.addAttribute("guardianNotification", guardianNotification);
		/*ObjectMapper mapper = new ObjectMapper();
		List<BranchBean> branchlList = branchService.getAllBranch(collegeId);*/
		return "guardianNotification";
	}
	@RequestMapping(value = "/showNotificationData", method = RequestMethod.GET)
	public  String showNotificationData(Model model) throws Exception,
			JsonMappingException, IOException {
		Logger logger = Logger.getLogger(GuardianController.class);
		logger.info("========== Branch Controller =========== collegeId::m");
		System.out.println("Coming to GuardianController controller" );
		String userId = HomeController.getPrincipal();//it will change to generic
		model.addAttribute("user", userId);
		guardianService.getAllguardianNotification(userId);
		
		List<AttendanceBean> guardianNotification = guardianService.getAllguardianNotification(userId);
		System.out.println("guardian user id "+userId+" "+guardianNotification.get(0).getNotificationMsg());
		model.addAttribute("guardianNotification", guardianNotification);
		/*ObjectMapper mapper = new ObjectMapper();
		List<BranchBean> branchlList = branchService.getAllBranch(collegeId);*/
		return "showNotificationData";
	}
	
	
	

}
