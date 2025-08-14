package com.Laptop_Website.website_Laptop.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.Laptop_Website.website_Laptop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User,Long>{
    public User findByEmail(String email);

    public boolean existsByEmail(String email);

  Page<User> findAll(Pageable page);
    @Query("SELECT u.id FROM User u WHERE u.email = :email")
  Optional<Long> findIdByEmail(String email);
 

    
} 
