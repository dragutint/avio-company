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
        <h2 class="mb-3"><strong>Reservation info</strong></h2>

        <div class="row">
            <div class="col-4">
                <div class="card">
                    <div class="card-header">
                        <h5>Flight info</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6"><h4><strong>${reservation.flight.airportDepIata}</strong></h4></div>
                            <div class="col-6"><h4><strong>${reservation.flight.airportArrIata}</strong></h4></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><strong> <fmt:formatDate value="${reservation.flight.timeDep}" pattern="HH:mm" /></strong></div>
                            <div class="col-6"><strong> <fmt:formatDate value="${reservation.flight.timeArr}" pattern="HH:mm" /></strong></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><strong>Price:</strong></div>
                            <div class="col-6">${reservation.price}</div>
                        </div>
                    </div>
                </div>
                <sec:authorize access="hasAuthority('admin')">
                <div class="card mt-3">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-6">
                                <h5>Client info</h5>
                            </div>
                            <div class="col-6">
                                <button class="btn btn-info clientProfile" data-clientid="${reservation.client.id}"><i class="fa fa-arrow-left"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6"><h5><strong>${reservation.client.firstName}</strong></h5></div>
                            <div class="col-6"><h5><strong>${reservation.client.lastName}</strong></h5></div>
                        </div>
                        <div class="row">
                            <div class="col-5">Email:</div>
                            <div class="col-7">${reservation.client.email}</div>
                        </div>
                        <div class="row">
                            <div class="col-5">Passport:</div>
                            <div class="col-7">${reservation.client.passportNum}</div>
                        </div>
                        <div class="row">
                            <div class="col-5">Contact:</div>
                            <div class="col-7">${reservation.client.contact}</div>
                        </div>
                        <div class="row">
                            <div class="col-5">Date of birth:</div>
                            <div class="col-7"><fmt:formatDate value="${reservation.client.dateOfBirth}" pattern="DD.MM.YYYY." /></div>
                        </div>
                    </div>
                </div>
                </sec:authorize>
            </div>
            <div class="col-8">
                <c:choose>
                    <c:when test="${empty tickets || tickets.size() == 0}">
                        <sec:authorize access="hasAuthority('admin')">
                            <div class="alert alert-warning" role="alert">
                                <h4 class="alert-heading">Reservation not finished</h4>
                                <p>Client has not finished his reservation, please contact him.</p>
                            </div>
                        </sec:authorize>
                        <sec:authorize access="hasAuthority('client')">
                            <div class="alert alert-warning" role="alert">
                                <h4 class="alert-heading">Reservation not finished</h4>
                                <p>You have not finished your reservation.</p>
                                <a href="<c:url value="/reserve/passengers-info/${reservation.id}"/>"><button class="form-control btn btn-info">Finish reservation</button></a>
                            </div>
                        </sec:authorize>
                    </c:when>
                    <c:when test="${not empty tickets && tickets.size() > 0}">
                        <div class="card">
                            <div class="card-header">
                                <h5>Passengers</h5>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Ticket number</th>
                                        <th>First name</th>
                                        <th>Last name</th>
                                        <th>Passport</th>
                                        <th>Class</th>
                                        <th>Price</th>
                                        <th>Export</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${tickets}" var="ticket">
                                        <tr>
                                            <td>${ticket.id}</td>
                                            <td>${ticket.firstName}</td>
                                            <td>${ticket.lastName}</td>
                                            <td>${ticket.passportNum}</td>
                                            <td>${ticket.classType.name}</td>
                                            <td>${ticket.price}</td>
                                            <td>
                                                <form:form action="ticket/download/${ticket.id}" method="post" id="downloadPDF">
                                                    <input id="submitId" type="submit" value="Ticket" class="form-control">
                                                </form:form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <%@ include file="../includes/footer.jsp" %>
</div>
<script src="<c:url value="/resources/js/client/client.js"/>"></script>
</body>
</html>