<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>List of aeroplanes</title>
    <script>
        $(document).ready(function () {
            $('#tableAeroplanes').DataTable({
                "jQueryUI" : true,
                "pagingType" : "full_numbers",
                "lengthMenu" : [ [ 5, 10], [ 5, 10] ]
            });
        });
    </script>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <h2 class="mb-3"><strong>List of aeroplanes</strong></h2>
    <table class="table" id="tableAeroplanes">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Capacity</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${aeroplanes}" var="aeroplane">
                <tr>
                    <td class="table-cell">${aeroplane.id}</td>
                    <td class="table-cell">${aeroplane.name}</td>
                    <td class="table-cell">${aeroplane.capacity}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <%@ include file="../includes/footer.jsp" %>

</div>
</body>
</html>
