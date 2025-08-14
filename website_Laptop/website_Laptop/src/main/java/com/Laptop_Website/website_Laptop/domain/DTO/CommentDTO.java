package com.Laptop_Website.website_Laptop.domain.DTO;

public class CommentDTO {
    private String text;
    private Long productId;
    private Long userId;
    private Long parentCommentId; // Có thể null nếu không phải phản hồi

    // Getter & Setter
    public String getText() { return text; }
    public void setText(String text) { this.text = text; }
    
    public Long getProductId() { return productId; }
    public void setProductId(Long productId) { this.productId = productId; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Long getParentCommentId() {
        return parentCommentId;
    }
    public void setParentCommentId(Long parentCommentId) {
        this.parentCommentId = parentCommentId;
    }

    
}
