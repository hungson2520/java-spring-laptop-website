package com.Laptop_Website.website_Laptop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Laptop_Website.website_Laptop.domain.Comment;
import com.Laptop_Website.website_Laptop.domain.Product;
import com.Laptop_Website.website_Laptop.domain.User;
import com.Laptop_Website.website_Laptop.domain.DTO.CommentDTO;
import com.Laptop_Website.website_Laptop.domain.DTO.CommentResponse;
import com.Laptop_Website.website_Laptop.service.CommentService;
import com.Laptop_Website.website_Laptop.service.ProductService;
import com.Laptop_Website.website_Laptop.service.UserService;

@Controller
public class CommentController {
       private List<String> comments = new ArrayList<>();
       @Autowired
       private UserService userService;

       @Autowired
       private ProductService productService;

       @Autowired
       private CommentService commentService;




//     @MessageMapping("/sendComment")
// @SendTo("/topic/comments")
// public String addComment(CommentDTO commentDTO) {

//     User user = userService.getUserById(commentDTO.getUserId()).orElseThrow(() -> new RuntimeException("User not found"));
//     Product product = productService.getProductById(commentDTO.getProductId()).orElseThrow(() -> new RuntimeException("Product not found"));


//     Comment newComment = new Comment();
//     newComment.setText(commentDTO.getText());
//     newComment.setUser(user);
//     newComment.setProduct(product);
//     if (commentDTO.getParentCommentId() != null) {

//         Comment parentComment = commentService.handleGetCommentById(commentDTO.getParentCommentId());
//         newComment.setParentComment(parentComment);
      
//     }
//     else{
//        newComment.setParentComment(null);
        
//     }

//     commentService.handleSaveComment(newComment);

//     return newComment.getText(); // Gửi bình luận đến tất cả client
// }





    @GetMapping("/comments")
    @ResponseBody
    public List<String> getAllComments() {
        return comments; // API lấy danh sách bình luận (dùng để load khi mở trang)
    }



    @MessageMapping("/sendComment")
@SendTo("/topic/comments/{productId}")
public CommentResponse addComment(CommentDTO commentDTO) {

    // Lấy user và product từ DB
    User user = userService.getUserById(commentDTO.getUserId())
            .orElseThrow(() -> new RuntimeException("User not found"));
    Product product = productService.getProductById(commentDTO.getProductId())
            .orElseThrow(() -> new RuntimeException("Product not found"));

    // Tạo comment mới
    Comment newComment = new Comment();
    newComment.setText(commentDTO.getText());
    newComment.setUser(user);
    newComment.setProduct(product);

    if (commentDTO.getParentCommentId() != null) {
        Comment parentComment = commentService.handleGetCommentById(commentDTO.getParentCommentId());
        newComment.setParentComment(parentComment);
    } else {
        newComment.setParentComment(null);
    }

    // Lưu vào DB
    Comment savedComment = commentService.handleSaveComment(newComment);

    // Trả về dữ liệu để gửi qua WebSocket
    return new CommentResponse(
            savedComment.getId(),
            savedComment.getText(),
            savedComment.getUser().getFullName(),
            savedComment.getProduct().getId(),
            savedComment.getCreatedAt()
    );
}
}
