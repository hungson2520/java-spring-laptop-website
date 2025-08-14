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
                        <h1 class="mt-4">ORDER DETAIL</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">ORDER DETAIL </li>
                        </ol>
                        
                      
                        
                    </div>

                    <div class="container-fluid px-4">
                        <h1 class="mt-4">ORDER DETAILS</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin/order">Orders</a></li>
                            <li class="breadcrumb-item active">Order Details</li>
                        </ol>
                    
                        <div class="container mt-5">
                            <div class="d-flex justify-content-between mt-5 mb-2">
                                <h2 class="text-center mb-4">Order Details</h2>
                                <a href="/admin/order" class="btn btn-secondary">Back to Orders</a>
                            </div>
                            
                            <div class="mb-4">
                                <h5>Order Information</h5>
                                <p><strong>Order ID:</strong> ${order.id}</p>
                                <p><strong>Total Price:</strong> $${order.totalPrice}</p>
                                <p><strong>Receiver Name:</strong> ${order.recieverName}</p>
                                <p><strong>Receiver Address:</strong> ${order.recieverAddress}</p>
                                <p><strong>Receiver Phone:</strong> ${order.recieverPhone}</p>
                                <p><strong>Status:</strong> ${order.status}</p>
                            </div>
                    
                            <table class="table table-striped table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="orderDetail" items="${orderDetails}">
                                        <tr>
                                            <td>${orderDetail.id}</td>
                                            <td>${orderDetail.product.name}</td>
                                            <td>${orderDetail.quantity}</td>
                                            <td>$${orderDetail.price}</td>
                                            <td>$${orderDetail.quantity * orderDetail.price}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
