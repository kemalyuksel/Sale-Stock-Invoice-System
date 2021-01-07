package com.salesystem.demo.controller;

import com.salesystem.demo.model.Bill;
import com.salesystem.demo.model.Product;
import com.salesystem.demo.model.User;
import com.salesystem.demo.service.ProductService;
import com.salesystem.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String getAll(Model model, @Param("q") String q){

        List<Product> listProducts = productService.listAllProduct(q);
        model.addAttribute("products", listProducts);
        model.addAttribute("q", q);

        return "store";
    }






}
