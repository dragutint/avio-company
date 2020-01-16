<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <%@ include file="../includes/head.jsp" %>
    <title>List of aeroplanes</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="container mt-3">
    <h2 class="mb-3 text-center"><strong>Register new account</strong></h2>
    <form:form method="post" action="saveClient" modelAttribute="client">
        <form:hidden path="id" />
        <form:hidden path="user.id" />

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="firstName">First name</label>
                </div>
                <div class="col-8">
                    <form:input path="firstName" cssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="lastName">Last name</label>
                </div>
                <div class="col-8">
                    <form:input path="lastName" cssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="dateOfBirth">Date of birth</label>
                </div>
                <div class="col-8">
                    <div class="input-group date" id="departureDateDateTimePicker" data-target-input="nearest">
                        <form:input path="dateOfBirth" id="departureDate" type="text" cssClass="form-control datetimepicker-input" data-target="#departureDateDateTimePicker"/>
                        <div class="input-group-append" data-target="#departureDateDateTimePicker" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script type="text/javascript">
            $(function () {
                $('#departureDateDateTimePicker').datetimepicker({
                    format: 'YYYY-MM-DD'
                });
            });
        </script>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="contact">Contact</label>
                </div>
                <div class="col-8">
                    <form:input path="contact" cssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="email">Email</label>
                </div>
                <div class="col-8">
                    <form:input path="email" cssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="passportNum">Passport</label>
                </div>
                <div class="col-8">
                    <form:input path="passportNum" cssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="country">Country</label>
                </div>
                <div class="col-8">
                    <form:input path="country" cssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="gender">Gender</label>
                </div>
                <div class="col-8">
                    <form:select path="gender" cssClass="form-control" >
                        <form:option value="male">Male</form:option>
                        <form:option value="female">Female</form:option>
                        <form:option value="NA">NA</form:option>
                    </form:select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="user.username">Username</label>
                </div>
                <div class="col-8">
                    <form:input path="user.username" cssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-4">
                    <label for="user.username">Password</label>
                </div>
                <div class="col-8">
                    <form:input path="user.password" type="password" cssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <input type="submit" value="Register" class="form-control btn btn-success mt-2" data-toggle="modal" data-target="#oopsModal">
            <button type="button" class="form-control btn btn-primary mt-2"
                    data-toggle="modal" data-target="#oopsModal"
                    onclick="window.location.href='${pageContext.request.contextPath}/search'; return false;">Cancel
            </button>
        </div>
    </form:form>
    <%@ include file="../includes/footer.jsp" %>

</div>
<script src="<c:url value="/resources/js/flight/flight-form.js"/>"></script>
</body>
</html>