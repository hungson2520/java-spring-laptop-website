<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!-- <html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Register</h2>
                    
                 

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
</html> -->






<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<form%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Order - Trang Admin</title>
        <link th:href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/style.css" rel="stylesheet" type="text/css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#imageUpload").change(function (event) {
                    const file = event.target.files[0]; // Lấy file từ input
                    if (file) {
                        const imageUrl = URL.createObjectURL(file); // Tạo URL object cho file
                        $("#imagePreview").attr("src", imageUrl).show(); // Cập nhật src và hiển thị ảnh
                    } else {
                        $("#imagePreview").hide(); // Ẩn ảnh nếu không có file
                    }
                });
            });
        </script>


        <!-- <link th:href="@{/resources/css/style.css}" rel="stylesheet" type="text/css"/> -->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    
        <jsp:include page="../layout/header.jsp"/>

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="../layout/sidebar.jsp"/>

            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">REGISTER</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">register a new User</li>
                        </ol>
                        <div class="row justify-content-center mt-5">
                        <div class="col-md-8">
                        <div class="card p-4">
                            <h2 class="text-center mb-4">Register</h2>
                         
                         
        
                             <form:form method="post" action="/admin/user/create" modelAttribute="user" class="container mt-5" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <!-- <form:label path="fullName" class="form-label" >Full Name:</form:label>
                                    <form:input path="fullName" class="form-control" />
                                    <form:errors path="fullName"  cssClass="invalid-feedback" /> -->

                                     <!-- Spring Bind để kiểm tra lỗi -->
                                                    <spring:bind path="user.fullName">
                                                            <!-- Label -->
                                                            <form:label path="fullName" class="form-label">Full Name:</form:label>
                                                            
                                                            <!-- Input Field -->
                                                            <form:input 
                                                                path="fullName" 
                                                                class="form-control ${status.error ? 'is-invalid' : ''}" 
                                                            />
                                                            
                                                            <!-- Errors -->
                                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                                        </spring:bind>
                                </div>
                                <div class="mb-3">
                                   <!-- Sử dụng Spring Bind -->
                                        <spring:bind path="user.email">
                                            <!-- Label -->
                                            <form:label path="email" class="form-label">Email:</form:label>
                                            
                                            <!-- Input Field -->
                                            <form:input 
                                                path="email" 
                                                class="form-control ${status.error ? 'is-invalid' : ''}" 
                                            />
                                            
                                            <!-- Errors -->
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                        </spring:bind>

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
                                       <!-- Sử dụng Spring Bind -->
                                            <spring:bind path="user.password">
                                                <!-- Label -->
                                                <form:label path="password" class="form-label">Password:</form:label>
                                                
                                                <!-- Input Field -->
                                                <form:password 
                                                    path="password" 
                                                    class="form-control ${status.error ? 'is-invalid' : ''}" 
                                                />
                                                
                                                <!-- Errors -->
                                                <form:errors path="password" cssClass="invalid-feedback" />
                                            </spring:bind>

                                </div>
                                <div class="mb-3">
                                    <label for="role" class="form-label">Choose a role:</label>
                                    <form:select class="form-select"   path="role.name">
                                        <form:option value="admin">Admin</form:option>
                                        <form:option value="user">User</form:option>
                                    </form:select>
                                </div>
                               
                                <h3 class="mb-4">Upload and Preview Image</h3>
                                
                                    <div class="mb-3">
                                        <label for="imageUpload" class="form-label">Select an Image</label>
                                        <input class="form-control" type="file" id="imageUpload" accept="image/*" name="fileAvatar">
                                    </div>
                                    <div class="mb-3">
                                        <img id="imagePreview" src="#" alt="Preview Image" class="img-thumbnail" style="display:none; max-width: 500px; max-height: 800px;">
                                    </div>
                                
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form:form>
                        </div>
                    </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp"/>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/script.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/js/chart-area-demo.js"></script>
        <script src="/js/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
    </body>
</html>