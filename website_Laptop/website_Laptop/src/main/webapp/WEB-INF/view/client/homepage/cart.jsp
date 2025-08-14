<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link th:href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


    
</head>
<body>
    <div class="cart-container" style="width: 80%; margin: 0 auto;">
        <div class="cart-title">Shopping Cart</div>

       
         

       
        <c:if test="${empty cartDetails}">
            <div class="empty-cart-message" style="width:500px; height:100px">
                <p style="color: red;margin-bottom:30px">Không có sản phẩm nào trong giỏ hàng</p>
                <a href="/">Quay Lại Trang Home</a>
            </div>
        </c:if>
        <c:if test="${not empty cartDetails}">
        <c:forEach var="product1" items="${cartDetails}">
            <div class="cart-item" data-product-id="${product1.product.id}">
                <a href="/product/${product1.product.id}">
                <img src="/images/product/${product1.product.image}" alt="${product1.product.name}" class="cart-item-img" style=" object-fit: cover;">
                </a>
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
    
                <div class="quantity-control">
                    <button  id="decrease-${product1.product.id}" class="decrease-btn"   >-</button>
                    <input readonly class="quantity-input"  id="quantity-${product1.product.id}" type="number" value="${product1.quantity}"   >
                    <button id="increase-${product1.product.id}" class="increase-btn"  >+</button>
                </div>
    
                <!-- Tổng giá -->
                <div  id="total-${product1.product.id}"  class="item-total">
                    <strong>Total:</strong> ${product1.product.price * product1.quantity} USD
                </div>
    
                <!-- Nút xóa sản phẩm -->
                 <form action="/delete-card/${product1.id}" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                <button class="remove-btn" >X</button>
            </form>
            </div>
        </c:forEach>

      

 




        <a href="/">Return Home Page</a>


  

        <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
            <div class="cart-summary" style="text-align: right; margin-top: 20px;">
                <h1>Thông Tin đơn hàng </h1>
    
                <div class="subtotal">
                    <strong>Subtotal:</strong> <span id="subtotal">0</span> USD
                </div>
                <div class="shipping">
                    <strong>Shipping Fee:</strong> <span id="shipping-fee">0</span> USD
                </div>
                <div class="total">
                    <strong>Total Amount:</strong> <span id="total-amount">0</span> USD
                </div>
                <input type="hidden" name="subtotal" id="subtotal-input" value="100">
    <input type="hidden" name="shippingFee" id="shipping-fee-input" value="190">
    <input type="hidden" name="totalAmount" id="total-amount-input" value="110">
    
                <button class="btn btn-success"> Proceed to Checkout</button>
            </div> 
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    
        
        <div class="cart-container1" style="display: none;">
            <c:forEach var="cartDetail" items="${cart.cartDetails}" varStatus="status">
                <div class="cart-item1" data-product-id="${cartDetail.product.id}">
                   
                    <div class="form-control item-product-id1" style="display: block;" data-product-id="${cartDetail.product.id}" name="cartDetails[${status.index}].product.id">
                        ${cartDetail.product.id}
                  </div>
                  <div class="form-control item-product-id1" style="display: block;" data-product-price="${cartDetail.product.price}" name="cartDetails[${status.index}].product.price">
                    ${cartDetail.product.price}
              </div>
              <div class=" form-control item-product-id1" style="display: block;" data-product-image="${cartDetail.product.image}" name="cartDetails[${status.index}].product.image">
                ${cartDetail.product.image}
          </div>
          <div class=" form-control item-product-id1" style="display: block;" data-product-image="${cartDetail.product.name}" name="cartDetails[${status.index}].product.name">
            ${cartDetail.product.name}
      </div>
          <input type="hidden" name="cartDetails[${status.index}].product.id" value="${cartDetail.product.id}">
