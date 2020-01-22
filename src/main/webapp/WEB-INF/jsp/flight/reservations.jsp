<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>Reservations for flight</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <div>
        <h2 class="mb-3"><strong>Flight status</strong></h2>

        <div class="row">
            <div class="col-4">
                <div class="card">
                    <div class="card-header">
                        <h5>Basic info</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6"><h4><strong>${flight.airportDepIata}</strong></h4></div>
                            <div class="col-6"><h4><strong>${flight.airportArrIata}</strong></h4></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><strong> <fmt:formatDate value="${flight.timeDep}" pattern="HH:mm" /></strong></div>
                            <div class="col-6"><strong> <fmt:formatDate value="${flight.timeArr}" pattern="HH:mm" /></strong></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-6"><strong>Reservation count</strong></div>
                            <div class="col-6"><strong>Free seats left</strong></div>
                        </div>
                        <div class="row">
                            <div class="col-6">${reservations.size()}</div>
                            <div class="col-6">${flight.freeSeats}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8">
                <div class="card">
                    <div class="card-header">
                        <h5>Reservations</h5>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>Passport</th>
                                <th>Passengers</th>
                                <th>Date created</th>
                                <th>Options</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${reservations}" var="reservation">
                                <tr>
                                    <td>${reservation.id}</td>
                                    <td>${reservation.client.firstName}</td>
                                    <td>${reservation.client.lastName}</td>
                                    <td>${reservation.client.passportNum}</td>
                                    <td>${reservation.passengersNum}</td>
                                    <td><fmt:formatDate value="${reservation.dateCreated}" pattern="DD.MM.YYYY."/></td>
                                    <td>
                                        <button class="btn btn-info showReservation" data-reservationid="${reservation.id}"><i class="fa fa-arrow-right"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../includes/footer.jsp" %>
</div>
<script src="<c:url value="/resources/js/flight/reservations.js"/>"></script>
</body>
</html>