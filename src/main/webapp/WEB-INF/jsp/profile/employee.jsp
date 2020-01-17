<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>Profile</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <div class="card">
        <div class="card-header text-center">
            <h3>${employee.firstName}&nbsp${employee.lastName}</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-4 offset-1">
                    <i class="fas fa-envelope"></i> Email
                </div>
                <div class="col-6">
                    ${employee.email}
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../includes/footer.jsp" %>

</div>
</body>
</html>
