<%@ page contentType="text/html;charset=UTF-8" %>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Tự động hiển thị modal khi trang tải xong -->
<script>
    $(document).ready(function () {
        $("#prizePopup").modal("show");
    });
</script>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>${product.name}-LEHUSO</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 <!-- Thêm Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Thêm Bootstrap JS (để modal hoạt động) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
  </head>
  <body class="goto-here">
    <jsp:include page="../layout/header.jsp" />
	


    <section class="ftco-section">
    	<div class="container">
    		<div class="row d-flex flex-row">
    			<!-- <div class="col-lg-6 mb-5 ftco-animate">
    				<a href="/images/product/${product.image}" class="image-popup"><img src="/images/product/${product.image}" class="img-fluid" alt="Colorlib Template"></a>
    			</div> -->
				<div class="container mt-5 col-5">
					<!-- Carousel chính -->
					<div id="mainCarousel" class="carousel slide" data-bs-ride="false">
						<div class="carousel-inner">
							<c:forEach var="img" items="${images}" varStatus="status">
								<c:if test="${status.index < 3}">
									<div class="carousel-item ${status.first ? 'active' : ''}">
										<img src="/images/product/${img.imageUrl}" class="d-block w-100" alt="Product Image">
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				
					<!-- Thumbnail bên dưới -->
					<div class="mt-3 d-flex justify-content-center">
						<c:forEach var="img" items="${images}" varStatus="status">
							<c:if test="${status.index < 3}">
								<img src="/images/product/${img.imageUrl}" class="thumbnail-img mx-2 ${status.first ? 'active' : ''}" onclick="changeSlide(${status.index})">
							</c:if>
						</c:forEach>
					</div>
				
				</div>


    			<div class="col-lg-6 product-details pl-md-5 ftco-animate col-5">
    				<h3>${product.name}</h3>
					<p>${product.factory}</p>

    				<div class="rating d-flex">
							<p class="text-left mr-4">
								<a href="#" class="mr-2" id="average-rating">${product.averageRating}</a>
								<a href="#"><span class="star1 ion-ios-star-outline" data-value="1"></span></span></a>
								<a href="#"><span class="star1 ion-ios-star-outline" data-value="2"></span></span></a>
								<a href="#"><span class="star1 ion-ios-star-outline" data-value="3"></span></span></a>
								<a href="#"><span class="star1 ion-ios-star-outline" data-value="4"></span></span></a>
								<a href="#"><span class="star1 ion-ios-star-outline" data-value="5"></span></span></a>
							</p>

							<p class="text-left mr-4">
								<a href="#" class="mr-2" style="color: #000;">${product.totalRating} <span style="color: #bbb;">Rating</span></a>
							</p>
							<p class="text-left">
								<a href="#" class="mr-2" style="color: #000;">${product.sold} <span style="color: #bbb;">Sold</span></a>
							</p>
						</div>
						<button id="rate-btn" style="cursor: pointer;">ĐÁNH GIÁ</button>
						<div class="modal fade" id="ratingModal" tabindex="-1" aria-labelledby="ratingModalLabel" aria-hidden="false">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="ratingModalLabel">Đánh giá sản phẩm</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p>Chọn số sao để đánh giá:</p>
										<div id="stars" style="cursor: pointer;">
											<span class="star selected" data-value="1">&#9734;</span>
											<span class="star" data-value="2">&#9734;</span>
											<span class="star" data-value="3">&#9734;</span>
											<span class="star" data-value="4">&#9734;</span>
											<span class="star" data-value="5">&#9734;</span>
										</div>
										<input type="hidden" id="selected-rating1" value="0">
									</div>
									<div class="modal-footer">

										<form method="post" action="/rating-product" modelAttribute="product">
										<button type="button" class="btn" id="close-modal-btn" data-bs-dismiss="modal">Hủy</button>
										<button type="submit" class="btn" id="submit-rating">Gửi đánh giá</button>
										<input  type="text" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input  type="text" value="${product.id}" name="id"/>
										<input type="text" id="selected-rating" name="selected-rating" value="0">
									</form>
									</div>
								</div>
							</div>
						</div>

						<!-- Button trigger modal -->





    				<p class="price"><span>$120.00</span></p>
    				<p>${product.shortDesc}</p>
						<div class="row mt-4">
							<div class="col-md-6">
								<div class="form-group d-flex">
		              <div class="select-wrap">
	                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                
	                </div>
		            </div>
							</div>
							<div class="w-100"></div>
							<div class="input-group col-md-6 d-flex mb-3">
							
	             	<span class="input-group-btn mr-2">
	                	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
	                   <i class="ion-ios-remove"></i>
	                	</button>
	            		</span>
	             	<input id="quantity-1" type="text"  name="quantity" class="form-control input-number" value="1" min="1" max="100">
	             	<span class="input-group-btn ml-2">
	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
	                     <i class="ion-ios-add"></i>
	                 </button>
	             	</span>
	          	</div>
	          	<div class="w-100"></div>
	          	<div class="col-md-12">
	          		<p style="color: #000;">${product.quantity} available</p>
	          	</div>
          	</div>
			
			

			 
			  <form method="post" action="/add-to-cart-from-viewdetail" modelAttribute="product">
				<button class="btn btn-primary" style="color: yellow;">Add to Cart</button>
				<input  type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input  type="hidden" value="${product.id}" name="id"/>
				<input type="hidden" id="quantity-hidden" value="1" name="quantity">

			  </form>

			  
    			</div>
    		</div>
    	</div>
    </section>

	<div class="container mt-4">
        <div class="text-center">
            <button class="btn btn-primary btn-toggle" onclick="showSection('specs')">Thông số kỹ thuật</button>
            <button class="btn btn-secondary btn-toggle" onclick="showSection('article')">Bài viết</button>
        </div>

        <!-- Thông số kỹ thuật -->
        <div id="specs" class="content-box">
            <section class="row">
                <div class="col-md-6" style="margin-left: 100px;">
                    <hr style="border: 0; border-top: 5px solid yellow; width: 450px; margin-bottom: 10px; 
                        box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3); border-radius: 10px; padding: 15px;">
                    <h3>Detail information</h3>
                    <p>${product.detailDesc}</p>
                </div>
            </section>

            <div class="mt-4">
                <h2 class="mb-4" id="BoxulyBtn" onclick="toggleCPUInfo()">Bộ Xử Lý</h2>
                <div id="cpuInfo" class="hidden">
                    <div class="info"><span class="label">Công nghệ CPU:</span> <span>${productProcessor.cpuTechnology}</span></div>
                    <div class="info"><span class="label">Số nhân:</span> <span>${productProcessor.coreCount}</span></div>
                    <div class="info"><span class="label">Số luồng:</span> <span>${productProcessor.threadCount}</span></div>
                    <div class="info"><span class="label">Tốc độ CPU:</span> <span>${productProcessor.baseClockSpeed}</span></div>
                    <div class="info"><span class="label">Tốc độ tối đa:</span> <span>${productProcessor.maxClockSpeed}</span></div>
                </div>
            </div>
        </div>

        <!-- Bài viết -->
        <div id="article" class="content-box hidden">
            <h3>${productArticle.title}</h3>
            <c:out value="${productArticle.content}" escapeXml="false" />
        </div>
    </div>




	<section class="row container" id="cmt-ve-sp" style="margin-left:100px; background-color:gray; opacity:0.5" >
		<h2>Bình luận về sản phẩm</h2>
		<div class="flex d-flex row">
