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
</head>
<body>
    <h1>đây là trang infomation của cá nhân</h1>
    <div class="container mt-5">
        <div class="card shadow-lg p-3 mb-5 bg-body rounded" style="max-width: 600px; margin: auto;">
            <div class="card-body text-center">
                <c:choose>
                    <c:when test="${not empty user.avatar}">
                        <img src=/images/avatar/${user.avatar} alt="Avatar" class="rounded-circle" width="150" height="150">
                    </c:when>
                    <c:otherwise>
                        <img src="https://via.placeholder.com/120" alt="Avatar" class="rounded-circle">
                    </c:otherwise>
                </c:choose>
    
                <h3 class="mt-3">${user.fullName}</h3>
                <p class="text-muted">${user.email}</p>
    
                <div class="mt-4">
                    <p><strong>Địa chỉ:</strong> ${user.address}</p>
                    <p><strong>Số điện thoại:</strong> ${user.phone}</p>
                </div>
    
                <!-- <a href="/edit-profile.jsp" class="btn btn-primary">Chỉnh sửa thông tin</a> -->
                <form method="post" action="/edit-profile">
                    <button class="btn btn-primary" style="width:100%">Cập nhật thông tin</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                  </form>
                  <span><a href="/">Trở về Homepage</a></span>
            </div>
        </div>
</body>
</html>

<style>
    /* Căn giữa tiêu đề */
h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

/* Định dạng container */
.container {
    max-width: 600px;
    background: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    margin-left: 350px;
    margin-top: 30px;
}

/* Định dạng card */
.card {
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Định dạng ảnh avatar */
.rounded-circle {
    border: 3px solid #007bff;
    padding: 5px;
}

/* Định dạng tên user */
h3 {
    font-size: 22px;
    font-weight: bold;
    color: #333;
}

/* Định dạng email */
.text-muted {
    font-size: 16px;
    color: #6c757d;
}

/* Định dạng thông tin cá nhân */
p {
    font-size: 16px;
    margin-bottom: 5px;
}

/* Nút cập nhật */
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