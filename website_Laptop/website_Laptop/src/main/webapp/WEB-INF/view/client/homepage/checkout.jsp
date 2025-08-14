<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }

        .cart-item-img {
            width: 100px;
            height: 100px;
            border-radius: 8px;
        }

        .item-details {
            flex: 1;
            margin-left: 20px;
        }

        .item-name a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .item-name a:hover {
            color: #007bff;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-input {
            width: 60px;
            text-align: center;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f8f9fa;
        }

        .item-total {
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .cart-summary {
            text-align: right;
            margin-top: 20px;
        }

        .cart-summary h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .cart-summary div {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .cart-summary .btn-success {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }

        .cart-summary .btn-success:hover {
            background-color: #218838;
        }

        .form-container {
            margin-top: 30px;
        }

        .form-container label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
    <div class="container">
        <c:forEach var="product1" items="${cartDetails}">
            <div class="cart-item" data-product-id="${product1.product.id}">
                <!-- Hình ảnh sản phẩm -->
                <a href="/product/${product1.product.id}">
                    <img src="/images/product/${product1.product.image}" alt="${product1.product.name}" class="cart-item-img" style=" object-fit: cover;">
                </a>
                <!-- Chi tiết sản phẩm -->
                <div class="item-details">
                    <div class="item-name">
                        <a href="/product/${product1.product.id}">
                            ${product1.product.name}
                        </a>
                    </div>
                    <div class="item-product-id" style="display: none;" data-product-id="${product1.product.id}">
                        ${product1.product.id}
                    </div>

                    <div class="item-cartdetail-id" style="display: none;" data-cartdetail-id="${product1.id}">
                        ${product1.id}
                    </div>
                    <div id="price" class="item-price" data-price="${product1.product.price}">
                        <strong>Price:</strong> ${product1.product.price} USD
                    </div>
                </div>

                <!-- Điều chỉnh số lượng -->
                <div class="quantity-control">
                    <input readonly class="quantity-input" id="quantity-${product1.product.id}" type="number" value="${product1.quantity}"   >
                </div>

                <!-- Tổng giá -->
                <div  id="total-${product1.product.id}"  class="item-total">
                    <strong>Total:</strong> ${product1.product.price * product1.quantity} USD
                </div>
            </div>
        </c:forEach>

        <div class="form-container">
            <form:form action="/place-order" method="post" modelAttribute="cart">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                <label for="name">Tên người nhận:</label>
                <input type="text" id="name" name="recieverName" required>

                <label for="address">Địa chỉ người nhận:</label>
                <input type="text" id="address" name="recieverAddress" required>

                <label for="phone">Số điện thoại:</label>
                <input type="tel" id="phone" name="recieverPhone" required>

                <button type="submit">Xác nhận thanh toán</button>
                <div class="cart-summary" style="float: center;">
                    <h1>Thông Tin đơn hàng</h1>
                    <p>Hình thức: THANH TOÁN SAU KHI NHẬN HÀNG</p>
                    <div class="subtotal">
                        <strong>Subtotal:</strong> <span id="subtotal">0</span> USD
                    </div>
                    <div class="shipping">
                        <strong>Shipping Fee:</strong> <span id="shipping-fee">0</span> USD
                    </div>
                    <div class="total">
                        <strong>Total Amount:</strong> <span id="total-amount">0</span> USD
                    </div>
        
                    <button class="btn btn-success">Proceed to Checkout</button>
                </div>
            </form:form>
        </div>

        <!-- <div class="cart-summary" style="float: center;">
            <h1>Thông Tin đơn hàng</h1>
            <p>Hình thức: THANH TOÁN SAU KHI NHẬN HÀNG</p>
            <div class="subtotal">
                <strong>Subtotal:</strong> <span id="subtotal">0</span> USD
            </div>
            <div class="shipping">
                <strong>Shipping Fee:</strong> <span id="shipping-fee">0</span> USD
            </div>
            <div class="total">
                <strong>Total Amount:</strong> <span id="total-amount">0</span> USD
            </div>

            <button class="btn btn-success">Proceed to Checkout</button>
        </div> -->
    </div>
</body>
</html>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy tất cả các sản phẩm trong giỏ

        const subtotalElement = document.getElementById("subtotal");
        const shippingFeeElement = document.getElementById("shipping-fee");
        const totalAmountElement = document.getElementById("total-amount");
        const cartItems = document.querySelectorAll(".cart-item");
        console.log("cartItem là", cartItems);
         // Giá trị tiền ship mặc định
         let shippingFee = 0;
         const updateCartSummary = () => {
            let subtotal = 0;
         
    
            cartItems.forEach(item => {
                const price = parseFloat(item.querySelector(".item-price").getAttribute("data-price"));
                const quantity = parseInt(item.querySelector("input[type='number']").value);
                console.log("price là", price);
                console.log("quantity là", quantity);
                subtotal += price * quantity;
                console.log("subtotal là",subtotal);
            });
    
            // Cập nhật giao diện
            subtotalElement.textContent = subtotal.toFixed(2);
            shippingFeeElement.textContent = shippingFee.toFixed(2);

            totalAmountElement.textContent = (subtotal + shippingFee).toFixed(2);
        };

        updateCartSummary();

    });
</script>