<textarea  style="resize: none;" id="comment-box" class="col-10" placeholder="Viết bình luận..."></textarea><br>
<button class="col-2" onclick="sendComment()">Gửi</button>
</div>


<!-- Lưu ID sản phẩm và ID user trong HTML (ẩn) -->
<input type="hidden" id="productId" value="${id}">
<input type="hidden" id="userId" value="${idUser}">
<h3>Bình luận gần đây:</h3>








<ul>
    <c:forEach var="comment" items="${comments}">
        <li>
          
			
<span style="color: red;">${comment.user.fullName}</span> - <span style="color: red;">${comment.formattedCreatedAt}</span>
            <textarea data-id="${comment.id}" readonly style="resize: none; width: 100%;">${comment.text}</textarea>
            
           
            <span class="reply-btn" style="color: purple; cursor: pointer;" onclick="showReplyBox(this)">Phản hồi</span>

           
            <div class="reply-box" style="display: none; margin-top: 10px; margin-left:10px">
                <input type="hidden" class="parent-id" value="${comment.id}">
                <textarea class="form-control" placeholder="Nhập phản hồi... cho user ${comment.user.fullName} " style="width: 100%;"></textarea>
                <button class="btn btn-primary btn-sm mt-2" onclick="sendReply(this)">Gửi</button>
            </div>

            <c:if test="${not empty comment.replies}">
                <ul>
                    <c:forEach var="reply" items="${comment.replies}">
                        <li>
                            <span style="color: red;">${reply.user.fullName}</span> - <span style="color: red;">${reply.formattedCreatedAt}</span>
                          
                            <div  data-id="${reply.id}" contenteditable="false" style="resize: none; width: 100%; border: 1px solid #ccc; padding: 5px; background-color:white;border-radius:5px">
								<span style="color: green;">${comment.user.fullName} >></span>  <span style="color: red;">${reply.text}</span> 
							</div>
                           
                          
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </li>
    </c:forEach>
