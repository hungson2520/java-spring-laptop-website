package com.Laptop_Website.website_Laptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Laptop_Website.website_Laptop.domain.OrderDetail;

@Repository
public interface  OrderDetailRepository extends JpaRepository<OrderDetail,Long> {


   
} 