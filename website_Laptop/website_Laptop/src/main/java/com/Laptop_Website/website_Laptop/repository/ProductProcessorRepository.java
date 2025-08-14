package com.Laptop_Website.website_Laptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Laptop_Website.website_Laptop.domain.ProductProcessor;

public interface ProductProcessorRepository extends JpaRepository<ProductProcessor, Long> {

    ProductProcessor findProductProcessorByProductId(Long productId);
} 
