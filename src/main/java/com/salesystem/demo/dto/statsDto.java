package com.salesystem.demo.dto;

import com.salesystem.demo.model.Product;

import java.util.List;

public class statsDto {


    private long totalOrders;
    private long totalProducts;
    private float totalPrice;
    private long totalCustomers;

    private List<Product> criticalProducts;

    public statsDto() {
    }

    public long getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(long totalOrders) {
        this.totalOrders = totalOrders;
    }

    public long getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(long totalProducts) {
        this.totalProducts = totalProducts;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public long getTotalCustomers() {
        return totalCustomers;
    }

    public void setTotalCustomers(long totalCustomers) {
        this.totalCustomers = totalCustomers;
    }

    public List<Product> getCriticalProducts() {
        return criticalProducts;
    }

    public void setCriticalProducts(List<Product> criticalProducts) {
        this.criticalProducts = criticalProducts;
    }
}
