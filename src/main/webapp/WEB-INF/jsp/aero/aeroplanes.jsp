<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
    <ul>
        <c:forEach items="${aeroplanes}" var="aeroplane">
            <li>${aeroplane.id} ${aeroplane.name}</li>
        </c:forEach>
    </ul>
</body>
</html>
