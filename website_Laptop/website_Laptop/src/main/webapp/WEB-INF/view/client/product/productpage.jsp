

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<link href="css/style.css" rel="stylesheet" type="text/css" />


<!-- <link th:href="@{/resources/css/style.css}" rel="stylesheet" type="text/css"/> -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<jsp:include page="../layout/header.jsp"/>

<div style="display: flex;">
<div class="filter-container" style="margin-top: 120px;">
    <!-- Filter by Factory -->
    <div class="filter-section" id="factoryFilter">
        <h4>Filter by Factory</h4>
        <div>
            <input type="checkbox" id="factory-samsung" name="factory" value="Samsung">
            <label for="factory-samsung">Samsung</label>
        </div>
        <div>
            <input type="checkbox" id="factory-apple" name="factory" value="Apple">
            <label for="factory-apple">Apple</label>
        </div>
        <div>
            <input type="checkbox" id="factory-dell" name="factory" value="Dell">
            <label for="factory-dell">Dell</label>
        </div>
        <div>
            <input type="checkbox" id="factory-asus" name="factory" value="Asus">
            <label for="factory-asus">Asus</label>
        </div>
        <div>
            <input type="checkbox" id="factory-acer" name="factory" value="Acer">
            <label for="factory-acer">Acer</label>
        </div>
        <div>
            <input type="checkbox" id="factory-lenovo" name="factory" value="Lenovo">
            <label for="factory-lenovo">Lenovo</label>
        </div>
    </div>

    <!-- Filter by Target Audience -->
    <div class="filter-section" id="targetFilter">
        <h4>Filter by Target Audience</h4>
        <div>
            <input type="checkbox" id="target-office-worker" name="target" value="Office-Worker">
            <label for="target-office-worker">Office Worker</label>
        </div>
        <div>
            <input type="checkbox" id="target-gaming" name="target" value="Gaming">
            <label for="target-gaming">Gaming</label>
        </div>
        <div>
            <input type="checkbox" id="target-coding" name="target" value="Coding">
            <label for="target-coding">Coding</label>
        </div>
        <div>
            <input type="checkbox" id="target-office-it" name="target" value="Office-IT">
            <label for="target-office-it">Office IT</label>
        </div>
        <div>
            <input type="checkbox" id="target-graphic-design" name="target" value="Graphic-Design">
            <label for="target-graphic-design">Graphic Design</label>
        </div>
    </div>

    <!-- Filter by Price Range -->
    <div class="filter-section" id="priceFilter">
        <h4>Filter by Price Range</h4>
        <div>
            <input type="checkbox" id="price-0-250" name="price" value="0-toi-250-USD">
            <label for="price-0-250">0 - 250 USD</label>
        </div>
        <div>
            <input type="checkbox" id="price-250-500" name="price" value="250-toi-500-USD">
            <label for="price-250-500">250 - 500 USD</label>
        </div>
        <div>
            <input type="checkbox" id="price-500-700" name="price" value="500-toi-700-USD">
            <label for="price-500-700">500 - 700 USD</label>
        </div>
        <div>
            <input type="checkbox" id="price-700-1000" name="price" value="700-toi-1000-USD">
            <label for="price-700-1000">700 - 1000 USD</label>
        </div>
        <div>
            <input type="checkbox" id="price-1000-1500" name="price" value="1000-toi-1500-USD">
            <label for="price-1000-1500">1000 - 1500 USD</label>
        </div>
        <div>
            <input type="checkbox" id="price-1500-2000" name="price" value="1500-toi-2000-USD">
            <label for="price-1000-1500">1500 - 2000 USD</label>
        </div>
        <div>
            <input type="checkbox" id="price-1000" name="price" value="lon-hon-2000-USD">
            <label for="price-1000">2000 USD trở lên</label>
        </div>
    </div>

    <!-- Sort by Price -->
    <div class="filter-section" id="priceOrderFilter">
        <h4>Sort by Price</h4>
        <div>
            <input type="radio" id="sort-asc" name="sort" value="asc">
            <label for="sort-asc">Tăng dần</label>
        </div>
        <div>
            <input type="radio" id="sort-desc" name="sort" value="desc">
            <label for="sort-desc">Giảm dần</label>
        </div>
        <div>
            <input type="radio" id="sort-none" name="sort" value="none" checked>
            <label for="sort-none">Không sắp xếp</label>
        </div>
    </div>

    <!-- Submit Button -->
    <div class="filter-section">
        <button class="btn btn-primary" type="button" onclick="applyFilters()">Apply Filters</button>
    </div>
