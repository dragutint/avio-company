<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>List of aeroplanes</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <div class="row">
        <div class="col-4">
            <div class="card">
                <form:form method="post" action="searchFlights" modelAttribute="searchFilterForm">
                    <div class="card-header">
                        <h4>Search flights</h4>
                    </div>
                    <div class="card-body">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="airportFromSpan">From</span>
                            </div>
                            <form:select path="fromIata" id="airportFrom" cssClass="form-control text-center" required="required"/>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="airportToSpan">&nbsp&nbsp&nbsp&nbspTo</span>
                            </div>
                            <form:select path="toIata" id="airportTo" cssClass="form-control text-center" required="required"/>
                        </div>

                        <div class="form-group">
                            <div class="input-group date" id="departureDateDateTimePicker" data-target-input="nearest">
                                <form:input path="departureDate" id="departureDate" type="text" cssClass="form-control datetimepicker-input" data-target="#departureDateDateTimePicker"/>
                                <div class="input-group-append" data-target="#departureDateDateTimePicker" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group date" id="returnDateDateTimePicker" data-target-input="nearest">
                                <form:input path="returnDate" id="returnDate" type="text" cssClass="form-control datetimepicker-input" data-target="#returnDateDateTimePicker"/>
                                <div class="input-group-append" data-target="#returnDateDateTimePicker" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            $(function () {
                                $('#departureDateDateTimePicker').datetimepicker({
                                    format: 'YYYY-MM-DD'
                                });
                                $('#returnDateDateTimePicker').datetimepicker({
                                    format: 'YYYY-MM-DD'
                                });
                            });
                        </script>
                    </div>
                    <div class="card-footer">
                        <div class="input-group">
                            <input type="submit" id="searchButton" value="Search" class="form-control"/>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <div class="col-8">
            <c:if test="${flights.size() != 0 && not empty flights}">
                <div class="card" id="resultsCard">
                    <div class="card-header">
                        <h4>Flights available</h4>
                    </div>
                    <div class="card-body">
                        <c:forEach items="${flights}" var="flight">
                            <div class="row">
                                <div class="col-3">
                                    ${flight.timeDep.hours}:${flight.timeDep.minutes} - ${flight.timeArr.hours}:${flight.timeArr.minutes}
                                </div>
                                <div class="col-3">
                                    ${flight.priceBu} | ${flight.priceEc}
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </c:if>
        </div>
    </div>
</div>
</body>
<script src="<c:url value="/resources/js/search/search.js"/>"></script>
</html>