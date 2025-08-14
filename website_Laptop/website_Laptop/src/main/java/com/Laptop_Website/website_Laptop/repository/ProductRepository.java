package com.Laptop_Website.website_Laptop.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.Laptop_Website.website_Laptop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long>, JpaSpecificationExecutor<Product> {
    @SuppressWarnings("null")
    Page<Product> findAll(Specification<Product> spec , Pageable page);
    // Page<Product> findAll(ProductCriteriaDTO spec , Pageable page);
     @Query("SELECT p FROM Product p WHERE p.id IN :ids")
    List<Product> findAllById(List<Long> ids);

}