</div>
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
                        <p class="card-text">${product.shortDesc}</p>
                    </div>
                    <div class="card-footer text-center d-flex justify-content-center" >
                        <a href="/product/${product.id}" class="btn btn-primary">Xem chi tiết</a>
                        <form method="post" action="/add-to-cart/${product.id}">
                          <button class="btn btn-primary">Add to Cart</button>
                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        </form>
                    </div>
                    
                </div>
            </div>
        </c:forEach>
    </div>
  </div>
</div>


<style>
    .filter-container {
        border: 1px solid #ddd;
        padding: 15px;
        margin: 20px;
        width: 300px;
    }
    
    .filter-section {
        margin-bottom: 20px;
    }
    
    .filter-section h4 {
        margin-bottom: 10px;
    }
    
    .filter-section div {
        margin-bottom: 5px;
    }
    
    button {
        width: 100%;
    }
</style>

<script>
    function applyFilters1() {
        // Get selected factories
        const selectedFactories = Array.from(document.querySelectorAll('input[name="factory"]:checked')).map(input => input.value);
        console.log('Selected Factories:', selectedFactories);
    
        // Get selected target audiences
        const selectedTargets = Array.from(document.querySelectorAll('input[name="target"]:checked')).map(input => input.value);
        console.log('Selected Target Audiences:', selectedTargets);
    
        // Get selected price ranges
        const selectedPrices = Array.from(document.querySelectorAll('input[name="price"]:checked')).map(input => input.value);
        console.log('Selected Price Ranges:', selectedPrices);
    
        // Get selected sort option
        const selectedSort = document.querySelector('input[name="sort"]:checked').value;
        console.log('Selected Sort Option:', selectedSort);
    
        // You can now send these values to your backend for filtering products
    }

    function applyFilters() {
        const params = new URLSearchParams();
        const currentUrl =new URL(window.location.href);
        const searchParams= currentUrl.searchParams;
    
        // Lấy tất cả các checkbox đã được chọn
        const checkedFactories = Array.from(document.querySelectorAll('#factoryFilter input[type="checkbox"]:checked'))
            .map(checkbox => checkbox.value);
            console.log("checkFactories", checkedFactories);
        const checkedTargets = Array.from(document.querySelectorAll('#targetFilter input[type="checkbox"]:checked'))
            .map(checkbox => checkbox.value);
            console.log("checkTarget", checkedTargets);

        const checkedPrices = Array.from(document.querySelectorAll('#priceFilter input[type="checkbox"]:checked'))
            .map(checkbox => checkbox.value);
            console.log("checkPrices", checkedPrices);
    
        // Lấy lựa chọn sắp xếp
        const sortOption = document.querySelector('#priceOrderFilter input[name="sort"]:checked').value;
        console.log("sortOption là", sortOption);
         searchParams.delete('factory');
         searchParams.delete('target');
         searchParams.delete('price');
         searchParams.delete('sort')
        // Thêm các tham số vào URL
        if (checkedFactories.length > 0) {
            params.append('factory', checkedFactories.join(','));
            searchParams.append('factory', checkedFactories.join(','));
        }
        if (checkedTargets.length > 0) {
            params.append('target', checkedTargets.join(','));
            searchParams.append('target', checkedTargets.join(','));
        }
        if (checkedPrices.length > 0) {
            params.append('price', checkedPrices.join(','));
            searchParams.append('price', checkedPrices.join(','))
        }
        if (sortOption !== 'none') {
            params.append('sort', sortOption);
            searchParams.append('sort',sortOption)
        }
    
        // Cập nhật URL mà không reload trang
        const newUrl = `${window.location.href}?${params.toString()}`;
       
        searchParams.set("page",1)
        window.history.pushState({}, '', newUrl);
        console.log("params là: ", Object.fromEntries(params.entries()));
window.location.href= currentUrl.toString();       
    }
</script>

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