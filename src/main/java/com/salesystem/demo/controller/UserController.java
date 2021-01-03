package com.salesystem.demo.controller;

import com.salesystem.demo.dto.productSellDto;
import com.salesystem.demo.model.Bill;
import com.salesystem.demo.model.Product;
import com.salesystem.demo.model.User;
import com.salesystem.demo.service.BillService;
import com.salesystem.demo.service.ProductService;
import com.salesystem.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private BillService billService;

    @RequestMapping("/customers")
    public ModelAndView users(){

        ModelAndView mv = new ModelAndView();
        mv.setViewName("customerList");
        mv.addObject("customers",userService.listAllUser());

        return mv;
    }


    @RequestMapping("/customerBills/{id}")
    public ModelAndView customerOrders(@PathVariable Long id){

        ModelAndView mv = new ModelAndView();

        mv.setViewName("customerOrders");
        mv.addObject("orders",billService.findUserBills(userService.getById(id)));

        return mv;
    }

    @RequestMapping("/invoice/{id}")
    public ModelAndView customerInvoice(@PathVariable Long id){

        ModelAndView mv = new ModelAndView();

        mv.setViewName("invoice");
        mv.addObject("bill",billService.findById(id));

        return mv;
    }

    @RequestMapping("/sellProduct")
    public String sellProduct(Principal principal, HttpSession session) {

        List<Product> products = (List<Product>)  session.getAttribute("Basket");

        productSellDto sellDto = new productSellDto();
        sellDto.setUser(userService.getByUsername(principal.getName()));
        sellDto.setProducts(products);

        billService.saveBill(sellDto);

        session.removeAttribute("Basket");

        return "redirect:/";
    }

    @RequestMapping("/addBasket/{id}")
    public String addBasket(@PathVariable Long id, HttpServletRequest request) {

        List<Product> products = (List<Product>) request.getSession().getAttribute("Basket");

        if (products == null) {
            products = new ArrayList<>();
            request.getSession().setAttribute("Basket", products);
        }

        products.add(productService.getById(id));
        request.getSession().setAttribute("Basket", products);

        return "redirect:/";
    }

    @RequestMapping("/myBasket")
    public String process(Model model, HttpSession session) {

        List<Product> products = (List<Product>)  session.getAttribute("Basket");

        if (products == null) {
            products = new ArrayList<>();
        }

        float totalPrice = 0;
        for (Product product : products){
            totalPrice +=product.getPrice();
        }

        model.addAttribute("basketProducts", products);
        model.addAttribute("totalPrice",totalPrice);

        return "basket";
    }


    @RequestMapping("/deleteItem/{id}")
    public String deleteCart(@PathVariable Long id, HttpSession session,HttpServletRequest request){

        List<Product> products = (List<Product>)  session.getAttribute("Basket");

        Product deletedProduct = products.stream().filter((product) -> product.getId() == id).findAny().get();

        products.remove(deletedProduct);

        request.getSession().setAttribute("Basket", products);

        return "redirect:/user/myBasket";
    }


    @RequestMapping("/destroy")
    public String deleteSession(HttpSession session) {

        session.removeAttribute("Basket");

        return "redirect:/user/myBasket";
    }



}
