<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card text-center">
            <div class="card-header bg-success text-white">
                <h2>Đặt Hàng Thành Công!</h2>
            </div>
            <div class="card-body">
                <h5 class="card-title">Cảm ơn bạn đã đặt hàng tại trang web của chúng tôi.</h5>
                <p class="card-text">
                    Đơn hàng của bạn sẽ được giao tới trong vòng vài ngày tới.
                </p>
                <a href="/" class="btn btn-primary">Quay về trang chủ</a>
            </div>
            <div class="card-footer text-muted">
                Mọi thắc mắc xin liên hệ <a href="mailto:support@yourwebsite.com">support@yourwebsite.com</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>