<input type="hidden" name="cartDetails[${status.index}].product.price" value="${cartDetail.product.price}">
<input type="hidden" name="cartDetails[${status.index}].product.image" value="${cartDetail.product.image}">
<input type="hidden" name="cartDetails[${status.index}].product.name" value="${cartDetail.product.name}">


                
                    <div class="id-quantity-control">
                        <label>ID</label>
                        <input readonly data-cart-detail-index="${status.index}"  name="cartDetails[${status.index}].id"  class="form-control cartDetail-id"  type="number" path="cartDetails[${status.index}].Id" value="${cartDetail.id}" />
                        <label>Số lượng sản phẩm</label>
                        <input  readonly id="quantity1-${cartDetail.product.id}"  name="cartDetails[${status.index}].quantity" class="form-control" type="number"  path="cartDetails[${status.index}].quantity"  value="${cartDetail.quantity}" min="1" />
                    </div>

        
                   
                </div>
            </c:forEach>
            <button> XAC NHAN THANH TOAN</button>

        </div>
        </form:form>
       

        <!-- <div class="cart-total" style="text-align: right; margin-top: 20px;">
            <strong>Total Amount:</strong> ${sessionScope.sum} USD
        </div> -->
        <div class="checkout-container"  style="display: none;">
            <a href="/checkout" class="btn btn-primary">Proceed to Checkout</a>
        </div>
    </c:if>
        
    </div>

    <script>
        
        function updateItemTotal(item) {
            const quantity = item.querySelector('input').value;
         //   console.log("số lượng là ", quantity);
            const price = item.querySelector('.item-price').dataset.price;
        //    console.log("price là :", price);
            const totalElement = item.querySelector('.item-total');
       //     console.log("totalElement là : ", totalElement);
            totalElement.textContent = `$${(quantity * price)}`;
        }

        document.querySelectorAll('.increase-btn').forEach(button => {
            button.addEventListener('click', function () {
                const item = button.closest('.cart-item');
                const input = item.querySelector('input');
                input.value = parseInt(input.value) + 1;
                updateItemTotal(item);
            });
        });

        document.querySelectorAll('.decrease-btn').forEach(button => {
            button.addEventListener('click', function () {
                const item = button.closest('.cart-item');
                const input = item.querySelector('input');
                if (input.value > 1) {
                    console.log("input.value trong nút decrease là", input.value);
                    input.value = parseInt(input.value) - 1;
                    updateItemTotal(item);
                }
            });
        });

         document.querySelectorAll('.remove-btn1111').forEach(button => {
            button.addEventListener('click', function () {
                const item = button.closest('.cart-item');
                item.remove();
            });
        });   
        
    </script>
</body>
</html>



