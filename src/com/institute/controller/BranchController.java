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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.institute.bean.BranchBean;
import com.institute.bean.CollegeBean;
import com.institute.bean.Message;
import com.institute.service.BranchService;
import com.institute.service.RegisterCollegeService;

@Controller
public class BranchController {
	Logger logger = Logger.getLogger(BranchController.class);
	@Autowired
	private BranchService branchService;
	@Autowired
	private RegisterCollegeService registerClgService;

	@RequestMapping(value = "/getAllBranches", method = RequestMethod.GET)
	public @ResponseBody String getallPrincipals(
			@RequestParam("collegeId") String collegeId) throws Exception,
			JsonMappingException, IOException {
		logger.info("========== Branch Controller =========== collegeId::m"
				+ collegeId);
		System.out.println("Coming to Branch controller" + collegeId);
		ObjectMapper mapper = new ObjectMapper();
		List<BranchBean> branchlList = branchService.getAllBranch(collegeId);
		return mapper.writeValueAsString(branchlList);
	}

	@RequestMapping(value = "/createBranch", method = RequestMethod.GET)
	public String instituteRegistration(Model model, Principal principal,
			HttpServletRequest request) {
		model.addAttribute("user", HomeController.getPrincipal());
		List<CollegeBean> clgList = registerClgService.listOfColleges();

		model.addAttribute("clgList", clgList);

		return "branchRegd";
	}

	@RequestMapping(value = "/addBranch", method = RequestMethod.POST)
	public ResponseEntity<Message> addBranch(
			@RequestBody BranchBean branchbean, Model model) {
		Message msg = new Message();
		String message = "";

		try {
			branchService.ceateBranch(branchbean);
			System.out.println("coming to subject controller >>");
			message = "Branch Created Sucesssfully !!";
			msg.setMessage(message);
			return new ResponseEntity<Message>(msg, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			message = "Error in Branch Creation,Please contact System admin !!";
			msg.setMessage(message);
			return new ResponseEntity(msg, HttpStatus.NOT_FOUND);
		}
	}

}
