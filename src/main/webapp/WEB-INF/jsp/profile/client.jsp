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
                    <fmt:formatDate value="${client.dateOfBirth}" pattern="DD.MM.YYYY." />
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
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Departure</th>
                                <th>Arrival</th>
                                <th>Price</th>
                                <th>Date</th>
                                <th>Link</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="reservation" items="${reservations}">
                                <tr>
                                    <td>${reservation.flight.airportDepIata}</td>
                                    <td>${reservation.flight.airportArrIata}</td>
                                    <td>${reservation.price}</td>
                                    <td>${reservation.dateCreated}</td>
                                    <td><a href="reserve/preview/${reservation.id}"><button class="form-control btn btn-info">Preview</button></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-center mt-4">
                <h4>You dont have any flights</h4>
            </div>
        </c:otherwise>
    </c:choose>
    <%@ include file="../includes/footer.jsp" %>

</div>
</body>
</html>
