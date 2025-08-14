<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>




<!-- 
<c:set var="commentIdInt" value="${commentId + 0}" />
<c:set var="comment" value="${requestScope.commentMap[commentIdInt][0]}" />
<c:set var="commentId" value="${param.commentId}" /> -->
 <!-- <c:choose>
    <c:when test="${not empty param.commentId}">
        <c:set var="commentIdInt" value="${param.commentId + 0}" />
        <c:set var="comment" value="${requestScope.commentMap[commentIdInt][0]}" />
    </c:when>
    <c:otherwise>
        <c:set var="comment" value="Không có bình luận nào" />
    </c:otherwise>
</c:choose>

<c:set var="margin" value="${param.margin}" />
<div class="row" style="margin-left: ${margin}px;">
  
    
    
    <div class="flex d-flex">
        <span style="color: red;border:1px solid #333;max-width:200px">${comment.user.fullName} </span> 
        <span style="color: red;">${comment.createdAt}</span>
    </div>
    <div class="row">
        <textarea readonly style="resize: none;"><c:out value="${comment.text}"/></textarea>
        <span data-id="${commentId}" class="reply-btn" onclick="showReplyBox(this)" style="color:red;cursor:pointer">Phản hồi</span>
    </div>
    <div class="reply-box" style="display: none; margin-top: 10px;">
        <input type="hidden" class="parent-id" value="${comment.id}">
        <textarea class="form-control" placeholder="Nhập phản hồi..."></textarea>
        <button class="btn btn-primary btn-sm mt-2" onclick="sendReply(this)">Gửi</button>
    </div>

    
        <c:forEach var="reply" items="${commentMap[comment.id]}">
            <h1> comment có id là: ${commentMap[comment.id]} </h1>
            <c:set var="newMargin" value="${param.margin + 30}" />
            <jsp:include page="comment-item.jsp">
                <jsp:param name="commentId" value="${reply.id}" />
                <jsp:param name="margin" value="${newMargin}" />
            </jsp:include>
        </c:forEach>
    
</div>  -->

