<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <script>
        $(document).ready(function() {
            $('#flightsTable').dataTable({
                "jQueryUI" : true,
                "pagingType" : "full_numbers",
                "lengthMenu" : [ [ 5, 10, 50, -1 ], [ 5, 10, 50, "All" ] ]
            });
        });
    </script>
    <title>List of flights</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="m-5">
    <table id="flightsTable" class="display datatable table">
        <thead>
            <tr>
                <th>Pilot</th>
                <th>Aeroplane</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Gate</th>
                <th>Duration</th>
                <th>Time departure</th>
                <th>Time arrival</th>
                <th>Free seats - BC</th>
                <th>Free seats - EC</th>
                <th>Price - BC</th>
                <th>Price - EC</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${flights}" var="flight">
                <tr>
                    <td>${flight.pilot.firstName}&nbsp${flight.pilot.lastName}</td>
                    <td>${flight.aeroplane.name}</td>
                    <td>${flight.airportDepIata}</td>
                    <td>${flight.airportArrIata}</td>
                    <td>${flight.gate}</td>
                    <td>${flight.durationInMin}</td>
                    <td>${flight.timeDep}</td>
                    <td>${flight.timeArr}</td>
                    <td>${flight.freeSeatsBu}</td>
                    <td>${flight.freeSeatsEc}</td>
                    <td>${flight.priceBu}</td>
                    <td>${flight.priceEc}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
