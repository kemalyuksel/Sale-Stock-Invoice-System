package com.salesystem.demo.controller;

import com.salesystem.demo.model.Product;
import com.salesystem.demo.model.User;
import com.salesystem.demo.repository.ProductRepository;
import com.salesystem.demo.service.ProductService;
import com.salesystem.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;


    @RequestMapping("/products")
    public String getAll(Model model, @Param("q") String q){


        List<Product> listProducts = productService.listAllProduct(q);
        model.addAttribute("products", listProducts);
        model.addAttribute("q", q);


        return "productList";
    }

    @RequestMapping("/addProduct")
    public ModelAndView productForm() {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productForm");

        modelAndView.addObject("product", new Product());

        return modelAndView;
    }

    @PostMapping("/createProductPost")
    public ModelAndView addProduct(@Valid @ModelAttribute("product")Product product , BindingResult bindingResult) {

        ModelAndView modelAndView = new ModelAndView();

        if(bindingResult.hasErrors()){
            modelAndView.setViewName("productForm");
            return modelAndView;
        }

        modelAndView.setViewName("redirect:/product/products");

        productService.save(product);

        return modelAndView;
    }

    @RequestMapping("/updateProduct/{id}")
    public String productUpdateForm(@PathVariable Long id, Model model) {

        Product updatedProduct= productService.getById(id);

        model.addAttribute("updatedProduct", updatedProduct);

        return "productUpdateForm";
    }

    @PostMapping("/updateProductPost/{id}")
    public String updateProduct(@PathVariable Long id,Product product) {

        productService.updateProduct(id,product);

        return "redirect:/product/products";
    }



    @RequestMapping("/deleteAll/{id}" )
    public String deleteAllProduct(@PathVariable Long id) {
        productService.deleteAll(id);
        return "redirect:/product/products";
    }

}
