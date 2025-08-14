package com.Laptop_Website.website_Laptop.controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Laptop_Website.website_Laptop.domain.Cart;
import com.Laptop_Website.website_Laptop.domain.CartDetail;
import com.Laptop_Website.website_Laptop.domain.Comment;
import com.Laptop_Website.website_Laptop.domain.Product;
import com.Laptop_Website.website_Laptop.domain.ProductArticle;
import com.Laptop_Website.website_Laptop.domain.ProductImage;
import com.Laptop_Website.website_Laptop.domain.ProductProcessor;
import com.Laptop_Website.website_Laptop.domain.Product_;
import com.Laptop_Website.website_Laptop.domain.User;
import com.Laptop_Website.website_Laptop.domain.DTO.ProductCriteriaDTO;
import com.Laptop_Website.website_Laptop.domain.DTO.WishListDTO;
import com.Laptop_Website.website_Laptop.service.CartService;
import com.Laptop_Website.website_Laptop.service.CommentService;
import com.Laptop_Website.website_Laptop.service.OrderService;
import com.Laptop_Website.website_Laptop.service.ProductService;
import com.Laptop_Website.website_Laptop.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;






@Controller
public class ItemController {

  
    @Autowired
   private CartService  cartService;

   @Autowired
   private UserService userService;

   @Autowired
   private CommentService commentService;


   @Autowired
   private OrderService orderService1;


    private final ProductService productService;
    public ItemController(ProductService productService1)
    {
        this.productService= productService1;
    }

    @GetMapping("/product/{id}")
    public String getProductDetailPage(org.springframework.ui.Model model1,@PathVariable long id, HttpServletRequest req) {
        Product pr = this.productService.getProductById(id).get();
        HttpSession session= req.getSession(false);
        String email =(String) session.getAttribute("email");
        Long idUser = this.userService.handleFindIdByEmail(email).get();
        List<ProductImage> images = this.productService.getImagesByProductId(id); // Lấy danh sách ảnh từ DB
        model1.addAttribute("id",id);
        model1.addAttribute("product",pr);
        model1.addAttribute("idUser", idUser);
        model1.addAttribute("images", images);

        ProductArticle productArticle= this.productService.getProductArticleByProductId(id);
        model1.addAttribute("productArticle", productArticle);

         ProductProcessor processors = productService.getProductProcessorByProductId(id);
        model1.addAttribute("productProcessor", processors);
  int page=1;
  int length=100;

     Pageable   pageable= PageRequest.of(
            page-1,
            length
             );

        // Page<Comment> listComment= this.commentService.handlefindByProductId(id,pageable);  
         List<Comment> allComments = this.commentService.handlefindByProductId(id, pageable).getContent();
         Map<Long, List<Comment>> commentMap = new HashMap<>();
         for (Comment comment : allComments) {
             Long parentId = (comment.getParentComment() != null) ? comment.getParentComment().getId() : 0L;
             commentMap.computeIfAbsent(parentId, k -> new ArrayList<>()).add(comment);
         }
     
         // Chỉ lấy bình luận gốc (không có parent)
         List<Comment> rootComments = commentMap.getOrDefault(0L, new ArrayList<>());
         model1.addAttribute("listComment", rootComments);
         model1.addAttribute("commentMap", commentMap);

         List<Comment> comments = commentService.getCommentsByProduct(pr.getId());
         model1.addAttribute("comments", comments);

       



        return "client/product/detail";
    }

    @PostMapping("/add-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest req) {
        HttpSession session= req.getSession(false);
        long productId=id;
        this.productService.handleAddProductToCart((String) session.getAttribute("email"), productId, req,1);
        return "redirect:/";
    }
   

    @PostMapping("/add-to-cart-from-viewdetail")
    public String addProductFromViewDetail(@RequestParam("id") long  id , @RequestParam("quantity") int quantity , HttpServletRequest req) {
        //TODO: process POST request
        HttpSession session= req.getSession(false);
        String email =(String) session.getAttribute("email");

        System.out.println("id là"+id+"quantity là"+ quantity);
        this.productService.handleAddProductToCart(email, id, req, quantity);
        return "redirect:/";
    }
    

     @GetMapping("/cart")
        public String getCartPage(Model model1, HttpServletRequest req) {
            HttpSession session= req.getSession();

              String email = (String) session.getAttribute("email");
        if (email == null) {
            return "redirect:/login"; // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
        }

        List<CartDetail> cartDetails = cartService.getCartDetailsByUser(email);
   

        Cart cart = this.cartService.findByUserEmail(email);
        
        model1.addAttribute("cartDetails", cartDetails);
        model1.addAttribute("cart", cart);
            return "client/homepage/cart";
        }



