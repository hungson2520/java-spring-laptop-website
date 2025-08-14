<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Cấu Hình CPU</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- action="/admin/product-processor/save" modelAttribute="productProcessor" -->
     <div class="container mt-5 d-flex justify-content-center">
    <h2 class="mb-4">Thêm Cấu Hình CPU</h2>
</div>
<div class="container mt-5 d-flex justify-content-center"  >
    
    
    <form:form method="post" action="/admin/product/productProcessor/save/${productId}" modelAttribute="productProcessor">
        <div class="mb-3">
            <label class="form-label">Công nghệ CPU</label>
            <form:input path="cpuTechnology" />
        </div>

        <div class="mb-3">
            <label class="form-label">Số nhân CPU</label>
            <form:input path="coreCount" />
        </div>

        <div class="mb-3">
            <label class="form-label">Số luồng CPU</label>
            <form:input path="threadCount" />
        </div>

        <div class="mb-3">
            <label class="form-label">Tốc độ CPU cơ bản</label>
            <form:input path="baseClockSpeed"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Tốc độ tối đa</label>
            <form:input path="maxClockSpeed" />
        </div>

        

        <button type="submit" class="btn btn-primary">Lưu</button>
    </form:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>