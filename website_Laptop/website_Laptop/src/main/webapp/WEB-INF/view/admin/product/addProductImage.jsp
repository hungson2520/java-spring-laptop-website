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
            // Kiểm tra ảnh cũ và hiển thị nếu có
            const oldImage = $('#imagePreviewContainer img').attr('src');
            if (oldImage && oldImage.trim() !== "") {
                $('#imagePreviewContainer').show();
            } else {
                $('#imagePreviewContainer').hide();
            }
    
            // Xử lý xem trước nhiều ảnh mới khi người dùng tải lên
            $('#imageUpload').change(function (event) {
                const files = event.target.files;
                const previewContainer = $('#imagePreviewContainer');
                previewContainer.empty(); // Xóa ảnh cũ
    
                if (files.length > 0) {
                    previewContainer.show();
                    Array.from(files).forEach(file => {
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            const img = $('<img>').attr('src', e.target.result).addClass('img-thumbnail').css({
                                width: "150px",
                                height: "150px",
                                objectFit: "cover",
                                marginRight: "10px"
                            });
                            previewContainer.append(img);
                        };
                        reader.readAsDataURL(file);
                    });
                } else {
                    previewContainer.hide();
                }
            });
        });
    </script>
</head>



<body>
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
                        <li class="breadcrumb-item active">THÊM VÀO CÁC HÌNH ẢNH CỦA SẢN PHẨM</li>
                    </ol>
                    <form:form method="post" enctype="multipart/form-data"  action="/admin/product/productImage/${productId}">
                        <div class="col-md-6 mb-3">
                            <label for="imageUpload" class="form-label">Product Images:</label>
                            <input class="form-control" type="file" id="imageUpload" accept="image/*" name="files" multiple />
                        </div>
                        <div id="imagePreviewContainer" class="d-flex flex-wrap gap-2">
                            <c:forEach var="img" items="${product.images}">
                                <img src="/images/product/${img}" class="img-thumbnail" style="width:150px; height:150px; object-fit:cover; margin-right:10px;">
                            </c:forEach>
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form:form>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp"/>
        </div>
    </div>
</body>

</html> 




