<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>Profile</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <div class="card">
        <div class="card-header text-center">
            <h3>${employee.firstName}&nbsp${employee.lastName}</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-4 offset-1">
                    Email
                </div>
                <div class="col-6">
                    ${employee.email}
                </div>
            </div>
        </div>
    </div>

    <div>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">...</div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">..2.</div>
            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">..23.</div>
        </div>

    </div>
</div>
</body>
</html>
