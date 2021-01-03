package com.salesystem.demo.dto;

import com.salesystem.demo.model.Product;
import com.salesystem.demo.model.User;

import java.util.List;

public class productSellDto {


    private List<Product> products;
    private User user;

    public productSellDto() {
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
