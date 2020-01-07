<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>List of aeroplanes</title>
    <script>
        $(document).ready(function () {
            $('#tableAeroplanes').DataTable({
                
            });
        });
    </script>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron ">
    <div class="container">
        <h3>List of aeroplanes</h3>
    </div>
</div>
<div class="container mt-3">
    <table class="table" id="tableAeroplanes">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Economy capacity</th>
                <th>Business capacity</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${aeroplanes}" var="aeroplane">
                <tr>
                    <td class="table-cell">${aeroplane.id}</td>
                    <td class="table-cell">${aeroplane.name}</td>
                    <td class="table-cell">${aeroplane.capacityEc}</td>
                    <td class="table-cell">${aeroplane.capacityBu}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
