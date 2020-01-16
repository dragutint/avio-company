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
            </div>
            <div class="col-8">
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
            </div>
        </div>
    </div>
    <%@ include file="../includes/footer.jsp" %>
</div>
</body>
</html>