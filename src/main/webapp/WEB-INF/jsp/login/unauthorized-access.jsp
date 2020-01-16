<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"


<%@ include file="../includes/head.jsp"%>
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
	<%@ include file="../includes/footer.jsp" %>

</body>
</html>
