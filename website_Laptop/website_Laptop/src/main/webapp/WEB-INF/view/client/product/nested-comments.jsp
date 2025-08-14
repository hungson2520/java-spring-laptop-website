
<%@ page contentType="text/html;charset=UTF-8" %>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${param.depth le 4}"> <!-- Chỉ cho phép tối đa 3 cấp -->
<h1>ĐỘ SÂU CỦA BÌNH LUẬN : ${param.depth}</h1>
<h2>param.comments: ${param.comments}</h2>

<c:if test="${not empty comments}">
<c:forEach var="reply" items="${param.comments}">


   

    <li>

        <h2>First Comment ID: ${param.comments[0].id}</h2>
       
       
        <span style="color: red;">${reply.user}</span> - <span style="color: red;">${reply.createdAt}</span>
        <textarea data-id="${reply.id}" readonly style="resize: none; width: 100%;">${reply.text}</textarea>
        
        <!-- Nút phản hồi -->
        <span class="reply-btn" style="color: purple; cursor: pointer;" onclick="showReplyBox(this)">Phản hồi</span>

        <!-- Hộp nhập phản hồi (Ẩn mặc định) -->
        <div class="reply-box" style="display: none; margin-top: 10px; margin-left:10px">
            <input type="hidden" class="parent-id" value="${reply.id}">
            <textarea class="form-control" placeholder="Nhập phản hồi... cho user ${reply.user.fullName}" style="width: 100%;"></textarea>
            <button class="btn btn-primary btn-sm mt-2" onclick="sendReply(this)">Gửi</button>
        </div>

        <!-- Hiển thị tiếp các bình luận con nếu có -->
        <c:if test="${not empty reply.replies}">
            <ul>
                <jsp:include page="nested-comments.jsp">
                    <jsp:param name="comments" value="${reply.replies}" />
                    <jsp:param name="depth" value="${param.depth + 1}" />
                </jsp:include>
            </ul>
        </c:if>
    </li>
</c:forEach>
</c:if>
</c:if>

<script>
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
	
		if (replyText.trim() === "") {
			alert("Vui lòng nhập nội dung phản hồi!");
			return;
		}
	
		// Giả lập gửi dữ liệu lên server (thực tế sẽ cần AJAX hoặc form submit)
		console.log("Đang gửi phản hồi cho comment ID:", parentId);
		console.log("Nội dung phản hồi:", replyText);
	
		// Ẩn ô nhập phản hồi sau khi gửi
		replyBox.style.display = "none";
		replyBox.querySelector("textarea").value = "";
	}
</script>

