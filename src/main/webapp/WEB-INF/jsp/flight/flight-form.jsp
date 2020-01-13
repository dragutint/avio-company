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
                    <label for="airportFrom">Airport from</label>
                </div>
                <div class="col-10">
                    <form:select path="airportDepIata" id="airportFrom" cssClass="form-control text-center" required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="airportTo">Airport to</label>
                </div>
                <div class="col-10">
                    <form:select path="airportArrIata" id="airportTo" cssClass="form-control text-center" required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="durationInMin">Duration of flight</label>
                </div>
                <div class="col-10">
                    <form:input path="durationInMin" cssClass="form-control" placeholder="Enter estimated duration in minutes.." type="number" minlength="1" required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="timeDep" class="mb-0">Department time</label>
                    <br>
                    <small class="mt-0">Department airport timezone</small>
                </div>
                <div class="col-4">
                    <div class="form-group">
                        <div class="input-group date" id="timeDepDateTimePicker" data-target-input="nearest">
                            <form:input path="timeDep" type="text" cssClass="form-control datetimepicker-input" data-target="#timeDepDateTimePicker"/>
                            <div class="input-group-append" data-target="#timeDepDateTimePicker" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <label for="timeDep">Arrival time</label>
                </div>
                <div class="col-4">
                    <form:input path="timeArr" cssClass="form-control" type="datetime-local" required="required"/>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $('#timeDepDateTimePicker').datetimepicker();
                    });
                </script>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="pilot">Pilot</label>
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
                    <label for="aeroplane">Aeroplane</label>
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
                    <label for="gate">Gate</label>
                </div>
                <div class="col-10">
                    <form:input path="gate" cssClass="form-control" placeholder="Enter gate.." minlength="2" required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="priceEc">Economy price</label>
                </div>
                <div class="col-10">
                    <form:input path="priceEc" cssClass="form-control" placeholder="Enter price for economy class.." required="required"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-2">
                    <label for="priceBu">Business price</label>
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
</div>
</body>
<script>
    $('#airportFrom').select2({
        placeholder: 'Search airports',
        minimumInputLength: 2,
        ajax: {
            delay: 250,
            url: function (params) {
                return 'http://localhost:8085/aviocompany_war_exploded/api/airports/' + params.term;
            },
            dataType: 'json',
            processResults: function (data) {
                var results = [];
                $.each(data || [], function() {
                    results.push({
                        id: this.iata_code,
                        text: this.name + '[' + this.iata_code + ']'
                    });
                });
                return {
                    results: results
                };
            },
            cache: true
        }
    });

    $('#airportTo').select2({
        placeholder: 'Search airports',
        minimumInputLength: 2,
        ajax: {
            delay: 250,
            url: function (params) {
                return 'http://localhost:8085/aviocompany_war_exploded/api/airports/' + params.term;
            },
            dataType: 'json',
            processResults: function (data) {
                var results = [];
                $.each(data || [], function() {
                    results.push({
                        id: this.iata_code,
                        text: this.name + '[' + this.iata_code + ']'
                    });
                });
                return {
                    results: results
                };
            },
            cache: true
        }
    });

</script>
</html>