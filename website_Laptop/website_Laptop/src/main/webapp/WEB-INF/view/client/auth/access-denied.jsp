<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Denied</title>
    <!-- Add Bootstrap for styling (optional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container text-center mt-5">
        <h1 class="display-4 text-danger">403 - Access Denied</h1>
        <p class="lead">You do not have permission to access this page.</p>
        <img src="https://cdn-icons-png.flaticon.com/512/1828/1828490.png" alt="Access Denied" style="width: 200px; margin: 20px auto;">
        <div class="mt-4">
            <a href="/" class="btn btn-primary">Go to Homepage</a>
            <a href="login.jsp" class="btn btn-secondary">Login</a>
        </div>
    </div>

    <!-- Add Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>