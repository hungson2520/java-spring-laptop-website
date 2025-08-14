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
                        <h1 class="mt-4">CHI TIẾT SẢN PHẨM</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Chi Tiết Sản Phẩm</li>
                        </ol>
                        
                      
                        
                    </div>
                    <div class="container mt-5">
                        <h1 class="text-center mb-4">Product Details</h1>
                        <div class="row">
                            <!-- Hình ảnh sản phẩm -->
                            <div class="col-md-6">
                                <img src="/images/product/${product.image}" alt="${product.name}" class="img-fluid">
                            </div>
                
                            <!-- Thông tin sản phẩm -->
                            <div class="col-md-6">
                                <h2>${product.name}</h2>
                                <p><strong>Price:</strong> $${product.price}</p>
                                <p><strong>Quantity:</strong> ${product.quantity}</p>
                                <p><strong>Sold:</strong> ${product.sold}</p>
                                <p><strong>Factory:</strong> ${product.factory}</p>
                                <p><strong>Target Audience:</strong> ${product.target}</p>
                                <p><strong>Short Description:</strong> ${product.shortDesc}</p>
                                <p><strong>Detail Description:</strong></p>
                                <p>${product.detailDesc}</p>
                
                                <!-- Nút quay lại -->
                                <a href="/admin/product" class="btn btn-secondary mt-3">Back to List</a>
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
