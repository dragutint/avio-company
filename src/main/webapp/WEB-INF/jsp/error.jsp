<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="includes/head.jsp" %>
    <title>Error</title>
</head>
<body>
<%@ include file="includes/header.jsp" %>
<div class="container mt-3">
    <div class="jumbotron">
        <div class="h2">${exception.getMessage()}</div>
    </div>
</div>
</body>
</html>