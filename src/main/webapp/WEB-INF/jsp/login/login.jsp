<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../includes/head.jsp"%>

<title>Login</title>

</head>
<body>

	<%@ include file="../includes/header.jsp"%>

	<div class="container pt-3">

		<div class="text-center">

			<h1>
				<i class="fa fa-book small-icons bk-color-brown"></i>Login
			</h1>
			<c:url var="loginUrl" value="/login" />

			<form:form method="POST" action="${loginUrl}">
				<c:if test="${param.error != null}">
					<div class="alert alert-danger">
						<p>Wrong username or password!</p>
					</div>
				</c:if>
				<c:if test="${param.logout != null}">
					<div class="alert alert-success">
						<p>Succesfully logged out</p>
					</div>
				</c:if>

				<label for="username">Username</label>
				<input type="text" name="username" class="form-control"
					placeholder="Username.." />
				<label for="password">Password</label>
				<input type="password" name="password" class="form-control"
					placeholder="Password..">
				<label for="submit"></label>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<br>
				<input type="submit" name="login" value="Login"
					class="btn btn-lg btn-default margintop10">
			</form:form>
		</div>
	</div>
</body>
</html>