</ul> 



	</section>
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

  <script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});

		//let quantityInput = document.getElementById("quantity-1");  // productId là biến chứa giá trị ID của sản phẩm.
//let quantityValue = quantityInput.value;
//console.log(quantityValue);  -->




  // Lấy các nút tăng, giảm và input
  const quantityInput = document.getElementById("quantity-1");
  const decreaseButton = document.querySelector(".quantity-left-minus");
  const increaseButton = document.querySelector(".quantity-right-plus");
 
  // Hàm thay đổi số lượng
  function updateQuantity(change) {
	  let currentQuantity = parseInt(quantityInput.value);
	  
	  // Kiểm tra và thay đổi số lượng
	  if (change === 'plus' && currentQuantity < 100) {
		  quantityInput.value = currentQuantity + 1; // Tăng số lượng
	  } else if (change === 'minus' && currentQuantity > 1) {
		  quantityInput.value = currentQuantity - 1; // Giảm số lượng
	  }

	  // In ra console giá trị mới
	  console.log("Quantity: " + quantityInput.value);
	  let quantityValue = quantityInput.value;

	  let hiddenQuantityInput = document.getElementById("quantity-hidden");
	  hiddenQuantityInput.value = quantityValue;
  
	  // Có thể kiểm tra giá trị đã được gán hay chưa
	  console.log("Quantity set to hidden input: " + hiddenQuantityInput.value);
	  // Lấy đường dẫn hiện tại của URL


// In ra số ID sản phẩm

  }

  // Lắng nghe sự kiện click cho nút giảm
  decreaseButton.addEventListener("click", function() {
	  updateQuantity('minus');
  });

  // Lắng nghe sự kiện click cho nút tăng
  increaseButton.addEventListener("click", function() {
	  updateQuantity('plus');
  });
	</script>
    
  </body>
</html>

<script>
    function changeSlide(index) {
        var carousel = new bootstrap.Carousel(document.getElementById('mainCarousel'));
        carousel.to(index);

        document.querySelectorAll('.thumbnail-img').forEach(img => img.classList.remove('active'));
        document.querySelectorAll('.thumbnail-img')[index].classList.add('active');
    }
</script>

<style>
	.thumbnail-img {
		width: 100px;
		height: 60px;
		object-fit: cover;
		cursor: pointer;
		border: 2px solid transparent;
	}
	.thumbnail-img.active {
		border-color: red;
	}


	.carousel-control-prev-icon, 
.carousel-control-next-icon {
    width: 30px; /* Giảm kích thước icon */
    height: 30px;
    background-size: 30px 30px; /* Thu nhỏ hình mũi tên */
}

.carousel-control-prev, 
.carousel-control-next {
    width: 40px; /* Giảm vùng bấm */
	height: 40px;
}


.carousel-inner img {
    max-width: 100%; /* Đảm bảo ảnh không vượt quá kích thước gốc */
    max-height: 400px; /* Giới hạn chiều cao ảnh */
    object-fit: contain; /* Giữ nguyên tỷ lệ, không bị méo */
}
</style>


