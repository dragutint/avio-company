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

        <form:form action="passengers-info" modelAttribute="reservation" method="post">
            <form:hidden path="id" />
            <div class="row">
                <div class="col-2">
                    <label>Flight</label>
                </div>
                <div class="col-4">
                    <label><strong>${flight.airportDepIata} - ${flight.airportArrIata}</strong></label>
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    <label>Time</label>
                </div>
                <div class="col-4">
                    <label><strong><fmt:formatDate value="${flight.timeDep}" pattern="HH:mm"/> - <fmt:formatDate value="${flight.timeArr}" pattern="HH:mm"/></strong></label>
                </div>
            </div>


            <div class="form-group mb-4">
                <div class="row">
                    <div class="col-2">
                        <label for="passengersNum">Passengers</label>
                    </div>
                    <div class="col-2">
                        <form:input type="number" path="passengersNum" cssClass="form-control" />
                    </div>
                </div>
            </div>

            <div class="form-group mt-3">
                <div class="row">
                    <div class="col-2">
                        <label for="">Options</label>
                    </div>
                    <div class="col-2">
                        <input type="submit" name="start" value="Next" class="btn btn-success">
                        <button type="button" class="btn btn-primary mx-2"
                            data-toggle="modal" data-target="#oopsModal"
                            onclick="window.location.href='${pageContext.request.contextPath}/search'; return false;">Cancel</button>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
    <%@ include file="../includes/footer.jsp" %>
</div>
</body>
</html>