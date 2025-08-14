package com.Laptop_Website.website_Laptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Laptop_Website.website_Laptop.domain.ProductArticle;

public interface ProductArticleRepository extends JpaRepository<ProductArticle, Long> {

    ProductArticle findProductArticleByProductId(Long productId);
} 
