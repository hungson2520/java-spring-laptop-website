<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link th:href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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


        $(document).ready(function() {
            // Kiểm tra xem ảnh cũ có tồn tại không
            const oldImage = $('#imagePreview').attr('src');
            if (oldImage && oldImage.trim() !== "") {
                // Hiển thị ảnh cũ
                $('#imagePreview').show();
            } else {
                // Ẩn thẻ img nếu không có ảnh cũ
                $('#imagePreview').hide();
            }
    
            // Xử lý xem trước ảnh mới khi người dùng upload
            $('#imageUpload').on('change', function(event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        // Hiển thị ảnh mới
                        $('#imagePreview').attr('src', e.target.result).show();
                    };
                    reader.readAsDataURL(file);
                }
            });
        });
    </script>
</head>
<body>
    <!-- modelAttribute="product" -->
    <body class="sb-nav-fixed">
        <jsp:include page="../layout/header.jsp"/>
    
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="../layout/sidebar.jsp"/>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">CHỈNH SỬA SẢN PHẨM</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">THÊM VÀO CÁC CHI TIẾT SẢN PHẨM</li>
                        </ol>
                        <h3>Thêm vào cho sản phẩm</h3>
                        <div class="d-flex justify-content-between ">
                            <button class="btn btn-primary"> <a href="/admin/product/productImage/${productId}"> Danh sách hình ảnh</a></button>
                            <button class="btn btn-success"><a href="/admin/product/productProcessor/${productId}">Bộ Vi Xử Lý</a></button>
                            <button class="btn btn-danger">Pin và sạc</button>
                            <button class="btn btn-warning">Tiện ích</button>
                            <button class="btn btn-info">Kết nối</button>
                            <button class="btn btn-dark">Thiết kế và chất liệu</button>
                            <button class="btn btn-secondary">Tiện ích</button>
                        </div>
                        <div class="row justify-content-center mt-5">
                            <div class="col-md-10">
                                <div class="card p-4">
                                    <h2 class="text-center mb-4">Update Product</h2>
                                    <form:form method="post" action="/admin/product/update" modelAttribute="product" class="container mt-5" enctype="multipart/form-data">
    <div class="row">
        <!-- Name -->
        <div class="col-md-6 mb-3">
            <spring:bind path="product.name">
                <form:label path="name" class="form-label">Product Name:</form:label>
                <form:input 
                    path="name" 
                    class="form-control ${status.error ? 'is-invalid' : ''}" 
                />
                <form:errors path="name" cssClass="invalid-feedback" />
            </spring:bind>
        </div>
        <!-- Price -->
        <div class="col-md-6 mb-3">
            <spring:bind path="product.price">
                <form:label path="price" class="form-label">Price:</form:label>
                <form:input 
                    path="price" 
                    class="form-control ${status.error ? 'is-invalid' : ''}" 
                    type="number" 
                    step="0.1"
                />
                <form:errors path="price" cssClass="invalid-feedback" />
            </spring:bind>
        </div>
    </div>
    <div class="row">
        <!-- Quantity -->
        <div class="col-md-6 mb-3">
            <spring:bind path="product.quantity">
                <form:label path="quantity" class="form-label">Quantity:</form:label>
                <form:input 
                    path="quantity" 
                    class="form-control ${status.error ? 'is-invalid' : ''}" 
                    type="number"
                />
                <form:errors path="quantity" cssClass="invalid-feedback" />
            </spring:bind>
        </div>
        <!-- Factory -->
        <div class="col-md-6 mb-3">
            <spring:bind path="product.factory">
                <form:label path="factory" class="form-label">Factory:</form:label>
                <form:select 
                    path="factory" 
                    class="form-select ${status.error ? 'is-invalid' : ''}">
                    <form:option value="">------Select Factory-----</form:option>
                    <form:option value="Samsung">Samsung</form:option>
                    <form:option value="Apple">Apple</form:option>
                    <form:option value="Dell">Dell</form:option>
                    <form:option value="Asus">Asus</form:option>
                    <form:option value="Acer">Acer</form:option>
                    <form:option value="Lenovo">Lenovo</form:option>
                </form:select>
                <form:errors path="factory" cssClass="invalid-feedback" />
            </spring:bind>
        </div>
    </div>
    <div class="mb-3">
        <form:label path="shortDesc" class="form-label">Short Description:</form:label>
        <form:textarea path="shortDesc" class="form-control" rows="2"></form:textarea>
    </div>
    <div class="mb-3">
        <form:label path="detailDesc" class="form-label">Detailed Description:</form:label>
        <form:textarea path="detailDesc" class="form-control" rows="5"></form:textarea>
    </div>
    <div class="row">
        <!-- Target -->
        <div class="col-md-6 mb-3">
            <spring:bind path="product.target">
                <form:label path="target" class="form-label">Target Audience:</form:label>
                <form:select path="target" class="form-select ${status.error ? 'is-invalid' : ''}">
                    <form:option value="">------Select Target Audience-----</form:option>
                    <form:option value="Office-Worker">Office Worker</form:option>
                    <form:option value="Gaming">Gaming</form:option>
                    <form:option value="Coding">Coding</form:option>
                    <form:option value="Office-IT">Office IT</form:option>
                    <form:option value="Graphic-Design">Graphic Design</form:option>
                </form:select>
                <form:errors path="target" cssClass="invalid-feedback" />
            </spring:bind>
        </div>
        <!-- Image Upload -->
        <div class="col-md-6 mb-3">
            <label for="imageUpload" class="form-label">Product Image:</label>
            <input class="form-control" type="file" id="imageUpload" accept="image/*" name="file" />
        </div>
    </div>
    <div class="mb-3">
        <img id="imagePreview" src="/images/product/${product.image}" alt="Preview Image" class="img-thumbnail" style="display:none; max-width: 500px; max-height: 800px;">
    </div>
    <button type="submit" class="btn btn-primary">Update</button>
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
        <script>
            // Script to preview the uploaded image
            const imageInput = document.getElementById('imageUpload');
            const imagePreview = document.getElementById('imagePreview');
            imageInput.addEventListener('change', (event) => {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        imagePreview.src = e.target.result;
                        imagePreview.style.display = 'block';
                    };
                    reader.readAsDataURL(file);
                }
            });
        </script>
    </body>
</body>
</html>


<style>
    button {
        margin-left: 10px;
    }

    a{
        all: unset; /* Xóa tất cả các thuộc tính mặc định */
        text-decoration: none; /* Xóa gạch chân */
        color: inherit; /* Màu chữ kế thừa từ thẻ cha */
        background: none; /* Xóa background */
        border: none; /* Xóa viền */
        padding: 0;
        margin: 0;
        font-size: inherit;
        font-weight: inherit;
        text-align: inherit;
        display: inline;
        cursor: pointer;
        outline: none; /* Xóa viền khi focus */
    }

    a:hover{
        font-weight: 100;
    }
</style>