        @PostMapping("/delete-card/{id}")
        public String DeleteProductFromCart(@PathVariable long id, HttpServletRequest req) {

            HttpSession session= req.getSession();
            long cartDetailId=id;
            this.productService.handleRemoveCartDetail(cartDetailId, session);
            
            return "redirect:/cart";
        }


        // @PostMapping("/checkout")
        // public String CheckOut(@PathVariable long id, HttpServletRequest req) {

        //     HttpSession session= req.getSession();
        //     long cartDetailId=id;
        //     this.productService.handleRemoveCartDetail(cartDetailId, session);
            
        //     return "redirect:/cart";
        // }
      
        
          @PostMapping("/cart/add")
    public ResponseEntity<?> addToCart(@RequestBody Map<String, Long> request, HttpServletRequest httpRequest) {
        System.out.println("vô /add");
        String email = httpRequest.getUserPrincipal().getName(); // Lấy email từ user hiện tại
        long productId = request.get("productId");
        this.productService.handleAddProductToCart(email, productId, httpRequest,1);

        HttpSession session = httpRequest.getSession(false);
        int totalQuantity = (int) session.getAttribute("totalQuantity");
        double sum = (double) session.getAttribute("sum");

        Map<String, Object> response = new HashMap<>();
        response.put("totalQuantity", totalQuantity);
        response.put("sum", sum);

        return ResponseEntity.ok(response);
    }

    @PostMapping("/cart/remove")
    public ResponseEntity<?> removeFromCart(@RequestBody Map<String, Long> request, HttpSession session) {
        System.out.println("vô /remove");

        long cartDetailId = request.get("cartDetailId"); // Trong trường hợp giảm sản phẩm
        System.out.println("cartDetailId là"+ cartDetailId);
        this.productService.handleDecreaseCartDetailQuantity(cartDetailId, session);

      int totalQuantity = (int) session.getAttribute("totalQuantity");
      double sum = (double) session.getAttribute("sum");

        Map<String, Object> response = new HashMap<>();
        response.put("totalQuantity", totalQuantity);
        response.put("sum", sum);

        return ResponseEntity.ok(response);
    }

    @PostMapping("/confirm-checkout")
    public String confirmCheckOut(@ModelAttribute("cart") Cart cart, Model model1) {
        List<CartDetail> cartDetails= cart==null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        System.out.println("cart là"+ cart);
        this.productService.handleUpdateCartBeforeCheckOut(cartDetails);

        model1.addAttribute("cartDetails", cartDetails);
      
        
        
        
        return "client/homepage/checkout";
    }

    @PostMapping("/place-order")
    public String PlaceOrder(HttpServletRequest req , @RequestParam("recieverName") String recieverName,  @RequestParam("recieverAddress") String recieverAddress, @RequestParam("recieverPhone") String recieverPhone) {
        //TODO: process POST request
        HttpSession session= req.getSession(false);
        System.out.println("đã vô place order rồi nhé");
        // lấy user đã có mặt trong session đăng nhập thành công 
        User currentUser= new User();
        long id= (long) session.getAttribute("id");
        currentUser.setId(id);
        this.productService.handlePlaceOrder(currentUser, session, recieverName, recieverAddress, recieverPhone);
        
        return "client/homepage/success";
    }


          @GetMapping("/product")
          public String getLoginPage1(Model model1, ProductCriteriaDTO productDTO) {
            int page=1;
            int length=100;

            // check thêm phần sort để coi họ sort như thế nào nè he
            Pageable pageable= null;
            if(productDTO.getSort()!=null && productDTO.getSort().isPresent())
            {
                String sort= productDTO.getSort().get();
                if(sort.equals("desc"))
                {

                    // giảm dần
                    pageable= PageRequest.of(
                page-1,
                length, Sort.by(Product_.PRICE).descending()
                 );
                 System.out.println("vô đây rồi nè");

                } else if (sort.equals("asc"))
                {
                        // tăng dần
                        pageable= PageRequest.of(
                page-1,
                length, Sort.by(Product_.PRICE).ascending()
                 );
                 System.out.println("vô đây rồi nè");

                } 
                else {
                    pageable= PageRequest.of(
                        page-1,
                        length
                         );
                }
            } else{
                pageable= PageRequest.of(
                    page-1,
                    length
                     );
            }
          
            
             List<Product>  products= this.productService.fetchDataWithAllSpecification(productDTO, pageable).getContent();
           
          
          

           
        

            model1.addAttribute("products", products);
            
           
            return "client/product/productpage";
        }
    
    
    @GetMapping("/product/search")
    public String doGetProduct(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("name") Optional<String> nameOptional) throws ServletException, IOException {
        String name = nameOptional.get() != null ? nameOptional.get() :"";
        String searchValue = request.getParameter("name"); // Lấy giá trị từ URL
     
        int page=1;
        int length=100;
      Pageable  pageable= PageRequest.of(
            page-1,
            length
             );

             List<Product>  products= this.productService.getAllProductWithSpecName(name, pageable).getContent();
             System.out.println(products);
             model.addAttribute("searchName",searchValue);
             model.addAttribute("products", products);




        // Gửi kết quả về trang JSP
        return "client/product/search";

       
    }

