<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Edit Order Status - Admin</title>
        <link href="/css/style.css" rel="stylesheet" type="text/css" />
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
                        <h1 class="mt-4">EDIT ORDER STATUS</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin/order">Orders</a></li>
                            <li class="breadcrumb-item active">Edit Order Status</li>
                        </ol>
                        <div class="container mt-5">
                            <div class="d-flex justify-content-between mb-2">
                                <h2 class="text-center">Edit Order Status</h2>
                                <a href="/admin/order" class="btn btn-secondary">Back to Orders</a>
                            </div>
                            
                            <div class="mb-4">
                                <h5>Order Information</h5>
                                <p><strong>Order ID:</strong> ${order.id}</p>
                                <p><strong>Total Price:</strong> $${order.totalPrice}</p>
                                <p><strong>Receiver Name:</strong> ${order.recieverName}</p>
                                <p><strong>Receiver Address:</strong> ${order.recieverAddress}</p>
                                <p><strong>Receiver Phone:</strong> ${order.recieverPhone}</p>
                            </div>

                            <form:form action="/admin/order/updateStatus" method="post" modelAttribute="oderEdit">
                                <input type="hidden" name="id" value="${order.id}" />
                                <div class="mb-3">
                                    <label for="status" class="form-label">Order Status</label>
                                    <select id="status" name="status" class="form-control">
                                       
                                                <option value="PENDING">Chờ xử lý</option>
                                                <option value="CONFIRMED">Đã xác nhận</option>
                                                <option value="PACKAGING">Đang đóng gói</option>
                                                <option value="SHIPPING">Đang giao hàng</option>
                                                <option value="DELIVERED">Đã giao thành công</option>
                                                <option value="CANCELLED">Đã hủy</option>
                                                <option value="RETURN_REQUESTED">Yêu cầu trả hàng</option>
                                                <option value="RETURNED">Đã trả hàng thành công</option>
                                                <option value="FAILED">Giao hàng thất bại</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Update Status</button>
                            </form:form>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp"/>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/script.js"></script>
    </body>
</html>