<%@ page import="com.avio.domain.Reservation" %>
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
        <h2 class="mb-3"><strong>Enter passengers info</strong></h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Num</th>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>Class</th>
                    <th>Price</th>
                    <th>Passport</th>
                </tr>
            </thead>
            <tbody>
            <% for(int i = 1; i <= ((Reservation)request.getAttribute("reservation")).getPassengersNum(); i+=1) { %>
                <tr>
                    <td><%= i %></td>
                    <td><input id="first-name-<%= i %>" class="form-control"/></td>
                    <td><input id="last-name-<%= i %>" class="form-control"/></td>
                    <td>
                        <select id="class-<%= i %>" class="form-control">
                            <c:forEach items="${classtypes}" var="classType">
                                <option value="${classType.id}">${classType.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td><input id="price-<%= i %>" class="form-control" readonly/></td>
                    <td><input id="passport-<%= i %>" class="form-control"/></td>
                </tr>
            <% } %>
            </tbody>
        </table>

        <div>
            <button id="btnSavePassengers"
                    class="form-control btn btn-success"
                    data-passengers="<%= ((Reservation)request.getAttribute("reservation")).getPassengersNum() %>"
                    data-reservationid="<%= ((Reservation)request.getAttribute("reservation")).getId() %>">
                Proceed
            </button>
        </div>
    </div>
</div>

<script src="<c:url value="/resources/js/reserve/reserve.js"/>"></script>
</body>
</html>