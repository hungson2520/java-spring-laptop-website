<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<!-- Bootstrap JS (CDN) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

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


<!-- Bootstrap JavaScript (Bundle with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body class="goto-here">

  <jsp:include page="../layout/header.jsp"/>
 





<jsp:include page="../layout/banner.jsp"/>


    
    <jsp:include page="../layout/feature.jsp" />

   
    <div class="container mt-5">
      <h1 class="text-center mb-4">Danh sách sản phẩm</h1>
    

      
     
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

                          <div class="rating d-flex">
                            <p class="text-left mr-4" style="font-size: 20px;">

                              <a href="#" class="mr-2" id="average-rating">${product.averageRating}</a>
                              <span class="stars" data-rating="${product.averageRating}" data-product-id="${product.id}">
                             
                             </span>
                            </p>
              
                           
                          </div>
                          <p class="card-text">${product.shortDesc}</p>
                      </div>
                      <div class="d-flex justify-content-center">
                       
                          
                 
                 
                  <form method="post" action="/product/add-to-wishlist/${product.id}">
    <button type="submit" 
            id="liveToastWishListBtn-${product.id}" 
            class="btn btn-light" 
            onclick="toggleWishlist(${product.id})">
        <i class="bi bi-heart-fill" id="wishlist-icon-${product.id}" 
           style="font-size: 24px;color:grey"></i>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </button>
</form>


                  
                  </div>
                      <div class="card-footer center    " >
                          <form method="post" action="/add-to-cart/${product.id}" onsubmit="showToast(event)">
                            <button  id="liveToastBtn" class="btn btn-primary" style="width:100%">Add to Cart</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                          </form>
                         

                          <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
                            <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                              <div class="toast-header">
                                <img src="..." class="rounded me-2" alt="...">
                                <strong class="me-auto">Bootstrap</strong>
                               
                                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                              </div>
                              <div class="toast-body">
                             Đã thêm sản phẩm vào giỏ hàng thành công!
                              </div>
                            </div>
                          </div>

                      </div>
                   <!-- Toast thông báo -->

                      
                  </div>
              </div>
          </c:forEach>
      </div>
    </div>
  
<jsp:include page="../layout/advertise.jsp" />

    


  


<jsp:include page="../layout/customer.jsp"/>
<hr>


    <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
  <div class="container py-4">
    <div class="row d-flex justify-content-center py-5">
      <div class="col-md-6">
          <h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
          <span>Get e-mail updates about our latest shops and special offers</span>
      </div>
      <div class="col-md-6 d-flex align-items-center">
        <form action="#" class="subscribe-form">
          <div class="form-group d-flex">
            <input type="text" class="form-control" placeholder="Enter email address">
            <input type="submit" value="Subscribe" class="submit px-3">
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<jsp:include page="../layout/footer.jsp"/>


<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
  <div id="liveToastWishList" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="toast-header">
          <img src="..." class="rounded me-2" alt="...">
          <strong class="me-auto">Wishlist</strong>
          <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
      <div class="toast-body">
          Đã thêm vào danh sách yêu thích!
      </div>
  </div>
</div>



<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


<script src="/client/js/jquery.min.js"></script>
<script src="/client/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/client/js/popper.min.js"></script>
<script src="/client/js/bootstrap.min.js"></script>
<script src="/client/js/jquery.easing.1.3.js"></script>
<script src="/client/js/jquery.waypoints.min.js"></script>
<script src="/client/js/jquery.stellar.min.js"></script>
<script src="/client/js/owl.carousel.min.js"></script>
<script src="/client/js/jquery.magnific-popup.min.js"></script>
<script src="/client/js/aos.js"></script>
<script src="/client/js/jquery.animateNumber.min.js"></script>
<script src="/client/js/bootstrap-datepicker.js"></script>
<script src="/client/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/client/js/google-map.js"></script>
<script src="/client/js/main.js"></script>

</body>
</html>

<style>
  .card-img-top {
    transition: transform 0.3s ease; /* Thêm hiệu ứng mượt mà */
  }

  .card-img-top:hover {
    transform: translateY(-10px); /* Dịch ảnh lên trên 10px */
    cursor: pointer;
   
  }
  .card-title:hover{
    cursor: pointer;
   color:  yellow;
    
  }card-body
  .card-img-top:hover ~ .card-title a {
    color: yellow !important;
}
  .card-title a:hover {
    color: yellow !important;
}
  .detailbtn{
    background-color: rgb(233, 93, 93);
    border-radius: 30px;
    width: 50%;
    padding: 0.375rem 0.75rem;
    font-size: 15px;
  }
</style>


<script>
  document.addEventListener("DOMContentLoaded", function () {
      let rating = parseFloat(document.getElementById("average-rating").textContent); // Lấy giá trị rating
      console.log("rating là", rating);
      let stars = document.querySelectorAll(".star2");
console.log("stars là", stars);
      stars.forEach(star => {
          let value = parseInt(star.getAttribute("data-value"));
         
          if (rating >= value) {
              star.classList.remove("ion-ios-star-outline");
              star.classList.add("ion-ios-star"); // Biểu tượng sao đầy
          } else if (rating > value - 1 && rating < value) {
              star.classList.remove("ion-ios-star-outline");
              star.classList.add("ion-ios-star-half"); // Biểu tượng sao nửa đầy
          }
      });
  });
</script>





<script>
function showToast(event) {
  event.preventDefault(); // Chặn form submit ngay lập tức

  // Lấy phần tử Toast
  const toastElement = document.getElementById('cart-toast');
  console.log("toastElement là", toastElement);
  const toast = new bootstrap.Toast(toastElement); 

  // Hiển thị Toast
  toast.show();

  // Sau 5 giây submit form
  setTimeout(() => {
      event.target.submit(); 
  }, 5000);
}
</script>

<script>
document.getElementById('liveToastBtn').addEventListener('click', function () {
  var toastEl = document.getElementById('liveToast'); 
  console.log("toastEl là", toastEl);
  var toast = new bootstrap.Toast(toastEl); 
  toast.show();
});






</script>

<script>
  function showToast(event) {
      event.preventDefault(); // Ngăn form submit ngay lập tức
  
      // Hiển thị Bootstrap Toast
      var toastEl = document.getElementById('liveToast');
      var toast = new bootstrap.Toast(toastEl);
      toast.show();
  
      // Sau 5 giây mới gửi form
      setTimeout(() => {
        fetch(event.target.action, {
            method: event.target.method,
            body: new FormData(event.target)
        }).then(response => {
            if (response.ok) {
                // Nếu gửi form thành công, reload trang
                location.reload();
            } else {
                console.error("Lỗi khi gửi form!");
            }
        }).catch(error => console.error("Lỗi kết nối:", error));
    }, 1000);

      
  }
  </script>

  <script>
    document.addEventListener("DOMContentLoaded", function() {
      document.querySelectorAll(".stars").forEach(function(starContainer) {
        let rating = parseFloat(starContainer.getAttribute("data-rating"));
        let productId = starContainer.getAttribute("data-product-id");
        
        let starsHTML = "";
        for (let i = 1; i <= 5; i++) {
          if (i <= rating) {
            console.log("i là", i , "rating là", rating);
            starsHTML += `<span class="ion-ios-star" style="color: gold;"></span>`;
          } 
         else if(rating > i - 1 && rating < i)
         {
          starsHTML += `<span class="ion-ios-star-half" style="color: gray;"></span>`;
         }
          
          else {
            starsHTML += `<span class="ion-ios-star-outline" style="color: gray;"></span>`;
          }
        }
        
        starContainer.innerHTML = starsHTML;
      });
    });
  </script>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
      document.querySelectorAll(".stars").forEach(function (starContainer) {
        let rating = parseFloat(starContainer.getAttribute("data-rating")); 
        let stars = starContainer.querySelectorAll(".star2"); 
  
        stars.forEach(star => {
          let value = parseInt(star.getAttribute("data-value"));
          
          if (rating >= value) {
            star.classList.remove("ion-ios-star-outline");
            star.classList.add("ion-ios-star"); // Sao đầy
          } else if (rating > value - 1 && rating < value) {
            star.classList.remove("ion-ios-star-outline");
            star.classList.add("ion-ios-star-half"); // Sao nửa
          }
        });
      });
    });
  </script>



  <script>

    function toggleWishlist1(productId) {
     
      let wishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
      console.log("productId là", productId);
      const productIndex = wishlist.indexOf(productId);
      const icon = document.getElementById("wishlist-icon-"+productId);
      console.log("icon là", icon);
      
      if (productIndex === -1) {
          wishlist.push(productId);
          icon.classList.remove("ion-ios-heart-outline");
          icon.classList.add("ion-ios-heart");  
      } else {
          wishlist.splice(productIndex, 1);
          icon.classList.remove("ion-ios-heart");
          icon.classList.add("ion-ios-heart-outline"); 
      }
  
      localStorage.setItem("wishlist", JSON.stringify(wishlist));
}   

  document.getElementById('liveToastBtn').addEventListener('click', function () {
    var toastEl = document.getElementById('liveToastWishList');
    console.log("toastEl là", toastEl);
    var toast = new bootstrap.Toast(toastEl);
    toast.show();
});



  function sendWishlistToServer(wishlist) {
    fetch('/wishlist/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ productIds: wishlist })
    })
    .then(response => response.json())
    .then(data => console.log("Wishlist updated:", data))
    .catch(error => console.error("Error updating wishlist:", error));
}
  </script>


  <script>
  // Hàm để kiểm tra sản phẩm có trong wishlist không
  function isInWishlist(productId) {
    const wishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
    return wishlist.includes(productId);
  }

  // Gọi hàm sau khi DOM tải xong
  document.addEventListener("DOMContentLoaded", function() {
    const productId = ${product.id}; // được render sẵn từ JSP
    console.log("productId là", productId);

    if (isInWishlist(productId)) {
      // Nếu đã có trong wishlist, đổi màu nút
      const btn = document.getElementById(`liveToastWishListBtn-${productId}`);
      btn.style.backgroundColor = 'red';
      document.getElementById(`wishlist-icon-${productId}`).style.color = 'white';
    }
  });

  // Khi người dùng click nút, cập nhật localStorage
  function toggleWishlist(productId) {
    
   
    alert("đã toggle")
    let wishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
    console.log("wishlist là", wishlist);

    if (!wishlist.includes(productId)) {
      wishlist.push(productId);
      localStorage.setItem("wishlist", JSON.stringify(wishlist));
    }

    // Bạn có thể thêm dòng để đổi màu ở đây nếu muốn hiệu ứng ngay lập tức
  }
</script>