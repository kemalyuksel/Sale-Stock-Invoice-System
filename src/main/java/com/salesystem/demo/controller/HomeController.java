package com.salesystem.demo.controller;

import com.salesystem.demo.model.Bill;
import com.salesystem.demo.model.User;
import com.salesystem.demo.service.BillService;
import com.salesystem.demo.service.ProductService;
import com.salesystem.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private BillService billService;

    @Autowired
    private UserService userService;


    @RequestMapping("/")
    public ModelAndView getAll(){

        ModelAndView mv = new ModelAndView();
        mv.setViewName("store");
        mv.addObject("products",productService.listAllProduct());

        return mv;
    }

    @RequestMapping("/orderList")
    public ModelAndView getAllBills(Principal principal){

        ModelAndView mv = new ModelAndView();
        User user = userService.getByUsername(principal.getName());

        List<Bill> orders = user.getBills();

        mv.setViewName("myorders");
        mv.addObject("orders",orders);

        return mv;
    }



}
