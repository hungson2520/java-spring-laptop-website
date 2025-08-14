package com.Laptop_Website.website_Laptop.domain;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;




@Entity
@Table(name="users")
public class User {
    @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY) // Để tự động tạo ID
    private Long id;

   // @Column(nullable = false, unique = true)
   @NotNull(message = "Email must not be null")
   @Email(message = "Invalid email format")
   @Pattern(
       regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
       message = "Email should follow the pattern: example@domain.com"
   )
    private String email;

   // @Column(nullable = false)
   @NotNull
   @Size(min = 2, message = "Full name must have at least 2 characters")
    private String fullName;

    private String address;

    private String phone;

   // @Column(nullable = false)
    @NotNull
   @Size(min = 4, message = "password must have at least 2 characters")
    private String password;

    private String avatar;


    // N users chỉ thuộc duy nhất về 1 role|| many USERS --->To 1---> ROLE
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "role_id")
    private Role role;


    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    // 1 user --> có --->N orders
    @OneToMany(mappedBy = "user")
    private List<Order> order;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
private List<Comment> comments = new ArrayList<>();

    // Constructors
    public User() {}

    public User(Long id, String email, String fullName, String address, String phone, String password) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.password = password;
    }

    public Long getId() {
        return id;
    }
    

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    

    @Override
    public String toString() {
        return "User [id=" + id + ", email=" + email + ", fullName=" + fullName + ", address=" + address + ", phone="
                + phone + ", password=" + password + ", avatar=" + avatar + "]";
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    
}
