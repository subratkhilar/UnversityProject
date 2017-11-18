package com.institute.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	protected void handle(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication);

		if (response.isCommitted()) {
			System.out.println("Can't redirect");
			return;
		}

		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	/*
	 * This method extracts the roles of currently logged-in user and returns
	 * appropriate URL according to his/her role.
	 */
	protected String determineTargetUrl(Authentication authentication) {
		String url = "";

		Collection<? extends GrantedAuthority> authorities = authentication
				.getAuthorities();

		List<String> roles = new ArrayList<String>();

		for (GrantedAuthority a : authorities) {
			roles.add(a.getAuthority());
		}

		if (isInstitute(roles)) {
			url = "/insti";
		} else if (isAdmin(roles)) {
			url = "/admin";
		} else if (isCollege(roles)) {
			url = "/college";
		} else if (isPrincipal(roles)) {
			url = "/prin";
		} else if (isStudent(roles)) {
			url = "/stud";
		} else if (isTeacher(roles)) {
			url = "/teacher";
		} else if (isGardian(roles)) {
			url = "/gardian";
		}else if (isLibrarian(roles)) {
			url = "/librarian";
		} else if (isUser(roles)) {
			url = "/user";
		} else {
			url = "/accessDenied";
		}

		return url;
	}

	private boolean isUser(List<String> roles) {
		if (roles.contains("ROLE_USER")) {
			return true;
		}
		return false;
	}

	private boolean isAdmin(List<String> roles) {
		if (roles.contains("ROLE_ADMIN")) {
			return true;
		}
		return false;
	}

	private boolean isCollege(List<String> roles) {
		if (roles.contains("ROLE_COLLEGE")) {
			return true;
		}
		return false;
	}

	private boolean isInstitute(List<String> roles) {
		if (roles.contains("ROLE_INSTITUTE")) {
			return true;
		}
		return false;
	}

	private boolean isPrincipal(List<String> roles) {
		if (roles.contains("ROLE_PRINCIPAL")) {
			return true;
		}
		return false;
	}

	private boolean isStudent(List<String> roles) {
		if (roles.contains("ROLE_STUDENT")) {
			return true;
		}
		return false;
	}

	private boolean isTeacher(List<String> roles) {
		if (roles.contains("ROLE_TEACHER")) {
			return true;
		}
		return false;
	}

	private boolean isGardian(List<String> roles) {
		if (roles.contains("ROLE_GARDIAN")) {
			return true;
		}
		return false;
	}

	private boolean isLibrarian(List<String> roles) {
		if (roles.contains("ROLE_LIBRARIAN")) {
			return true;
		}
		return false;
	}
	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

}