<script>
	document.addEventListener("DOMContentLoaded", function () {
		let selectedRating = 0;
	
		// Khi nhấn nút "ĐÁNH GIÁ" → Hiện modal
		document.getElementById("rate-btn").addEventListener("click", function () {
			let modal = new bootstrap.Modal(document.getElementById("ratingModal"));
			modal.show();
			document.querySelector('.modal-backdrop').remove();
			
		});
	
		// Khi chọn số sao
		document.querySelectorAll(".star").forEach(star => {
			
			star.addEventListener("click", function () {
				alert("đã click vô sao");
				selectedRating = this.getAttribute("data-value");
				document.getElementById("selected-rating").value = selectedRating;
				document.getElementById("selected-rating1").value = selectedRating;
				
				// Highlight sao
				document.querySelectorAll(".star").forEach(s => s.classList.remove("selected"));
				for (let i = 0; i < selectedRating; i++) {
					document.querySelectorAll(".star")[i].classList.add("selected");
				}
			});
		});
	
		// Khi nhấn "Gửi đánh giá"
		document.getElementById("submit-rating").addEventListener("click", function () {
			
			if (selectedRating > 0) {
				alert("Bạn đã đánh giá " + selectedRating + " sao. Cảm ơn bạn!");
				//let modal = bootstrap.Modal.getInstance(document.getElementById("ratingModal"));
			//	modal.hide();
			} else {
				alert("Vui lòng chọn số sao trước khi gửi đánh giá!");
			}
		});

		
		
	});
</script>


<style>
	#stars {
		font-size: 30px;
		cursor: pointer;
	}
	.star {
		color: gray;
	}
	.star.selected, .star:hover {
		color: gold;
	}
</style>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        let rating = parseFloat(document.getElementById("average-rating").textContent); // Lấy giá trị rating
        let stars = document.querySelectorAll(".star1");

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





<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>

	// Lấy id sản phẩm và idUser từ HTML
const productId = document.getElementById("productId").value;
const userId = document.getElementById("userId").value;

console.log("Product ID:", productId);
console.log("User ID:", userId);
    var socket = new SockJS('/ws'); 
    var stompClient = Stomp.over(socket);
	console.log("socket là", socket);
	console.log("stompClient,",stompClient);

    //stompClient.connect({}, function () {
      //  stompClient.subscribe('/topic/comments', function (response) {
        //    showComment(JSON.parse(response.body));
       // });
   // }); 

     stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);

        // 📌 Đặt đoạn subscribe ở đây
        stompClient.subscribe('/topic/comments/' + productId, function (message) {
            const comment = JSON.parse(message.body);
            addCommentToUI(comment);
        });
    });

	 
	function sendComment() {
		let commentText = document.getElementById("comment-box").value.trim();
		if (commentText) {
			let commentData = {
				text: commentText,
				productId: productId,
				userId: userId
			};
	
			console.log("Sending comment:", commentData);
	
			// Gửi bình luận qua WebSocket
			stompClient.send("/app/sendComment", {}, JSON.stringify(commentData));
	
			// Xóa nội dung sau khi gửi
			document.getElementById("comment-box").value = "";
		}
	}

	function showComment(comment) {
		var commentsContainer = document.getElementById("comments-container");
		var commentElement = document.createElement("div");
	
		commentElement.innerHTML = `
			<p><strong>${comment.user.fullName}</strong></p>
			<textarea readonly>${comment.text}</textarea>
			<p style="color: red;">${(comment.createdAt).toLocaleString()}</p>
		`;
	
		commentsContainer.prepend(commentElement); // Thêm vào đầu danh sách
	}

    // Load bình luận ban đầu từ server
    fetch("/comments")
        .then(response => response.json())
        .then(data => data.forEach(showComment));
</script>



