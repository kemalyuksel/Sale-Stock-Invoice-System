package com.salesystem.demo.controller;

import com.salesystem.demo.model.Product;
import com.salesystem.demo.model.User;
import com.salesystem.demo.repository.ProductRepository;
import com.salesystem.demo.service.ProductService;
import com.salesystem.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;


    @RequestMapping("/products")
    public ModelAndView getAll(){

        ModelAndView mv = new ModelAndView();
        mv.setViewName("productList");
        mv.addObject("products",productService.listAllProduct());

        return mv;
    }

    @RequestMapping("/addProduct")
    public String productForm( Model model) {

        Product product=new Product();
        model.addAttribute("product", product);

        return "productForm";

    }

    @PostMapping("/createProductPost")
    public String addProduct(@ModelAttribute("productModel") Product product, Model model) {

        productService.save(product);

        return "redirect:/product/products";
    }

    @RequestMapping("/updateProduct/{id}")
    public String productUpdateForm(@PathVariable Long id, Model model) {

        Product updatedUser= productService.getById(id);

        model.addAttribute("updatedUser", updatedUser);

        return "productUpdateForm";

    }

    @PostMapping("/updateProductPost/{id}")
    public String updateProduct(@PathVariable Long id,Product product) {

        productService.updateProduct(id,product);

        return "redirect:/product/products";
    }



    @RequestMapping("/delete/{id}" )
    public String deleteProduct(@PathVariable Long id) {
        productService.delete(id);
        return "redirect:/product/products";
    }

    @RequestMapping("/deleteAll/{id}" )
    public String deleteAllProduct(@PathVariable Long id) {
        productService.deleteAll(id);
        return "redirect:/product/products";
    }

}
