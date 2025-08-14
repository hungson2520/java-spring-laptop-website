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
                        <h1 class="mt-4">ORDER</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">ORDER</li>
                        </ol>
                        
                      
                        
                    </div>

                    <table class="table table-striped table-bordered">
                        <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Total Price</th>
                            <th>User</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td>${order.totalPrice}</td>
                                    <td>${order.user.fullName}</td>
                                    <td>${order.status}</td>
                                    <td>
                                        <!-- Các hành động như View, Edit, Delete -->
                                        <a href="/admin/order/${order.id}" class="btn btn-success btn-sm">View</a>
                                        <a href="/admin/order/edit/${order.id}" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="/admin/order/delete/${order.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this order?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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
        <script src="/client/js/jquery.min.js"></script>
<script src="/client/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/client/js/popper.min.js"></script>
<script src="/client/js/bootstrap.min.js"></script>
<script src="/client/js/jquery.easing.1.3.js"></script>
<script src="/client/js/jquery.waypoints.min.js"></script>
<script src="/client/js/jquery.stellar.min.js"></script>
<script src="/client/js/owl.carousel.min.js"></script>
<script src="/client/js/jquery.magnific-popup.min.js"></script>
<script src="/client/js/aos.js"></script>
<script src="/client/js/jquery.animateNumber.min.js"></script>
<script src="/client/js/bootstrap-datepicker.js"></script>
<script src="/client/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/client/js/google-map.js"></script>
<script src="/client/js/main.js"></script>
    </body>
</html>
