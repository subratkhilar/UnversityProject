<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:choose>
	<c:when test="${!empty user}">
		<sec:authorize access="hasRole('ROLE_INSTITUTE') or hasRole('ROLE_ADMIN')">
			<c:import url="/WEB-INF/views/layouts/adminHeader.jsp"></c:import>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_COLLEGE')">
			<c:import url="/WEB-INF/views/layouts/collegeHeader.jsp"></c:import>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_TEACHER')">
			<c:import url="/WEB-INF/views/layouts/teacherHeader.jsp"></c:import>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_PRINCIPAL')">
			<c:import url="/WEB-INF/views/layouts/principalHeader.jsp"></c:import>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_LIBRARIAN')">
			<c:import url="/WEB-INF/views/layouts/librarianHeader.jsp"></c:import>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_GARDIAN')">
			<c:import url="/WEB-INF/views/layouts/gardianHeader.jsp"></c:import>
		</sec:authorize>
	</c:when>

	<c:otherwise>
		<c:import url="/WEB-INF/views/layouts/commonHeader.jsp"></c:import>
	</c:otherwise>
</c:choose>
