<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<div class="container">
		<a class="navbar-brand" href="<c:url value="/"/>">AirCompany</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="nav navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/search"/>">Search</a></li>

				<sec:authorize access="hasAuthority('admin')">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/aeroplanes"/>">Aeroplanes</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/flights"/>">Flights</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/new-flight"/>">New Flight</a></li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/profile"/>">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/logout"/>">Logout</a>
					</li>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/login"/>">Login</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
	
	
</nav>