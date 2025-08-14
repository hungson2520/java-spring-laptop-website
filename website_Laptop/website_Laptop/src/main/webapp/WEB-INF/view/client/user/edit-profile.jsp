
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<f%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1> ĐÂY LÀ TRANG EDIT PROFILE NHÉ</h1>
    <div class="container mt-5">
        <h2 class="mb-4">Cập nhật thông tin cá nhân</h2>
        
        <form:form action="/updateInformation" modelAttribute="userUpdate" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="${user.email}" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">Họ và tên</label>
                <input type="text" class="form-control" name="fullName" value="${user.fullName}">
            </div>

            <div class="mb-3">
                <label class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" name="address" value="${user.address}">
            </div>

            <div class="mb-3">
                <label class="form-label">Số điện thoại</label>
                <input type="text" class="form-control" name="phone" value="${user.phone}">
            </div>

                <button class="btn btn-primary" style="width:100%">Cập nhật</button>
                <span><a href="/">Trở về Homepage</a></span>

                
            
        </form:form>
    </div>
</body>
</html>


<style>
    .container {
        max-width: 600px;
        background: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        margin-left: 350px;
        margin-top: 30px;
    }
    
    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }
    
    h2 {
        color: #007bff;
        text-align: center;
    }
    
    .form-label {
        font-weight: bold;
    }
    
    .form-control {
        border-radius: 8px;
        border: 1px solid #ccc;
        padding: 10px;
        font-size: 16px;
    }
    
    input[readonly] {
        background: #f8f9fa;
        color: #6c757d;
    }
    
    .btn-primary {
        width: 100%;
        padding: 10px;
        font-size: 18px;
        border-radius: 8px;
        cursor: pointer;
    }
    
    .btn-primary:hover {
        background: #0056b3;
        transition: 0.3s ease;
    }
    
</style>