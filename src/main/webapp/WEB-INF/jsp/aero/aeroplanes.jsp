<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>List of aeroplanes</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron ">
    <div class="container">
        <h3>List of aeroplanes</h3>
    </div>
</div>
<div class="container mt-3">
    <ul class="list-group">
        <c:forEach items="${aeroplanes}" var="aeroplane">
            <li class="list-group-item">${aeroplane.id} ${aeroplane.name}</li>
        </c:forEach>
    </ul>
</div>
</body>
</html>
