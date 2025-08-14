<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wishlist</title>
    <style>
        .product-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .product-card {
            border: 1px solid #ddd;
            padding: 10px;
            width: 250px;
            text-align: center;
            border-radius: 5px;
        }
        .product-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
    </style>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 <!-- Thêm Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Thêm Bootstrap JS (để modal hoạt động) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/client/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/client/css/animate.css">
    
    <link rel="stylesheet" href="/client/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/client/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/client/css/magnific-popup.css">

    <link rel="stylesheet" href="/client/css/aos.css">

    <link rel="stylesheet" href="/client/css/ionicons.min.css">

    <link rel="stylesheet" href="/client/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/client/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/client/css/flaticon.css">
    <link rel="stylesheet" href="/client/css/icomoon.css">
    <link rel="stylesheet" href="/client/css/style.css">
</head>
<body>
     <jsp:include page="../layout/header.jsp" />
    <h1>Danh sách các sản phẩm yêu thích </h1>
    <span><a href="/">Trở về trang chủ</a></span>
     
    <div class="product-container">
        <c:forEach var="product" items="${wishlist}">
            <div class="product-card">
                <img src="images/product/${product.image}" alt="Product Image">
                <h3>${product.name}</h3>
                <p>💰 Price: ${product.price} USD</p>
                <p>🏭 Factory: ${product.factory}</p>
                <p>🎯 Target: ${product.target}</p>
                <p>⭐ Rating: ${product.averageRating} / 5</p>
                <p>${product.shortDesc}</p>
                <form action="/product/wishlist/remove/${product.id}" method="post">
                <button type="submit" >Remove</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            </form>
            </div>
        </c:forEach>
    </div>

    <script>
       
    </script>
</body>
</html>

 <!-- function removeFromWishlist(productId) {
            fetch("product/wishlist/remove/" + productId, { method: "POST" })
                .then(response => response.json())
                .then(data => {
                    console.log("data là", data);
                  
                });
        } -->