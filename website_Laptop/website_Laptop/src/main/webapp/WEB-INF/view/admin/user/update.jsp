<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  

<!-- Bootstrap JavaScript (Bundle with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Update thông tin user</h2>
                  
                 

                     <form:form method="post" action="/admin/user/create" modelAttribute="user" class="container mt-5">
                        <div class="mb-3">
                            <form:label path="fullName" class="form-label">Full Name:</form:label>
                            <form:input path="fullName" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <form:label path="email" class="form-label">Email:</form:label>
                            <form:input path="email" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <form:label path="address" class="form-label">Address:</form:label>
                            <form:input path="address" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <form:label path="phone" class="form-label">Phone:</form:label>
                            <form:input path="phone" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <form:label path="password" class="form-label">Password:</form:label>
                            <form:password path="password" class="form-control" />
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>