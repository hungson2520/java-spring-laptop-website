package com.Laptop_Website.website_Laptop.service.validator;

import org.springframework.stereotype.Service;

import com.Laptop_Website.website_Laptop.domain.DTO.RegisterDTO;
import com.Laptop_Website.website_Laptop.service.UserService;

import  jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, RegisterDTO> {

  private final UserService userService;
    public PasswordMatchesValidator(UserService userService1)
    {
        this.userService=userService1;
    }
    @Override
    public boolean isValid(RegisterDTO value, ConstraintValidatorContext context) {
        if (value == null) {
            return true; // Không xử lý nếu đối tượng là null
        }
       // return value.getPassword() != null && value.getPassword().equals(value.getConfirmPassword());
       boolean isValid = value.getPassword() != null && value.getPassword().equals(value.getConfirmPassword());

       if (!isValid) {
           // Vô hiệu hóa thông báo mặc định
           context.disableDefaultConstraintViolation();

           // Thêm thông báo lỗi cho trường 'confirmPassword'
           context.buildConstraintViolationWithTemplate("Confirm Password  không hề khớp với Password")
                  .addPropertyNode("confirmPassword")
                  .addConstraintViolation();
       }
       if(this.userService.CheckEmailExists(value.getEmail()))
       {
           // Vô hiệu hóa thông báo mặc định
           context.disableDefaultConstraintViolation();

           // Thêm thông báo lỗi cho trường 'confirmPassword'
           context.buildConstraintViolationWithTemplate("Email này đã tồn tại rồi nhé !!")
                  .addPropertyNode("email")
                  .addConstraintViolation();
                  isValid=false;

       }

       return isValid;
    }
}