<style>
    /* CSS giữ nguyên như trước */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        padding: 20px;
    }

    .cart-container {
        max-width: 1000px;
        margin: 0 auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .cart-title {
        text-align: center;
        font-size: 24px;
        margin-bottom: 20px;
        font-weight: bold;
        color: #333;
    }

    .cart-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 20px;
        border-bottom: 1px solid #ddd;
        padding-bottom: 15px;
    }

    .cart-item img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 8px;
    }

    .item-details {
        flex: 1;
        margin-left: 15px;
    }

    .item-name {
        font-size: 18px;
        font-weight: bold;
        color: #333;
    }

    .item-price {
        font-size: 16px;
        color: #666;
        margin-top: 5px;
    }

    .quantity-control {
        display: flex;
        align-items: center;
    }

    .quantity-control button {
        width: 30px;
        height: 30px;
        font-size: 18px;
        border: none;
        background-color: #007bff;
        color: white;
        border-radius: 4px;
        cursor: pointer;
    }

    .quantity-control input {
        width: 50px;
        height: 30px;
        text-align: center;
        margin: 0 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    .item-total {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }

    .remove-btn {
        font-size: 16px;
        color: #ff0000;
        border: none;
        background: none;
        cursor: pointer;
    }

    .checkout-container {
        text-align: right;
        margin-top: 20px;
    }

    .checkout-btn {
        padding: 10px 20px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }
</style>

<script>
    // Thêm sự kiện cho nút tăng/giảm số lượng
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy tất cả các sản phẩm trong giỏ

        const subtotalElement = document.getElementById("subtotal");
        const shippingFeeElement = document.getElementById("shipping-fee");
        const totalAmountElement = document.getElementById("total-amount");
        const cartItems = document.querySelectorAll(".cart-item");
         // Giá trị tiền ship mặc định
         let shippingFee = 0;
         const updateCartSummary = () => {
            let subtotal = 0;
         
    
            cartItems.forEach(item => {
                const price = parseFloat(item.querySelector(".item-price").getAttribute("data-price"));
                const quantity = parseInt(item.querySelector("input[type='number']").value);
                subtotal += price * quantity;
            });
    
            // Cập nhật giao diện
            subtotalElement.textContent = subtotal.toFixed(2);
            shippingFeeElement.textContent = shippingFee.toFixed(2);

            totalAmountElement.textContent = (subtotal + shippingFee).toFixed(2);
        };
       

        cartItems.forEach(item => {
            const priceElement = item.querySelector(".item-price");
            const price = parseFloat(priceElement.getAttribute("data-price")); // Lấy giá sản phẩm
            const quantityInput = item.querySelector("input[type='number']");
            const totalElement = item.querySelector(".item-total");

            const decreaseBtn = item.querySelector(".decrease-btn");
            const increaseBtn = item.querySelector(".increase-btn");
            const idProduct = item.querySelector(".item-product-id");
            const cartDetailId= item.querySelector(".item-cartdetail-id");


             // Hàm cập nhật tổng tiền (subtotal, shipping, total)
             

            // Hàm cập nhật tổng tiền
            const updateTotal = (e) => {
                const quantity = parseInt(quantityInput.value);

                const total = price * quantity;

             //   totalElement.innerHTML = `<strong>Total:${total} USD</strong> `;
             totalElement.innerHTML = "<strong>Total: " + total.toFixed(2) + " USD</strong>";

                updateCartSummary();
            };

            // Sự kiện nút giảm
            decreaseBtn.addEventListener("click", function () {
                if (quantityInput.value > 1) {
                    quantityInput.value = parseInt(quantityInput.value) ;
                  //  const productId = decreaseBtn.dataset.productId; // Giả sử nút có data-product-id
                  const productId= idProduct.getAttribute("data-product-id");
                  const cartDetailIdNe= cartDetailId.getAttribute("data-cartdetail-id")
                    updateCart("remove", productId, cartDetailIdNe);

                    updateTotal();
                }
                else {
                    updateTotal()
                }

              
        
            });

            // Sự kiện nút tăng
            increaseBtn.addEventListener("click", function (e) {

                quantityInput.value = parseInt(quantityInput.value) ;
               // const productId = increaseBtn.dataset.productId; // Giả sử nút có data-product-id
               const productId=idProduct.getAttribute("data-product-id");
               const cartDetailIdNe= cartDetailId.getAttribute("data-cartdetail-id")
                updateCart("add", productId);

                updateTotal();
            });

            // Sự kiện khi thay đổi trực tiếp số lượng
            quantityInput.addEventListener("input", function () {
                if (quantityInput.value < 1) {
                    quantityInput.value = 1; // Không cho phép số lượng nhỏ hơn 1
                }
                updateTotal();
            });
           

       


        });
         // Cập nhật tổng tiền lần đầu
         updateCartSummary();

    });




    function updateQuantity(productId, change) {
        const quantityInput = document.getElementById(`quantity-${productId}`);
        const formQuantityInput = document.getElementById(`form-quantity-${productId}`);
        
        // Lấy giá trị hiện tại và tính giá trị mới
        let currentQuantity = parseInt(quantityInput.value, 10) || 1;
        let newQuantity = currentQuantity + change;
    
        // Đảm bảo số lượng không nhỏ hơn 1
        if (newQuantity < 1) {
            newQuantity = 1;
        }
    
        // Cập nhật giá trị trong cả hai input
        quantityInput.value = newQuantity;
        formQuantityInput.value = newQuantity;
     


    }

    function syncQuantity(productId) {
        const quantityInput = document.getElementById(`quantity-${productId}`);
        const formQuantityInput = document.getElementById(`form-quantity-${productId}`);
        
        // Cập nhật giá trị trong form từ giá trị người dùng nhập
        formQuantityInput.value = quantityInput.value;
    }



    // Hàm gửi AJAX tới server