<script>

	var socket = new SockJS('/ws'); 
    var stompClient = Stomp.over(socket);
    function showReplyBox(element) {
		let commentId = element.getAttribute("data-id").trim();
		console.log("commentId là:",commentId);
        let replyBox = element.parentElement.nextElementSibling;
        let parentIdInput = replyBox.querySelector(".parent-id");

        parentIdInput.value = commentId; // Gán ID comment vào input hidden
        replyBox.style.display = "block"; // Hiển thị ô nhập phản hồi
    }

    function sendReply(button) {
        let replyBox = button.parentElement;
        let replyText = replyBox.querySelector("textarea").value.trim();
        let parentId = replyBox.querySelector(".parent-id").value; // Lấy ID của comment cha
        let productId = document.getElementById("productId").value;
        let userId = document.getElementById("userId").value;

        if (replyText === "") {
            alert("Vui lòng nhập phản hồi!");
            return;
        }

        // Gửi phản hồi bằng AJAX
        let requestData = {
            text: replyText,
            parentCommentId: parentId,
            productId: productId,
            userId: userId
        };


		stompClient.send("/app/sendComment", {}, JSON.stringify(requestData));
        console.log("Dữ liệu gửi đi:", requestData);
        alert("Bạn đã gửi phản hồi cho ID: " + parentId);
    }
</script>



<script>
	var socket = new SockJS('/ws'); 
    var stompClient = Stomp.over(socket);


	function formatDate(createdAt) {
		const date = new Date(createdAt);
		return date.toLocaleString("vi-VN", {
			day: "2-digit",
			month: "2-digit",
			year: "numeric",
			hour: "2-digit",
			minute: "2-digit",
			second: "2-digit",
			hour12: false
		});
	}
	function showReplyBox(element) {
		var replyBox = element.nextElementSibling; // Hộp phản hồi gần nhất
		if (replyBox.style.display === "none") {
			replyBox.style.display = "block";
		} else {
			replyBox.style.display = "none";
		}
	}
	
	function sendReply(button) {
		var replyBox = button.parentElement;
		var parentId = replyBox.querySelector(".parent-id").value;

		var replyText = replyBox.querySelector("textarea").value;
		let productId = document.getElementById("productId").value;
        let userId = document.getElementById("userId").value;

		console.log("parentId",parentId,"reply text",replyText,"productId",productId,"userId",userId);
	
		if (replyText.trim() === "") {
			alert("Vui lòng nhập nội dung phản hồi!");
			return;
		}
	

		let requestData = {
            text: replyText,
            parentCommentId: parentId,
            productId: productId,
            userId: userId
        };


		stompClient.send("/app/sendComment", {}, JSON.stringify(requestData));
		// Giả lập gửi dữ liệu lên server (thực tế sẽ cần AJAX hoặc form submit)
		console.log("Đang gửi phản hồi cho comment ID:", parentId);
		console.log("Nội dung phản hồi:", replyText);
	
		// Ẩn ô nhập phản hồi sau khi gửi
		replyBox.style.display = "none";
		replyBox.querySelector("textarea").value = "";
	}
	</script>


<style>
	.info {
		padding: 10px 0;
		border-bottom: 1px solid #ddd; /* Đường gạch dưới màu xám nhạt */
	}
	
	.info:last-child {
		border-bottom: none; /* Không có border dưới cùng */
	}

	.hidden {
		display: none;
	}


	#BoxulyBtn {
		cursor: pointer;
		background-color: #f5f5f5;
		padding: 10px;
		border-radius: 5px;
		text-align: center;
	}
</style>


<script>
	function toggleInfo() {
		var infoDiv = document.getElementById("cpuInfo");
		infoDiv.classList.toggle("hidden");
	}
</script>

<style>
	body {
		font-family: Arial, sans-serif;
		margin: 20px;
	}
	.article-container {
		max-width: 800px;
		margin: auto;
		padding: 20px;
		border: 1px solid #ddd;
		border-radius: 8px;
		background-color: #f9f9f9;
	}
	h3 {
		color: #333;
	}
	p {
		font-size: 16px;
		line-height: 1.6;
	}
</style>




<style>
	.hidden {
		display: none;
	}
	.btn-toggle {
		width: 200px;
		margin-right: 10px;
	}
	.content-box {
		border: 2px solid #ddd;
		padding: 20px;
		border-radius: 10px;
		margin-top: 20px;
		box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
	}
</style>


<script>
	function showSection(section) {
		document.getElementById('specs').classList.add('hidden');
		document.getElementById('article').classList.add('hidden');
		document.getElementById(section).classList.remove('hidden');
	}

	function toggleCPUInfo() {
		var cpuInfo = document.getElementById('cpuInfo');
		cpuInfo.classList.toggle('hidden');
	}
</script>