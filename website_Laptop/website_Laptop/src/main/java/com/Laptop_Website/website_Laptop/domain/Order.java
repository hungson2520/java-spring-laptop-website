package com.Laptop_Website.website_Laptop.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
@Entity
@Table(name = "orders")
public class Order {
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;



    private double totalPrice;  // Tổng giá trị đơn hàng

    // N orders ---> thuộc về ---> 1 users
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    // 1 đơn hàng - có - n chi tiết đơn hàng 
    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;


    private String recieverName;
    private String recieverAddress;
    private String recieverPhone;


       
        private  String Status;

    /**
     *  Các trạng thái cho status
PENDING – Chờ xử lý (Mới đặt hàng, chưa xác nhận).
CONFIRMED – Đã xác nhận (Người bán đã xác nhận đơn hàng).
PACKAGING – Đang đóng gói (Chuẩn bị hàng để giao).
SHIPPING – Đang giao hàng (Đơn vị vận chuyển đang giao hàng).
DELIVERED – Đã giao thành công.
CANCELLED – Đã hủy (Người mua hoặc người bán hủy đơn hàng).
RETURN_REQUESTED – Yêu cầu trả hàng.
RETURNED – Đã trả hàng thành công.
FAILED – Giao hàng thất bại (Người nhận từ chối hoặc không liên lạc được).
     * @return
     */
    



    

    public String getRecieverName() {
        return recieverName;
    }

   

    public void setRecieverName(String recieverName) {
        this.recieverName = recieverName;
    }

    public String getRecieverAddress() {
        return recieverAddress;
    }

    public void setRecieverAddress(String recieverAddress) {
        this.recieverAddress = recieverAddress;
    }

    public String getRecieverPhone() {
        return recieverPhone;
    }

    public void setRecieverPhone(String recieverPhone) {
        this.recieverPhone = recieverPhone;
    }

   

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }



    public String getStatus() {
        return Status;
    }



    public void setStatus(String status) {
        Status = status;
    }
    
}
