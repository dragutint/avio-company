<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>List of flights</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <c:forEach items="${flights}" var="flight">
            <li class="nav-item">
                <a class="nav-link" id="flight-${flight.timeDep}" data-toggle="tab" href="#flight-${flight.timeDep}" role="tab" aria-controls="flight-${flight.timeDep}" aria-selected="true">${flight.timeDep}</a>
            </li>
        </c:forEach>


    </ul>
    <div class="tab-content" id="myTabContent">
        <c:forEach items="${flights}" var="flight">
            <div class="tab-pane fade show" id="flight-${flight.timeDep}" role="tabpanel" aria-labelledby="flight-${flight.timeDep}">
                <div class="row">
                    <div class="col-3">${flight.timeDep}</div>
                    <div class="col-3">${flight.timeArr}</div>
                    <div class="col-3">${flight.priceEc}</div>
                </div>
            </div>

        </c:forEach>

    </div>
</div>

</body>

</html>