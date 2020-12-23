package com.salesystem.demo.repository;

import com.salesystem.demo.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {

    Product findByCode(String code);

    @Query("SELECT p FROM Product p WHERE CONCAT(p.name, p.brand) LIKE %?1%")
    public List<Product> search(String keyword);

}
