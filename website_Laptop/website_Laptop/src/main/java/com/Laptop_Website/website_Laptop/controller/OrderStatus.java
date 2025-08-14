package com.Laptop_Website.website_Laptop.controller;

public enum OrderStatus {
    PENDING("Chờ xử lý"),
    CONFIRMED("Đã xác nhận"),
    PACKAGING("Đang đóng gói"),
    SHIPPING("Đang giao hàng"),
    DELIVERED("Đã giao thành công"),
    CANCELLED("Đã hủy"),
    RETURN_REQUESTED("Yêu cầu trả hàng"),
    RETURNED("Đã trả hàng thành công"),
    FAILED("Giao hàng thất bại");

    private final String displayName;

    OrderStatus(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
