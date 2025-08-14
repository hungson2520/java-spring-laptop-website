package com.Laptop_Website.website_Laptop.domain.DTO;

import java.util.List;

public class WishListDTO {
    private List<Long> productIds;

    public List<Long> getProductIds() {
        return productIds;
    }

    public void setProductIds(List<Long> productIds) {
        this.productIds = productIds;
    }
}
