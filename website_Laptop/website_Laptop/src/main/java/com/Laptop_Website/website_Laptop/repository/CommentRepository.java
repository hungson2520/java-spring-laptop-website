package com.Laptop_Website.website_Laptop.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.Laptop_Website.website_Laptop.domain.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    
    // Lấy danh sách bình luận theo sản phẩm (phân trang)
    Page<Comment> findByProductId(Long productId, Pageable pageable);

    // Lấy danh sách bình luận của một user (phân trang)
    Page<Comment> findByUserId(Long userId, Pageable pageable);

    // Tìm tất cả các bình luận cha (có parentComment = null) của một sản phẩm (hỗ trợ phân trang)
    Page<Comment> findByProductIdAndParentCommentIsNull(Long productId, Pageable pageable);

    // Tìm tất cả bình luận con của một bình luận cha
    List<Comment> findByParentCommentId(Long parentId);

    // Đếm số lượng bình luận của một sản phẩm
    long countByProductId(Long productId);

     @Query("SELECT c FROM Comment c WHERE c.id = :commentId")
    Comment findCommentById(Long commentId);


     // Lấy danh sách bình luận gốc của sản phẩm, kèm theo phản hồi
   // @Query("SELECT c FROM Comment c LEFT JOIN FETCH c.replies WHERE c.product.id = :productId AND c.parentComment IS NULL")
  //  List<Comment> findRootCommentsByProduct(@Param("productId") Long productId);

  @Query("SELECT c FROM Comment c WHERE c.product.id = :productId AND c.parentComment IS NULL ORDER BY c.createdAt DESC")
List<Comment> findRootCommentsByProduct(@Param("productId") Long productId);

}