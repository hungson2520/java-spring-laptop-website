package com.Laptop_Website.website_Laptop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.Laptop_Website.website_Laptop.domain.Comment;
import com.Laptop_Website.website_Laptop.repository.CommentRepository;
import com.Laptop_Website.website_Laptop.repository.ProductRepository;
import com.Laptop_Website.website_Laptop.repository.UserRepository;

@Service
public class CommentService {

     private final UserRepository userRepository;
    private final ProductRepository productService;
    private final CommentRepository commentRepository;
    
    
    public CommentService(UserRepository userRepository, ProductRepository productService1, CommentRepository commentRepository1) {
        this.userRepository = userRepository;
        this.productService=productService1;
        this.commentRepository=commentRepository1;
     
    }

    public List<Comment> getCommentsByProduct(Long productId) {
        return commentRepository.findRootCommentsByProduct(productId);
    }
    

     public Comment handleSaveComment(Comment c)
    {
      return  this.commentRepository.save(c);


    }
 public   Page<Comment> handlefindByProductId(Long productId, Pageable pageable)
    {
          return this.commentRepository.findByProductId(productId, pageable);
    }
    public Comment handleGetCommentById(long commentId)
    {
        return this.commentRepository.findCommentById(commentId);
    }



}
