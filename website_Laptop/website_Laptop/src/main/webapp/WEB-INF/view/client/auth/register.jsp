<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">User Registration</h2>
        <form:form action="/register" method="post" modelAttribute="user" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="fullName" class="form-label">Full Name</label>
        <form:input path="fullName" id="fullName" cssClass="form-control"       class="form-control ${status.error ? 'is-invalid' : ''}" 
        required="true" />
        <form:errors path="fullName" cssClass="text-danger" />
    </div>

    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <form:input path="email" id="email" cssClass="form-control" required="true"                                                                     class="form-control ${status.error ? 'is-invalid' : ''}" 
        />
        <form:errors path="email" cssClass="text-danger" />
    </div>

    <div class="mb-3">
        <label for="address" class="form-label">Address</label>
        <form:input path="address" id="address" cssClass="form-control"                                                                     class="form-control ${status.error ? 'is-invalid' : ''}" 
        />
        <form:errors path="address" cssClass="text-danger" />
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <form:password path="password" id="password" cssClass="form-control" required="true"                                                                     class="form-control ${status.error ? 'is-invalid' : ''}" 
        />
        <form:errors path="password" cssClass="text-danger" />
    </div>

    <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm Password</label>
        <form:password path="confirmPassword" id="confirmPassword" cssClass="form-control" required="true" />
        <form:errors path="confirmPassword" cssClass="text-danger" />
    </div>

    <button type="submit" class="btn btn-primary">Register</button>
</form:form>
        <!-- <form:form action="/register" method="post" modelAttribute="user" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="fullName" class="form-label">Full Name</label>
        <spring:bind path="user.fullName">
            <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" required>
        </spring:bind>
        <div class="invalid-feedback">
            Full name must have at least 2 characters.
        </div>
    </div>

    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <spring:bind path="user.email">
            <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
        </spring:bind>
        <div class="invalid-feedback">
            Please enter a valid email address.
        </div>
    </div>

    <div class="mb-3">
        <label for="address" class="form-label">Address</label>
        <spring:bind path="user.address">
            <input type="text" class="form-control" id="address" name="address" value="${user.address}">
        </spring:bind>
    </div>

   

    <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <spring:bind path="user.password">
            <input type="password" class="form-control" id="password" name="password" value="${user.password}" required>
        </spring:bind>
        <div class="invalid-feedback">
            Password must have at least 4 characters.
        </div>
    </div>

    <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm Password</label>
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
        <div class="invalid-feedback">
            Passwords must match.
        </div>
    </div>

 

    <button type="submit" class="btn btn-primary">Register</button>
</form:form> -->
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
