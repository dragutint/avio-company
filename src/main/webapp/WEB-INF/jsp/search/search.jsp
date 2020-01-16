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
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="currencySpan">Currency</span>
                                <form:select path="currency" cssClass="form-control">
                                    <c:forEach items="${currencies}" var="currency" >
                                        <form:option value="${currency}">${currency}</form:option>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>

                        <script type="text/javascript">
                            $(function () {
                                $('#departureDateDateTimePicker').datetimepicker({
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
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <c:forEach items="${flights}" var="flightMapItem">
                                <li class="nav-item">
                                    <a class="nav-link" id="flight-tab-${flightMapItem.key.time}" data-toggle="tab" href="#flight-${flightMapItem.key.time}" role="tab" aria-controls="flight-${flightMapItem.key.time}" aria-selected="true">
                                        <fmt:formatDate value="${flightMapItem.key}" pattern="dd.MM.yyyy."/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <c:forEach items="${flights}" var="flightMapItem">
                                <div class="tab-pane fade show" id="flight-${flightMapItem.key.time}" role="tabpanel" aria-labelledby="flight-tab-${flightMapItem.key.time}">
                                    <div class="row mt-2 mb-1">
                                        <div class="col-2">DEPARTURE</div>
                                        <div class="col-2">ARRIVAL</div>
                                        <div class="col-2">ECONOMY</div>
                                        <div class="col-2">BUSINESS</div>
                                    </div>
                                    <c:forEach items="${flightMapItem.value}" var="flight">
                                        <div class="row mb-2 border-light">
                                            <div class="col-2">
                                                <span class="badge badge-primary">
                                                    <h5>
                                                        <fmt:formatDate value="${flight.timeDep}" pattern="HH:mm"/>h
                                                    </h5>
                                                </span>
                                            </div>
                                            <div class="col-2">
                                                <span class="badge badge-primary">
                                                    <h5>
                                                       <fmt:formatDate value="${flight.timeArr}" pattern="HH:mm"/>h
                                                    </h5>
                                                </span>
                                            </div>
                                            <div class="col-2">
                                                <span class="badge badge-success">
                                                    <h5>
                                                        <fmt:formatNumber value="${flight.priceEc}" maxFractionDigits="2" />
                                                    </h5>
                                                </span>
                                            </div>
                                            <div class="col-2">
                                                <span class="badge badge-success">
                                                    <h5>
                                                        <fmt:formatNumber value="${flight.priceBu}" maxFractionDigits="2" />
                                                    </h5>
                                                </span>
                                            </div>
                                            <div class="col-2">
                                                <button class="form-control btn btn-info btnReserve"
                                                        data-flightid="${flight.id}"
                                                        data-clientusername="${client-username}">
                                                    Reserve!
                                                </button>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>
<script src="<c:url value="/resources/js/search/search.js"/>"></script>
</html>