package com.Laptop_Website.website_Laptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Laptop_Website.website_Laptop.domain.Cart;
import com.Laptop_Website.website_Laptop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart,Long> {


    Cart findByUser(User user1);
    Cart findByUserEmail(String email);
    
} 
