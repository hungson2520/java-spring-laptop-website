<!-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between mt-5 mb-2 ">
        <h2 class="text-center mb-4">User List</h2>

        <a href="/admin/user/create"  class="btn btn-primary">Create new User</a>
    </div>
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Fullname</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.email}</td>
                    <td>${user.fullName}</td>
                    <td>
                        <a href="/admin/user/view/${user.id}" class="btn btn-success btn-sm">View</a>
                        <a href="/edit/${user.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/delete/${user.id}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> -->



<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
                        <h1 class="mt-4">USER</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">USER LIST</li>
                        </ol>
                        
                        <div class="container mt-5">
                            <div class="d-flex justify-content-between mt-5 mb-2 ">
                                <h2 class="text-center mb-4">User List</h2>
                        
                                <a href="/admin/user/create"  class="btn btn-primary">Create new User</a>
                            </div>
                            <table class="table table-striped table-bordered">
                                <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Email</th>
                                    <th>Fullname</th>
                                    <th>Role</th>

                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.email}</td>
                                            <td>${user.fullName}</td>
                                            <td>${user.role.name}</td>
                                            <td>
                                                <!-- Các hành động như View, Edit, Delete -->
                                                <a href="/admin/user/view/${user.id}" class="btn btn-success btn-sm">View</a>
                                                <a href="/edit/${user.id}" class="btn btn-warning btn-sm">Edit</a>
                                                <a href="/delete/${user.id}" class="btn btn-danger btn-sm">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example ">
                                <ul class="pagination justify-content-center">
                                  <li class="page-item">
                                    <a class="page-link ${1 eq currentPage ?'disabled':''} " aria-label="Previous" href="/admin/user?page=${currentPage-1}" >
                                      <span aria-hidden="true">&laquo;</span>
                                    </a>
                                  </li>
                                  <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                   
                                     <li class="page-item"><a class="page-link ${loop.index eq currentPage ?'active':''}" href="/admin/user?page=${loop.index}">${loop.index}</a></li>
                                  </c:forEach>
                                
                                
                                  <li class="page-item">
                                    <a class="page-link ${totalPages eq currentPage ?'disabled':''}"  aria-label="Next" href="/admin/user?page=${currentPage+1}">
                                      <span aria-hidden="true">&raquo;</span>
                                    </a>
                                  </li>
                                </ul>
                              </nav>
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
