package com.Laptop_Website.website_Laptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Laptop_Website.website_Laptop.domain.Role;


@Repository
public interface RoleRepository extends JpaRepository<Role,Long> {
    Role findByName(String name);
}
