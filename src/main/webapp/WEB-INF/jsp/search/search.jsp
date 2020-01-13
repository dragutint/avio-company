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
            <form method="get" action="searchFlights">

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="airportFromSpan">From</span>
                    </div>
                    <select type="text" required name="airportFrom" id="airportFrom" class="form-control select2" aria-label="Default" aria-describedby="airportFromSpan"></select>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="airportToSpan">&nbsp&nbsp&nbsp&nbspTo</span>
                    </div>
                    <select type="text" required name="airportTo" id="airportTo" class="form-control" aria-label="Default" aria-describedby="airportToSpan"></select>
                </div>

                <div class="input-group date">
                    <input type="date" required name="dateFrom" id="dateFrom" class="form-control" />
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-th"></span>
                    </div>
                </div>

                <div class="input-group date">
                    <input type="date" name="dateTo" id="dateTo" class="form-control" />
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-th"></span>
                    </div>
                </div>

                <div class="input-group mb-3">
                    <input type="submit" id="searchButton" value="Search" class="form-control"/>
                </div>
            </form>
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