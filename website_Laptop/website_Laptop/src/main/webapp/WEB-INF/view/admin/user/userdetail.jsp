<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<div class="container mt-5">
    <h2>User Detail</h2>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">User Information</h5>
            <p class="card-text"><strong>ID:</strong> ${user.id}</p>
            <p class="card-text"><strong>Email:</strong> ${user.email}</p>
            <p class="card-text"><strong>Full Name:</strong> ${user.fullName}</p>
            <p class="card-text"><strong>Address:</strong> ${user.address}</p>
            <p class="card-text"><strong>Phone:</strong> ${user.phone}</p>
        </div>
        <div class="card-footer text-muted">
            <a href="/admin/user" class="btn btn-primary">Back to List</a>
            <a href="/admin/user/update/${user.id}" class="btn btn-warning">Update</a>
            <a href="/admin/user/delete/${user.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>