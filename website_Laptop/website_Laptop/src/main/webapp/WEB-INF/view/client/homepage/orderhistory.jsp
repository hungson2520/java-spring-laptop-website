
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LỊCH SỬ MUA HÀNG </title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="../layout/header.jsp"/>
   
<div class="container my-5">
    <h1 class="text-center mb-4">Order History</h1>
    
    <div class="accordion" id="orderHistoryAccordion">
     
        


        <c:forEach var="order" items="${orders}">
            <!-- Mỗi đơn hàng -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOrder${order.id}">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#order${order.id}" aria-expanded="true" aria-controls="order${order.id}">
                        Order ID: ${order.id} &nbsp; | &nbsp;  Tổng giá ${order.totalPrice}
                        <span class="badge bg-${ order.status eq 'PENDING' ? 'secondary' :
                        order.status eq 'CONFIRMED' ? 'primary' :
                        order.status eq 'PACKAGING' ? 'info' :
                        order.status eq 'SHIPPING' ? 'warning' :
                        order.status eq 'DELIVERED' ? 'success' :
                        order.status eq 'CANCELLED' ? 'danger' :
                        order.status eq 'RETURN_REQUESTED' ? 'dark' :
                        order.status eq 'RETURNED' ? 'success' :
                        order.status eq 'FAILED' ? 'danger' : 'light'}">
    ${order.status}
   
</span>




                    </button>
                </h2>
                <div id="order${order.id}" class="accordion-collapse collapse" aria-labelledby="headingOrder${order.id}" data-bs-parent="#orderHistoryAccordion">
                    <div class="accordion-body">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Product Image</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="detail" items="${order.orderDetails}">
                                <tr>
                                    <td>
                                        <img src="/images/product/${detail.product.image}" alt="Product Image" class="img-thumbnail" style="width: 150px; height: 150px;">
                                    </td>
                                    <td>${detail.product.name}</td>
                                    <td>$${detail.product.price}</td>
                                    <td>${detail.quantity}</td>
                                    <td>$${detail.quantity * detail.product.price}</td>
                                </tr>
                            </c:forEach>

                            <c:if test="${order.status eq 'PENDING'}">
    <form:form action="/order/cancel" method="post">
        <input type="hidden" name="orderId" value="${order.id}" />
        <button type="submit" class="btn btn-danger btn-sm mt-2">Hủy đơn hàng</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

    </form:form>
</c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- Order 2 -->
        <!-- <div class="accordion-item">
            <h2 class="accordion-header" id="headingOrder2">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#order2" aria-expanded="false" aria-controls="order2">
                    Order ID: 1002 &nbsp; | &nbsp; <span class="badge bg-warning">Processing</span>
                </button>
            </h2>
            <div id="order2" class="accordion-collapse collapse" aria-labelledby="headingOrder2" data-bs-parent="#orderHistoryAccordion">
                <div class="accordion-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Product Image</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><img src="https://via.placeholder.com/50" alt="Product Image" class="img-thumbnail"></td>
                            <td>Product C</td>
                            <td>$40</td>
                            <td>3</td>
                            <td>$120</td>
                        </tr>
                        <tr>
                            <td><img src="https://via.placeholder.com/50" alt="Product Image" class="img-thumbnail"></td>
                            <td>Product D</td>
                            <td>$20</td>
                            <td>2</td>
                            <td>$40</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div> -->
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>