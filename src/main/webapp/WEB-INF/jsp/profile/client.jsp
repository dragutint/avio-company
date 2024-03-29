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
            <h3><i class="fas fa-user-astronaut"></i> ${client.firstName}&nbsp${client.lastName}</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-4 offset-1">
                    <i class="fas fa-id-card"></i> Passport num
                </div>
                <div class="col-6">
                    ${client.passportNum}
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    <i class="fas fa-calendar"></i> Date of birth
                </div>
                <div class="col-6">
                    <fmt:formatDate value="${client.dateOfBirth}" pattern="DD.MM.YYYY." />
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    <i class="fas fa-envelope"></i> Email
                </div>
                <div class="col-6">
                    ${client.email}
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    <i class="fas fa-phone"></i> Contact
                </div>
                <div class="col-6">
                    ${client.contact}
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    <i class="fas fa-globe-americas"></i> Country of origin
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
                    <sec:authorize access="hasAuthority('admin')">
                        <h4>Clients flights</h4>
                    </sec:authorize>
                    <sec:authorize access="hasAuthority('client')">
                        <h4>Your flights</h4>
                    </sec:authorize>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Departure</th>
                                <th>Arrival</th>
                                <th>Flight date</th>
                                <th>Price</th>
                                <th>Reservation date</th>
                                <th>Link</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="reservation" items="${reservations}">
                                <tr>
                                    <td>
                                        <span class="badge badge-primary">
                                            <h5>
                                                ${reservation.flight.airportDepIata}
                                            </h5>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge badge-primary">
                                            <h5>
                                                ${reservation.flight.airportArrIata}
                                            </h5>
                                        </span>
                                    </td>
                                    <td><fmt:formatDate value="${reservation.flight.timeDep}" pattern="DD.MM.YYYY. HH:mm" /></td>
                                    <td>${reservation.price}</td>
                                    <td><fmt:formatDate value="${reservation.dateCreated}" pattern="DD.MM.YYYY." /></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${reservation.finished}">
                                                <a href="<c:url value="/reserve/preview/${reservation.id}"/>"><button class="form-control btn btn-info">Preview</button></a>
                                            </c:when>
                                            <c:otherwise>
                                                <sec:authorize access="hasAuthority('client')">
                                                    <a href="<c:url value="/reserve/preview/${reservation.id}"/>"><button class="form-control btn btn-danger">Continue</button></a>
                                                </sec:authorize>
                                                <sec:authorize access="hasAuthority('admin')">
                                                    <a href="<c:url value="/reserve/preview/${reservation.id}"/>"><button class="form-control btn btn-danger">Preview</button></a>
                                                </sec:authorize>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <sec:authorize access="hasAuthority('admin')">
                <div class="alert alert-warning mt-3" role="alert">
                    <h4 class="alert-heading text-center">The client never flew with us</h4>
                </div>
            </sec:authorize>
            <sec:authorize access="hasAuthority('client')">
                <div class="alert alert-warning mt-3" role="alert">
                    <h4 class="alert-heading text-center">You have never flown with us</h4>
                </div>
            </sec:authorize>
        </c:otherwise>
    </c:choose>
    <%@ include file="../includes/footer.jsp" %>
</div>
</body>
</html>
