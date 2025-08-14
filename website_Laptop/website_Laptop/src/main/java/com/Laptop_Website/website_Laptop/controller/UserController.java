package com.Laptop_Website.website_Laptop.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Laptop_Website.website_Laptop.domain.User;
import com.Laptop_Website.website_Laptop.service.UploadService;
import com.Laptop_Website.website_Laptop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Configuration
@Controller
public class UserController {

private final UserService userService;
private final UploadService uploadService;
private final PasswordEncoder passwordEncoder;



public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder1) {
    this.userService = userService;
    this.uploadService=uploadService;
  this.passwordEncoder= passwordEncoder1;
}
    

    @PostMapping("/user/save")
    public String saveUser(@ModelAttribute("user") User user) {
        // Xử lý và lưu đối tượng User vào database
      
        this.userService.handleSaveUser(user);
        return "redirect:/user/success"; // Redirect tới trang thành công
    }


    @GetMapping("/admin/user/create")
    public String getUserPage(Model model)
   
    {

        model.addAttribute("user", new User());
      //  return "user-form";
        
        return "admin/user/create";}
    

    @PostMapping("/admin/user/create" )
    public String createUserPage(Model model,@ModelAttribute("user") @Valid User newUser,  BindingResult newUserbindingResult ,@RequestParam("fileAvatar") MultipartFile file)
    {  System.out.println("đây là dữ liệu lấy được"+newUser);

    // cần phải validate dữ liệu thôi nào
      List<FieldError> errors = newUserbindingResult.getFieldErrors();
    for (FieldError error : errors ) {
        System.out.println (">>>>>>>>>>>>>"+error.getField() + " - " + error.getDefaultMessage());
    }

    if(newUserbindingResult.hasErrors())
    {
      return "/admin/user/create";
    }

    //nếu hợp lệ mới chạy xuống tới đây

 String avatarName= this.uploadService.handleSaveFile(file, "avatar");
 String hashPassword= this.passwordEncoder.encode(newUser.getPassword());
 newUser.setAvatar(avatarName);
 newUser.setPassword(hashPassword);
 newUser.setRole(this.userService.getRoleByName(newUser.getRole().getName()));
 System.out.println(avatarName);

userService.handleSaveUser(newUser); 
   


  System.out.println("Upload file thành công");
return "redirect:/admin/user";}

    //     @GetMapping("/listuser")
    // public ResponseEntity<List<User>> getAllUsers() {
    //     Page<User> users = userService.getAllUsers(1);
    //     System.out.println("danh sach users là:"+ users);
    //     return ResponseEntity.ok(users);
    // }

    @GetMapping("admin/user")
    public String getListUserPage(Model model, @RequestParam("page") Optional<String> pageOptional )

    {
      int page=1;


      try {
        if(pageOptional.isPresent())
        {
          // tức là người dùng có truyền lên tham số page
          page=Integer.parseInt(pageOptional.get());

        }
        else{
          page=1;
        }

      }catch(Exception e)
      { page=1;

      }
  
        int length=3;
      Pageable pageable= PageRequest.of(
            page-1,
            length
             );
                    Page<User> users = userService.getAllUsers(pageable);
        System.out.println("danh sach users là:"+ users.getContent());
        model.addAttribute("users", users.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", users.getTotalPages());

        return "admin/user/listuser";
    }
      @GetMapping("admin/user/view/{id}")
    public String viewUser(@PathVariable Long id, Model model) {
        // Lấy thông tin người dùng từ service hoặc repository
       Optional< User> userOptional = userService.getUserById(id);
       if (userOptional.isPresent()) {
        model.addAttribute("user", userOptional.get());  // Lấy User từ Optional
        return "admin/user/userdetail";  // Trả về trang chi tiết
    } else {
        // Nếu không tìm thấy user, trả về trang lỗi hoặc thông báo
        model.addAttribute("error", "User not found");
        return "errorPage";  // Trang lỗi
    }

  
        // Trả về tên view (JSP hoặc thạch)
    }


    @GetMapping("/InfomationUser")
    public String Information(Model model , HttpServletRequest request)
    {

      HttpSession session=  request.getSession(false);
      String email = (String) session.getAttribute("email");
      
      System.out.println(email);
      User user = this.userService.getUserByEmail(email);
      model.addAttribute("user", user);
      
      return "client/user/info";

    }
    @PostMapping("/edit-profile")
   public String UpdateInformation(Model model, HttpServletRequest request)
    {

      HttpSession session=  request.getSession(false);
      String email = (String) session.getAttribute("email");
      
      System.out.println(email);
      User user = this.userService.getUserByEmail(email);
      model.addAttribute("user", user);
      return "client/user/edit-profile";

    }

    @PostMapping("/updateInformation")
   public String UpdateInformation1(@ModelAttribute("userUpdate") User user)
    {

      //user là thông tin người dùng muốn cập nhật
      // existsing là thông tin đã có sẵn từ database
    // Nếu password rỗng, lấy lại password cũ từ DB
    User existingUser = this.userService.getUserByEmail(user.getEmail());
    if (existingUser != null) { // Nếu user đã tồn tại, cập nhật thông tin
      existingUser.setFullName(user.getFullName()); // Cập nhật thông tin cần thiết
   existingUser.setPhone(user.getPhone());
      existingUser.setAddress(user.getAddress());
      existingUser.setPassword(existingUser.getPassword()); 
      existingUser.setRole(existingUser.getRole()); 
      existingUser.setId(existingUser.getId());
     this.userService.saveAndFlush(existingUser); // Lưu lại user
  } else {
      // Nếu user chưa tồn tại, tạo mới
      this.userService.handleSaveUser(user);
  }
  

     

        return "redirect:/InfomationUser"; // Redirect tới trang thành công

    }






}
