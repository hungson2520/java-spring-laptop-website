
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
    <link rel="stylesheet" href="/client/css/homepage_show.css">
</head>
<body>
    <jsp:include page="../layout/header.jsp"/>


    <div class="container mt-5">

    <h1 class="text-center mb-4">Danh sách sản phẩm ${searchName} bạn tìm kiếm là</h1>
    <div class="row">
        <!-- Duyệt qua danh sách sản phẩm -->
        <c:forEach var="product" items="${products}">
            <div class="col-md-6 col-lg-4 col-xl-3 mb-4">
                <div class="card h-100">
                    <!-- Hình ảnh sản phẩm -->
                    <a href="/product/${product.id}">
                      <img src="/images/product/${product.image}" class="card-img-top" alt="${product.name}" style="height: 200px; object-fit: cover;">
                  </a>
                    <!-- <img src="/images/product/${product.image}" class="card-img-top" alt="${product.name}" style="height: 200px; object-fit: cover;"> -->
                    <div class="card-body">
                        <!-- Tên sản phẩm -->
                        <h5 class="card-title">
                          <a href="/product/${product.id}">
                          ${product.name}
                        </a>
                        </h5>
                        <!-- Giá sản phẩm -->
                        <p class="card-text"><strong>Giá:</strong> ${product.price} USD</p>
                        <!-- Số lượng có sẵn -->
                        <p class="card-text"><strong>Số lượng Còn Lại :</strong> ${product.quantity}</p>
                        <!-- Mô tả ngắn -->
                        <p class="card-text">${product.shortDesc}</p>
                    </div>
                    <div class="card-footer center    " >
                        <form method="post" action="/add-to-cart/${product.id}">
                          <button class="btn btn-primary" style="width:100%">Add to Cart</button>
                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        </form>
                    </div>
                    
                </div>
            </div>
        </c:forEach>

        <c:if test="${products.size() eq 0}">
            <div style="background-color: grey;height:100px">
             <p style="color: red;"> RẤT TIẾC , SẢN PHẨM BẠN TÌM KIẾM KHÔNG CÓ RỒI</p>
             <p><a href="/">Quay lại</a></p>
            </div>
</c:if>
    </div>

   
    </div>

    <jsp:include page="../layout/footer.jsp"/>

</body>
</html>