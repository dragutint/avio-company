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
            <h3>${client.firstName}&nbsp${client.lastName}</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-4 offset-1">
                    Passport num
                </div>
                <div class="col-6">
                    ${client.passportNum}
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    Date of birth
                </div>
                <div class="col-6">
                    ${client.dateOfBirth}
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    Email
                </div>
                <div class="col-6">
                    ${client.email}
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    Contact
                </div>
                <div class="col-6">
                    ${client.contact}
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    Country of origin
                </div>
                <div class="col-6">
                    ${client.country}
                </div>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${reservations.size() != 0}">
            <div class="card">
                <div class="card-header text-center">
                    <h4>Your flights</h4>
                </div>
                <div class="card-body">
                    <c:forEach var="reservation" items="${reservations}">
                        <div class="row">
                            <div class="col-5">
                                ${reservation.price}
                            </div>
                            <div class="col-7">
                                ${reservation}
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-center mt-4">
                <h4>You dont have any flights</h4>
            </div>
        </c:otherwise>
    </c:choose>

</div>
</body>
</html>
