<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"/>">

<script src="<c:url value="/webjars/jquery/3.2.1/jquery.min.js"/>"></script>
<script
	src="<c:url value="/webjars/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"/>"></script>

<title>List of payments</title>

</head>
<body>

	<%@ include file="../includes/header.jsp"%>

	<div class="container pt-3">

		<div class="text-center">

			<h1>
				<i class="fa fa-book small-icons bk-color-brown"></i>Unauthorized acces
			</h1>
			<h4>Sorry, you are not authorized for this page. <a href="<c:url value="/" /> ">Go back</a></h4>
		</div>
	</div>
</body>
</html>
