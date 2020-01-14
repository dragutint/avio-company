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
            <form:form method="post" action="searchFlights" modelAttribute="searchFilterForm">

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

                <div class="input-group mb-3">
                    <input type="submit" id="searchButton" value="Search" class="form-control"/>
                </div>
            </form:form>
        </div>
    </div>
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