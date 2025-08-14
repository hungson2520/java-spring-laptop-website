package com.Laptop_Website.website_Laptop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.context.annotation.Configuration;
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

import com.Laptop_Website.website_Laptop.domain.Product;
import com.Laptop_Website.website_Laptop.domain.ProductImage;
import com.Laptop_Website.website_Laptop.domain.ProductProcessor;
import com.Laptop_Website.website_Laptop.service.ProductService;
import com.Laptop_Website.website_Laptop.service.UploadService;

import jakarta.validation.Valid;




@Configuration
@Controller
public class ProductController {


    private final ProductService productService;
private final UploadService uploadService;





public ProductController(ProductService productService, UploadService uploadService) {
    this.productService = productService;
    this.uploadService=uploadService;
  
}


//  @PostMapping("/add-to-wishlist/{productId}")
//     public String addToWishlist(@PathVariable Long productId, HttpSession session) {
//         List<Long> wishlist = (List<Long>) session.getAttribute("wishlist");
//         if (wishlist == null) {
//             wishlist = new ArrayList<>();
//         }

//         if (!wishlist.contains(productId)) {
//             wishlist.add(productId);
//         }

//         session.setAttribute("wishlist", wishlist);
//         return "redirect:/wishlist";
//     }


//     @GetMapping("/wishlist")
//     public String viewWishlist(Model model, HttpSession session) {
//         List<Long> wishlist = (List<Long>) session.getAttribute("wishlist");
//          List<Product> products = this.productService.getProductsByIds(wishlist);
//     model.addAttribute("wishlist", products);
//         return "wishlist"; 
//     }


@GetMapping("/admin/products/edit/{id}")
public String editProduct(@PathVariable Long id, Model model) {
    Optional<Product> productOptional = productService.getProductById(id);
    if (productOptional.isPresent()) {
        model.addAttribute("product", productOptional.get());
        model.addAttribute("productId", id); // Thêm id vào Model
        return "admin/product/update"; // Tên file JSP
    } else {
        model.addAttribute("error", "Product not found");
        return "errorPage"; // Tên file JSP cho lỗi
    }
}

@PostMapping("/admin/product/update")
public String updateProduct(@ModelAttribute("product") Product product, BindingResult result,@RequestParam("file") MultipartFile file) {
    if (result.hasErrors()) {
        return "admin/product/edit"; // Trả lại trang edit nếu có lỗi
    }

    // update hình ảnh mới :
    if(!file.isEmpty())
    {
      String newImg= this.uploadService.handleSaveFile(file, "product");
      product.setImage(newImg);
    }
    

  
    productService.handleSaveProduct(product); // Lưu lại sản phẩm sau khi sửa
    //, RedirectAttributes redirectAttributes
   // redirectAttributes.addFlashAttribute("success", "Product updated successfully");
    return "redirect:/admin/product"; // Redirect về danh sách sản phẩm
}



 @GetMapping("/admin/products/view/{id}")
    public String viewProductDetail(@PathVariable("id") Long id, Model model) {
      //  Optional<Product> product = productService.getProductById(id);
       // model.addAttribute("product", product);
       Optional<Product> productOptional = productService.getProductById(id);
    if (productOptional.isPresent()) {
        // Nếu sản phẩm tồn tại, thêm vào model và trả về trang chi tiết
        model.addAttribute("product", productOptional.get());
        return "admin/product/viewdetail"; // Trang hiển thị chi tiết sản phẩm
    } else {
        // Nếu không tìm thấy sản phẩm, thêm thông báo lỗi và trả về trang lỗi
        model.addAttribute("error", "Product not found");
        return "errorPage"; // Trang lỗi
    }
       // return "product/detail"; // trả về trang JSP/Thymeleaf tên là detail.jsp/detail.html
    }

@GetMapping("/list")
public String showProductList(Model model) {
    List<Product> products = productService.getAllProduct();
    model.addAttribute("products", products);
    return "product/list"; // trả về view 'product/list.jsp' hoặc 'product/list.html' tùy thuộc vào cấu hình.
}
    @GetMapping("/admin/product")
     public String getDashBoard(Model model)
    {
      List<Product> products = productService.getAllProduct();
      model.addAttribute("products", products);
        return "admin/product/showproduct";
    }
    @GetMapping("/admin/product/create")
    public String getMethodName(Model model1) {
        model1.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create" )
      public String createProductPage(Model model,@ModelAttribute("product") @Valid Product newProduct,  BindingResult newProductbindingResult ,@RequestParam("file") MultipartFile file)
    {  System.out.println("đây là dữ liệu lấy được"+newProduct);

    // cần phải validate dữ liệu thôi nào
      List<FieldError> errors = newProductbindingResult.getFieldErrors();
    for (FieldError error : errors ) {
        System.out.println (">>>>>>>>>>>>>"+error.getField() + " - " + error.getDefaultMessage());
    }

    if(newProductbindingResult.hasErrors())
    {
      return "/admin/product/create";
    }

    //nếu hợp lệ mới chạy xuống tới đây

 String avatarName= this.uploadService.handleSaveFile(file, "product");


 System.out.println(avatarName);
 newProduct.setImage(avatarName);


productService.handleSaveProduct(newProduct); 
   


  System.out.println("Upload file thành công");
return "redirect:/admin/product";}

    

@GetMapping("/admin/product/productImage/{idProduct}")
public String addProductImage(@PathVariable Long idProduct, Model model)
{
    model.addAttribute("productId", idProduct);
    return "admin/product/addProductImage";
}



@PostMapping("/admin/product/productImage/{productId}")
public String updateProduct( @PathVariable Long productId, 
@RequestParam("files") MultipartFile[] files) 
{

    Product p1= this.productService.getProductById(productId).get();

    // Kiểm tra nếu có ảnh được tải lên
    if (files != null && files.length > 0) {
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                // Lưu ảnh bằng uploadService
                String newImg = uploadService.handleSaveFile(file, "product");

                // Tạo đối tượng ProductImage và liên kết với product
                ProductImage productImage = new ProductImage();
                productImage.setImageUrl(newImg); // Đường dẫn ảnh sau khi lưu
                productImage.setProduct(p1);

                // Lưu vào database
               this.productService.handleSaveManyImages(productImage);
            }
        }
    }

    return "redirect:/admin/product";
}


@GetMapping("/admin/product/productProcessor/{idProduct}")
public String getProductProcessor(@PathVariable Long idProduct,Model model)

{       model.addAttribute("productId", idProduct);

    model.addAttribute("productProcessor", new ProductProcessor());
    return "admin/product/addProductProcessor";
}    

@PostMapping("/admin/product/productProcessor/save/{productId}")
public String saveProductProcessor(@PathVariable Long productId,@ModelAttribute("productProcessor") ProductProcessor productProcessor) {
    // Gọi service để lưu vào database

    Product p1= this.productService.getProductById(productId).get();
    productProcessor.setProduct(p1);
    productService.handleSaveProductProcessor(productProcessor);
    return "redirect:/admin/product-processor/list"; // Chuyển hướng sau khi lưu
}



}
