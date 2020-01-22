<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <script>
        $(document).ready(function() {
            $('#clientsTable').dataTable({
                "jQueryUI" : true,
                "pagingType" : "full_numbers",
                "lengthMenu" : [ [ 5, 10, 50], [ 5, 10, 50] ]
            });
        });
    </script>
    <title>List of flights</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="m-5">
    <table id="clientsTable" class="display datatable table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Passport</th>
            <th>Username</th>
            <th>Options</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${clients}" var="client">
            <tr id="client-${client.id}">
                <td>${client.id}</td>
                <td>${client.firstName}&nbsp${client.lastName}</td>
                <td>${client.passportNum}</td>
                <td>${client.user.username}</td>
                <td>
                    <button class="btn btn-info clientProfile" data-clientid="${client.id}"><i class="fa fa-user"></i></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%@ include file="../includes/footer.jsp" %>

</div>
<script src="<c:url value="/resources/js/client/client.js"/>"></script>
</body>
</html>