    @PostMapping("/rating-product")
    public String Rating1Product(@RequestParam("id") long  idSP , @RequestParam("selected-rating") int rating , Model model ) {
       System.out.println("đã vào rating product nha");
       System.out.println("đã vào rating product nha");
       System.out.println("ID sản phẩm: " + idSP);
       System.out.println("Số sao đánh giá: " + rating);
    Product p= this.productService.getProductById(idSP).get();
    this.productService.updateRating(p, rating);


    model.addAttribute("id",idSP);
    model.addAttribute("product",p);

    return "client/product/detail";
    
    }

    @PostMapping("product/add-to-wishlist/{productId}")
    public String addToWishlist(@PathVariable Long productId, HttpSession session) {
        List<Long> wishlist = (List<Long>) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        if (!wishlist.contains(productId)) {
            wishlist.add(productId);
        }

        session.setAttribute("wishlist", wishlist);
        return "redirect:/";
    }
    @GetMapping("/wishlist")
    public String viewWishlist(Model model, HttpSession session) {
        List<Long> wishlist = (List<Long>) session.getAttribute("wishlist");
         List<Product> products = this.productService.getProductsByIds(wishlist);
         model.addAttribute("wishlist", products);
        return "client/product/wishlist"; // Trang hiển thị danh sách sản phẩm trong Wishlist
    }

    // @PostMapping("/wishlist-data")
    // public ResponseEntity<List<Product>> getWishlist(@RequestBody Map<String, List<Long>> request) {
    //     List<Long> productIds = request.get("productIds");
    //     List<Product> products = productService.getProductsByIds(productIds);
    //     return ResponseEntity.ok(products);
    // }

    // @GetMapping("/wishlist")
    // public String getAllWishList()
    // {
    //     return "client/product/wishlist_";
    // }

    // @PostMapping("/wishlist/update")
    // public String updateWishlist(@RequestBody WishListDTO request, Model model) {
    //     List<Long> productIds = request.getProductIds();
    //     System.out.println("Received Wishlist: " + productIds);
    //         List<Product> products = this.productService.getProductsByIds(productIds);
    //      model.addAttribute("wishlist", products);
    //      return "redirect:/wishlist";
    // }


    @PostMapping("product/wishlist/update")
@ResponseBody // Trả về JSON thay vì chuyển hướng
public List<Product> updateWishlist(@RequestBody WishListDTO request) {
    List<Long> productIds = request.getProductIds();
    System.out.println("Received Wishlist: " + productIds);
    return this.productService.getProductsByIds(productIds);
}


@PostMapping("product/wishlist/remove/{productId}")
public String removeFromWishlist(@PathVariable Long productId, HttpSession session, Model model) {
    // Lấy danh sách wishlist từ session
    List<Long> wishlist = (List<Long>) session.getAttribute("wishlist");
    if (wishlist == null) {
        wishlist = new ArrayList<>();
    }

    // Xóa productId nếu tồn tại trong wishlist
    if (wishlist.contains(productId)) {
        wishlist.remove(productId);
    }

    // Cập nhật session
    session.setAttribute("wishlist", wishlist);
    List<Product> products = this.productService.getProductsByIds(wishlist);
    model.addAttribute("wishlist", products);
    
  
    return "client/product/wishlist"; // Trang hiển thị danh sách sản phẩm trong Wishlist
}



@PostMapping("/order/cancel")
public String cancelOrder(@RequestParam("orderId") Long orderId) {
    try {
    orderService1.cancelOrder(orderId);
    } catch (Exception e) {
        System.err.println(e);
    }
    return "redirect:/orderhistory"; // Điều hướng về trang danh sách đơn hàng
}

    
}
