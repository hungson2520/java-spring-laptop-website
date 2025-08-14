<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<div class="py-1 bg-primary">
    <div class="container">
        <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
                <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                        <span class="text">+84784902222</span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                        <span class="text">hungson2520@gmail.com</span>
                    </div>
                    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                        <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                    </div>
                </div>
            </div>
        </div>
      </div>
</div>
<nav class="navbar navbar-expand-lg  ftco_navbar navbar-dark bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="/">LEHUSO</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse justify-content-between mx-5" id="ftco-nav">
        <ul class="navbar-nav ">
          <li class="nav-item "><a href="/" class="nav-link">Home</a></li>


          <li class="nav-item active"><a href="/product" class="nav-link">Product</a></li>
          <c:if test="${pageContext.request.userPrincipal == null}">

          <li class="nav-item"><a href="/register" class="nav-link">register</a></li>
          </c:if>


          <c:if test="${pageContext.request.userPrincipal != null}">


          <li class="nav-item dropdown   " >
            <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="bi bi-person fs-3" style="size: 30px;"></i>
  
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" >${sessionScope.fullName}!</a>
                <a class="dropdown-item" href="/InfomationUser">Cập nhật thông tin</a>
                <a class="dropdown-item" href="/orderhistory">Lịch sử đơn hàng</a>
                <hr style="border: none; height: 3px; background-color: black; margin: 10px 0;">
             <form method="post" action="/logout">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

              <button class="dropdown-item" href="product-single.html">Log Out</button>
            </form>

            </div>
            
          </li>
          
          <li class="nav-item cta cta-colored"><a href="/cart" class="nav-link"><span class="icon-shopping_cart fs-3"></span>${sessionScope.totalQuantity}</a></li> 
          <c:if test="${pageContext.request.userPrincipal != null}">

          <li class="nav-item"><a href="/wishlist" class="nav-link">yêu thích </a></li>
          </c:if>

         
          </c:if>
          <c:if test="${pageContext.request.userPrincipal == null}">
            <a href="/login">Login </a>
       </c:if>

        
         <div class="input-group" style="height:70%; margin-top:20px ; margin-left:20px; ">
          <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm sản phẩm...">
          <span class="input-group-text" onclick="handleSearchClick()"><i class="bi bi-search"></i></span>
        </div>

         
        </ul>
      </div>
    </div>
  </nav>

  <style>
    .responsive-margin {
      margin-left: 600px; /* Giá trị mặc định */
    }
    
    @media (max-width: 1200px) {
      .responsive-margin {
        margin-left: 500px; /* Với màn hình nhỏ hơn 1200px */
      }
    }
    
    @media (max-width: 768px) {
      .responsive-margin {
        margin-left: 300px; /* Với màn hình nhỏ hơn 768px */
      }
      .input-group{
        width: 100%;
      }
      #searchInput{
       
        width:50%
      }
    }
    
    @media (max-width: 480px) {
      .responsive-margin {
        margin-left: 20px; /* Với màn hình nhỏ hơn 480px */
      }
    }
  </style>


  <script>
    document.addEventListener("DOMContentLoaded", function () {
      // Get the current URL path
      const currentPath = window.location.pathname;
      const el = event.target;
 if (el && el.nodeType === 1 && el.hasAttribute && el.hasAttribute('data-aos')) {
debounce(refreshHard, 50, true)
 }
  
      // Select all navbar links
      const navLinks = document.querySelectorAll(".navbar-nav .nav-item .nav-link");
      console.log("navlinks là", navLinks);
  
      // Iterate through each link and check its href attribute
      navLinks.forEach(link => {
          if (link.getAttribute("href") === currentPath) {
              // Change the text color to yellow for the active link
              link.style.color = "yellow";
              link.style.fontWeight="900";
          }
      });
  });


  function handleSearchClick() {
    let searchValue = document.getElementById("searchInput").value;
    searchValue=searchValue.trim();

    if(searchValue=="")
    {
      alert("bạn chưa nhập chuỗi cần tìm kiếm")
      return;
    }
    console.log("searchvalue là:: ", searchValue);

    console.log("searchValue là",document.getElementById("searchInput").value);

    window.location.href = "/product/search?name=" +searchValue;

   /* fetch(`/search?name=${searchValue}`, {
      method: 'GET'    })
    .then(response => response.text())
    .then(data => alert("Kết quả tìm kiếm từ database là: " + data))
    .catch(error => console.error('Lỗi:', error));
  
  }  */

  }
  
  </script>

  <style>
    .input-group-text:hover{
      cursor: pointer;
    }
    .input-group-text{
      border-radius: 50%;
      position: absolute;
      right: 0;
      height: 100%;
      z-index: 20;


    }
    .input-group{
      position: relative;
    }
    #searchInput{
      border-radius:35px;
      width: 400px;
    }
  </style>