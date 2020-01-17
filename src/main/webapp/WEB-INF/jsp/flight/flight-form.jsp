<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>List of aeroplanes</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <h2 class="mb-3"><strong>Add new flight</strong></h2>
    <form:form method="post" action="addFlight" modelAttribute="flight">
        <form:hidden path="id" />

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="airportFrom"><i class="fa fa-plane-departure"></i> Airport from</label>
                </div>
                <div class="col-7">
                    <form:select path="airportDepIata" id="airportFrom" cssClass="form-control text-center" required="required"/>
                </div>
                <div class="col-3">
                    <label class="timezoneFrom" id="timezoneFromId"></label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="airportTo"><i class="fas fa-plane-arrival"></i> Airport to</label>
                </div>
                <div class="col-7">
                    <form:select path="airportArrIata" id="airportTo" cssClass="form-control text-center" required="required"/>
                </div>
                <div class="col-3">
                    <label class="timezoneTo" id="timezoneToId"></label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="durationInMin"><i class="fa fa-clock"></i> Duration of flight</label>
                </div>
                <div class="col-10">
                    <form:input path="durationInMin" id="flightDuration" cssClass="form-control" placeholder="Enter estimated duration in minutes.." type="number" minlength="1" required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="timeDep" class="mb-0"><i class="fa fa-calendar"></i> Department time</label>
                    <br>
                    <small class="mt-0 timezoneFrom"></small>
                </div>
                <div class="col-3">
                    <div class="form-group">
                        <div class="input-group date" id="timeDepDateTimePicker" data-target-input="nearest">
                            <form:input path="timeDep" id="timeDep" type="text" cssClass="form-control datetimepicker-input" data-target="#timeDepDateTimePicker"/>
                            <div class="input-group-append" data-target="#timeDepDateTimePicker" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <button id="generateArrivalTime" class="form-control btn-info" type="button">Generate arrival</button>
                </div>
                <div class="col-2">
                    <label for="timeArr" class="mb-0"><i class="fas fa-calendar"></i> Arrival time</label>
                    <br>
                    <small class="mt-0 timezoneTo"></small>
                </div>
                <div class="col-3">

                    <div class="form-group">
                        <div class="input-group">
                            <form:input path="timeArr" id="timeArr" type="text" cssClass="form-control"/>
                            <div class="input-group-append">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $('#timeDepDateTimePicker').datetimepicker({
                            format: 'YYYY-MM-DD HH:mm:ss'
                        });
                    });
                </script>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="pilot"><i class="fas fa-user-circle"></i> Pilot</label>
                </div>
                <div class="col-10">
                    <form:select path="pilot" cssClass="form-control text-center">
                        <c:forEach var="pilot" items="${pilots}">
                            <form:option value="${pilot.id}"><c:out value="${pilot.firstName} ${pilot.lastName}, licence: ${pilot.licence}"/></form:option>
                        </c:forEach>
                    </form:select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="aeroplane"><i class="fas fa-plane"></i> Aeroplane</label>
                </div>
                <div class="col-10">
                    <form:select path="aeroplane" cssClass="form-control text-center">
                        <c:forEach var="aeroplane" items="${aeroplanes}">
                            <form:option value="${aeroplane.id}"><c:out value="${aeroplane.name}, capacity EC: ${aeroplane.capacityEc}, capacity BU: ${aeroplane.capacityBu}" /></form:option>
                        </c:forEach>
                    </form:select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="gate"><i class="fas fa-arrow-up"></i> Gate</label>
                </div>
                <div class="col-10">
                    <form:input path="gate" cssClass="form-control" placeholder="Enter gate.." minlength="2" required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="priceEc"><i class="fas fa-coins"></i> Economy price</label>
                </div>
                <div class="col-10">
                    <form:input path="priceEc" cssClass="form-control" placeholder="Enter price for economy class.." required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="priceBu"><i class="fab fa-bitcoin"></i> Business price</label>
                </div>
                <div class="col-10">
                    <form:input path="priceBu" cssClass="form-control" placeholder="Enter price for business class.." required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <input type="submit" value="Save flight" class="btn btn-success" data-toggle="modal" data-target="#oopsModal">
            <button type="button" class="btn btn-primary mx-2"
                    data-toggle="modal" data-target="#oopsModal"
                    onclick="window.location.href='${pageContext.request.contextPath}/search'; return false;">Cancel
            </button>
        </div>
    </form:form>
    <%@ include file="../includes/footer.jsp" %>

</div>
    <script src="<c:url value="/resources/js/flight/flight-form.js"/>"></script>
</body>
</html>