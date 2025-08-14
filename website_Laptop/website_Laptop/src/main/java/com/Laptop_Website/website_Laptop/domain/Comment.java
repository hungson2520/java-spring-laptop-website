package com.Laptop_Website.website_Laptop.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
@Entity
@Table(name = "comments")
public class Comment {
      @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    

    public Comment() {
    }

    public Comment(@NotBlank(message = "Comment content cannot be empty") String text, @NotNull User user,
            @NotNull Product product) {
        this.text = text;
        this.user = user;
        this.product = product;
    }

    @NotBlank(message = "Comment content cannot be empty")
    @Column(columnDefinition = "TEXT")
    private String text;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user; // Người viết bình luận

    @NotNull
    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product; // Sản phẩm được bình luận

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Comment parentComment; // Bình luận cha (nếu có)

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now(); // Thời gian tạo bình luận

    @Column(name = "updated_at")
    private LocalDateTime updatedAt; // Thời gian cập nhật bình luận

    @Column(name = "status", nullable = false)
    private String status = "active"; // Trạng thái bình luận: active, hidden, deleted

    @OneToMany(mappedBy = "parentComment", cascade = CascadeType.ALL, orphanRemoval = true)
private List<Comment> replies = new ArrayList<>();


 public String getFormattedCreatedAt() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        return createdAt.format(formatter);
    }
// Getter cho replies
public List<Comment> getReplies() {
    return this.replies;
}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Comment getParentComment() {
        return parentComment;
    }

    public void setParentComment(Comment parentComment) {
        this.parentComment = parentComment;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    
}
