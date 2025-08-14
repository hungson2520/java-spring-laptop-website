package com.Laptop_Website.website_Laptop.domain.DTO;

import com.Laptop_Website.website_Laptop.service.validator.PasswordMatches;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
@PasswordMatches(message = "password không match với confirm password")
public class RegisterDTO {
     @NotNull(message = "Full name is required")
    @Size(min = 2, message = "Full name must have at least 2 characters")
    private String fullName;

    @NotNull(message = "Email is required")
    @Email(message = "Invalid email format")
    @Pattern(
        regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
        message = "Email should follow the pattern: example@domain.com"
    )
    private String email;

    private String address;


    @NotNull(message = "Password is required")
    @Size(min = 4, message = "Password must have at least 4 characters")
    private String password;

    @NotNull(message = "Confirm Password is required")
    
    private String confirmPassword;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    


    
}
