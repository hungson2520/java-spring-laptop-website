package com.Laptop_Website.website_Laptop.domain.DTO;

import java.time.LocalDateTime;

public class CommentResponse {
     private Long id;
    private String text;
    private String username;
    private Long productId;
    private LocalDateTime createdAt;

    public CommentResponse(Long id, String text, String username, Long productId, LocalDateTime createdAt) {
        this.id = id;
        this.text = text;
        this.username = username;
        this.productId = productId;
        this.createdAt = createdAt;
    }
}
