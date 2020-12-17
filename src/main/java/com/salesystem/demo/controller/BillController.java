package com.salesystem.demo.controller;

import com.salesystem.demo.service.BillService;
import com.salesystem.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/bill")
public class BillController {

    @Autowired
    private BillService billService;

    @RequestMapping("/bills")
    public ModelAndView users(){

        ModelAndView mv = new ModelAndView();
        mv.setViewName("billList");
        mv.addObject("bills",billService.listAllBill());

        return mv;
    }

}
