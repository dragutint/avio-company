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
                /* few more options are available to use */
            });
        });
    </script>
    <title>List of flights</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron ">
    <div class="container">
        <h3>List of flights</h3>
    </div>
</div>
<div class="container mt-3">
    <table id="flightsTable" class="display datatable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Pilot</th>
                <th>Aeroplane</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Gate</th>
                <th>Duration</th>
                <th>Time departure</th>
                <th>Time arrival</th>
                <th>Free seats in business class</th>
                <th>Free seats in economy class</th>
                <th>Date created</th>
                <th>Date updated</th>
                <th>Price for business class</th>
                <th>Price for economy class</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${flights}" var="flight">
                <tr>
                    <td>${flight.id}</td>
                    <td>${flight.pilot}</td>
                    <td>${flight.aeroplane}</td>
                    <td>${flight.airportDep}</td>
                    <td>${flight.airportArr}</td>
                    <td>${flight.gate}</td>
                    <td>${flight.durationInMin}</td>
                    <td>${flight.timeDep}</td>
                    <td>${flight.timeArr}</td>
                    <td>${flight.freeSeatsBu}</td>
                    <td>${flight.freeSeatsEc}</td>
                    <td>${flight.dateCreated}</td>
                    <td>${flight.dateUpdated}</td>
                    <td>${flight.priceBu}</td>
                    <td>${flight.priceEc}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
