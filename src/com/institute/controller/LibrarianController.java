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

import org.springframework.web.bind.annotation.ResponseBody;

import com.institute.bean.LibrarianBean;
import com.institute.bean.Message;
import com.institute.bean.Subject;
import com.institute.service.LibrarianService;

@Controller
public class LibrarianController {
	Logger logger = Logger.getLogger(LibrarianController.class);
	@Autowired
	private LibrarianService librarianService;
	private String message = "";

	@RequestMapping(value = "/addLibrarian1", method = RequestMethod.POST)
	public ResponseEntity<Message> addLibrarian(
			@RequestBody LibrarianBean libBean) {
		Message msg = new Message();
		int count = 0;
		try {
			count = librarianService.createLibrarian(libBean);
			message = "Subject Created Sucesssfully !!";
			msg.setMessage(message);
			return new ResponseEntity<Message>(msg, HttpStatus.OK);
		} catch (Exception e) {
			message = "Error in Librarian Creation,Please contact System admin !!";
			msg.setMessage(message);
			return new ResponseEntity(msg, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/getAllLibrarians", method = RequestMethod.GET)
	public @ResponseBody String getAllLibrarians(Model model,
			Principal principal, HttpServletRequest request) throws Exception,
			JsonMappingException, IOException {
		String collegeId = request.getParameter("collegeId");

		System.out.println("to call Subject details" + collegeId);
		if (collegeId == null) {
			collegeId = "";
		}

		ObjectMapper mapper = new ObjectMapper();
		List<LibrarianBean> libList = librarianService
				.getAllLibrarian(collegeId);
		System.out.println("libList size :: " + libList.size());
		return mapper.writeValueAsString(libList);
	}

	@RequestMapping(value = "/addBooks", method = RequestMethod.GET)
	public String addBooks(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "addBooks";
	}
	@RequestMapping(value = "/updateBook", method = RequestMethod.GET)
	public String updateBook(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "updateBook";
	}


	@RequestMapping(value = "/viewAddedBooks", method = RequestMethod.GET)
	public String viewAddedBooks(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "viewAddedBooks";
	}
	
	@RequestMapping(value = "/bookAssignment", method = RequestMethod.GET)
	public String bookAssignment(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "bookAssignment";
	}
	
	@RequestMapping(value = "/updateBookAssignment", method = RequestMethod.GET)
	public String updateBookAssignment(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "updateBookAssignment";
	}
	
	@RequestMapping(value = "/libraryMonthlyReport", method = RequestMethod.GET)
	public String libraryMonthlyReport(ModelMap model) {
		model.addAttribute("user", HomeController.getPrincipal());
		return "libraryMonthlyReport";
	}
	
	
}
