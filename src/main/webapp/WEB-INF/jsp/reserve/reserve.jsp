<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>List of aeroplanes</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <div>
        <h2 class="mb-3"><strong>Reserve your flight</strong></h2>

        <form:form modelAttribute="reservation" method="post">

        </form:form>
    </div>
</div>
</body>
</html>