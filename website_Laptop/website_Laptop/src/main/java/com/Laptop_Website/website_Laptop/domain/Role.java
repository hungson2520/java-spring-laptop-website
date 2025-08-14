package com.Laptop_Website.website_Laptop.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
@Entity
@Table(name = "roles")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Để tự động tạo ID
    private Long id;

    private String name; // Tên của vai trò (ví dụ: "ADMIN", "USER")

    private String description; // Mô tả vai trò (ví dụ: "Quản trị viên", "Người dùng bình thường")

    // 1 role có N user || 1 role ----> có ----> N users
    @OneToMany(mappedBy = "role")
    private List<User> users;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    

}
