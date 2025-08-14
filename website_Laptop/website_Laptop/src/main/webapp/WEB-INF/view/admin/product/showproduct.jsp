<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<a%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Product - Trang Admin</title>
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
                    <div class="container-fluid px-4 ">
                        <h1 class="mt-4">PRODUCT</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">PRODUCT</li>
                        </ol>


                        <a class="btn btn-success btn-lg" href="/admin/product/create">
                            <i class="bi bi-plus-circle"></i> Create new Product
                        </a>                      
                        
                       
                    </div>
                    <div class="container mt-5">
                        <h1 class="text-center mb-4">Product List</h1>
                        <table class="table table-hover table-bordered text-center">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Factory</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <td>${product.id}</td>
                                        <td>${product.name}</td>
                                        <td>${product.price}</td>
                                        <td>${product.factory}</td>
                                        <td>
                                            <a href="/admin/products/view/${product.id}" class="btn btn-success btn-sm">View</a>

                                            <a href="/admin/products/edit/${product.id}" class="btn btn-primary btn-sm">Edit</a>
                                            <a href="/admin/products/delete/${product.id}" class="btn btn-danger btn-sm">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <!-- <table class="table table-hover table-bordered text-center">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Factory</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Ví dụ các dòng dữ liệu tĩnh --%>
                                <tr>
                                    <td>1</td>
                                    <td>Product A</td>
                                    <td>$100</td>
                                    <td>Factory X</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm">Edit</button>
                                        <button class="btn btn-danger btn-sm">Delete</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Product B</td>
                                    <td>$200</td>
                                    <td>Factory Y</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm">Edit</button>
                                        <button class="btn btn-danger btn-sm">Delete</button>
                                    </td>
                                </tr>
                               
                             
                            </tbody>
                        </table> -->
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
