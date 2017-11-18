package com.institute.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.institute.bean.AttendanceBean;
import com.institute.bean.StudentBean;
import com.institute.service.GuardianService;

@Controller
public class HomeController {
	@Autowired
	private GuardianService guardianService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String setHome() {
		System.out.println("set home page>>>>>>>>...");
		return "home";
	}

	@RequestMapping(value = { "/", "/user" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "user";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "admin";
	}

	@RequestMapping(value = "/insti", method = RequestMethod.GET)
	public String instiPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "insti";
	}

	@RequestMapping(value = "/college", method = RequestMethod.GET)
	public String collegePage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "college";
	}

	@RequestMapping(value = "/prin", method = RequestMethod.GET)
	public String principalPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "prin";
	}

	/*
	 * @RequestMapping(value = "/stud", method = RequestMethod.GET) public
	 * String studPage(ModelMap model) { model.addAttribute("user",
	 * getPrincipal()); return "stud"; }
	 */

	@RequestMapping(value = "/teacher", method = RequestMethod.GET)
	public String teacherPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "teacher";
	}

	@RequestMapping(value = "/gardian", method = RequestMethod.GET)
	public String gardianPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		List<StudentBean> studList = guardianService
				.getAllStuentForGard(getPrincipal());
		model.addAttribute("studList", studList);

		List<AttendanceBean> leaveList = guardianService
				.getAllLeaveList(getPrincipal());
		model.addAttribute("leaveList", leaveList);
		int count =0;
		count = leaveList.size();
		if(count>0)
		{
			model.addAttribute("count", count);
		}
		return "gardian";
	}

	@RequestMapping(value = "/librarian", method = RequestMethod.GET)
	public String librarianPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "librian";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request,
			HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	public static String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		System.out.println("userName" + userName);
		return userName;
	}

}