function updateCart(action, productId,cartDetailId) {
    console.log("action là", action);
    const csrfToken = document.querySelector("input[name='_csrf']").value;
    if(action=="add"){
        fetch(`/cart/add`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-TOKEN": csrfToken,
            },
            body: JSON.stringify({ productId: productId }),
        })
            .then((response) => {
                console.log("response là", response);
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then((data) => {
                console.log("Cập nhật giỏ hàng thành công:", data);
                // Cập nhật giao diện nếu cần
                console.log("totalQuantity id ", document.getElementById("totalQuantity"));
               // document.getElementById("totalQuantity").textContent = data.totalQuantity;
             //   document.getElementById("sum").textContent = data.sum;
              // Reload lại trang
          //    location.reload();
              
            })
            .catch((error) => {
                console.error("Lỗi khi cập nhật giỏ hàng:", error);
                 console.log(error.response);
                  // Reload lại trang
            //    location.reload();
    
    
            });
    }
    else {

    fetch(`/cart/remove`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRF-TOKEN": csrfToken,
        },
        body: JSON.stringify({ cartDetailId:cartDetailId}),
    })
        .then((response) => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then((data) => {
            console.log("Cập nhật giỏ hàng thành công:", data);
            // Cập nhật giao diện nếu cần
            document.getElementById("totalQuantity").textContent = data.totalQuantity;
            document.getElementById("sum").textContent = data.sum;
             // Reload lại trang
          //   location.reload();
        })
        .catch((error) => {
            console.error("Lỗi khi cập nhật giỏ hàng:", error);
             console.log(error.response);
              // Reload lại trang
          //    location.reload();


        });
    }
}



document.addEventListener('DOMContentLoaded', function() {
    // Lắng nghe sự thay đổi trong input của form 1
    document.querySelectorAll('.quantity-input').forEach(input => {
      
        input.addEventListener('input', function() {
            console.log("đã vô form thay đổi số lượng form 1 và form 2 nè");
            const productId = this.id.split('-')[1]; // Lấy ID sản phẩm từ id của input
            const quantity = this.value;

            // Cập nhật giá trị số lượng trong form 2
            const form2QuantityInput = document.querySelector(`#quantity-${productId}`);
            console.log("form2QuantityInput là", form2QuantityInput);
            if (form2QuantityInput) {
                form2QuantityInput.value = quantity;
            }

            // Cập nhật tổng giá trong form 1
            const price = document.querySelector(`#price[data-price="${productId}"]`).dataset.price;
            const totalPrice = price * quantity;
            const totalElement = document.querySelector(`#total-${productId}`);
            if (totalElement) {
                totalElement.textContent = `Total: ${totalPrice} USD`;
            }
        });
    });
});






  

document.addEventListener("DOMContentLoaded", function () {
    // Lấy tất cả các nút tăng và giảm trong form 1
    const increaseButtons = document.querySelectorAll(".quantity-control .increase-btn");
    const decreaseButtons = document.querySelectorAll(".quantity-control .decrease-btn");
    console.log("  increaseButtons là: ", increaseButtons);
    console.log("decreaseButtons  là ",decreaseButtons );
  
    // Lắng nghe sự kiện click cho nút tăng
    increaseButtons.forEach((button) => {
      button.addEventListener("click", function () {
        console.log(" vô sự kiện nút tăng nè");
        // Lấy productId từ ID của nút (VD: increase-1 => productId = 1)
        const productId = this.id.split("-")[1];
        console.log("productId là", productId);
  
        // Lấy input tương ứng trong form 1
        console.log(`{productId là} ${productId}`);
        const input = document.querySelector(`#quantity-`+productId);
        console.log("input là", input);
        if (input) {
          let currentValue = parseInt(input.value) || 0;
          input.value = currentValue ;
  
          // Đồng bộ giá trị vào form 2
          const form2Input = document.querySelector(`#quantity1-`+productId);
          if (form2Input) {
            form2Input.value = input.value;
            console.log("đã gán thành công ");
          } else {
            console.error(`Không tìm thấy input tương ứng trong form 2 cho productId: ${productId}`);
          }
        }
      });
    });
  
    // Lắng nghe sự kiện click cho nút giảm
    decreaseButtons.forEach((button) => {
      button.addEventListener("click", function () {
        // Lấy productId từ ID của nút (VD: decrease-1 => productId = 1)
        const productId = this.id.split("-")[1];
  
        // Lấy input tương ứng trong form 1
     //   const input = document.querySelector(`#quantity-${productId}`);
     const input = document.querySelector(`#quantity-`+productId);
        if (input) {
          let currentValue = parseInt(input.value) || 0;
          // Đảm bảo số lượng không giảm dưới 1
          if (currentValue > 1) {
            input.value = currentValue;
  
            // Đồng bộ giá trị vào form 2
       //     const form2Input = document.querySelector(`#quantity1-${productId}`);
       const form2Input = document.querySelector(`#quantity1-`+productId);

            if (form2Input) {
              form2Input.value = input.value;
            } else {
              console.error(`Không tìm thấy input tương ứng trong form 2 cho productId: ${productId}`);
            }
          }
        }
      });
    });
  });


</script>