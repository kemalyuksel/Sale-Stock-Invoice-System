package com.salesystem.demo.service;

import com.salesystem.demo.model.Product;
import com.salesystem.demo.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> listAllProduct() {
        return (List<Product>) productRepository.findAll();
    }

    public Product findByCode(String code){
        return productRepository.findByCode(code);
    }

    public void save(Product product) {

        Product existingProduct = findByCode(product.getCode());

        if(existingProduct != null){
            int quantity = existingProduct.getQuantity();
            quantity++;
            existingProduct.setQuantity(quantity);

            productRepository.save(existingProduct);
        }else{
            int quantity = product.getQuantity();
            quantity++;
            product.setQuantity(quantity);
            productRepository.save(product);
        }

    }

    public Product getById(Long id) {
        return productRepository.getOne(id);
    }

    public void delete(Long id) {

        Product product = getById(id);

        if(product.getQuantity() <= 1){
            productRepository.deleteById(id);
        }else{
            int quantity = product.getQuantity();
            quantity--;
            product.setQuantity(quantity);

            productRepository.save(product);
        }
    }

    public void deleteAll(Long id) {

        Product product = getById(id);

        productRepository.deleteById(id);
    }

    public void updateProduct(Long id,Product product){

        Product updated = getById(id);

        updated.setName(product.getName());
        updated.setPrice(product.getPrice());
        updated.setBrand(product.getBrand());
        updated.setPhotoUrl(product.getPhotoUrl());
        updated.setQuantity(product.getQuantity());
        updated.setCode(product.getCode());

        productRepository.save(updated);
    }



}
