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
        <!-- Spring Form:form tag -->
        <form:form action="/user/save" modelAttribute="user" enctype="multipart/form-data">
            <!-- Full Name -->
            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <spring:bind path="user.fullName">
                    <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" required>
                </spring:bind>
                <div class="invalid-feedback">
                    Full name must have at least 2 characters.
                </div>
            </div>

            <!-- Email -->
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <spring:bind path="user.email">
                    <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                </spring:bind>
                <div class="invalid-feedback">
                    Please enter a valid email address.
                </div>
            </div>

            <!-- Address -->
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <spring:bind path="user.address">
                    <input type="text" class="form-control" id="address" name="address" value="${user.address}">
                </spring:bind>
            </div>

            <!-- Phone -->
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <spring:bind path="user.phone">
                    <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
                </spring:bind>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <spring:bind path="user.password">
                    <input type="password" class="form-control" id="password" name="password" value="${user.password}" required>
                </spring:bind>
                <div class="invalid-feedback">
                    Password must have at least 4 characters.
                </div>
            </div>

            <!-- Avatar -->
            <div class="mb-3">
                <label for="avatar" class="form-label">Avatar</label>
                <spring:bind path="user.avatar">
                    <input type="file" class="form-control" id="avatar" name="avatar">
                </spring:bind>
                <div class="invalid-feedback">
                    Please upload an avatar image.
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Register</button>
        </form:form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
